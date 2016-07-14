#include "wheelchair.h"

WheelChair::WheelChair()
{
    leftEncoder = NULL; rightEncoder = NULL;
    strncpy(leftEncoderPort ,Left_Encoder_Port, sizeof(leftEncoderPort));
    strncpy(rightEncoderPort,Right_Encoder_Port, sizeof(rightEncoderPort));
    strncpy(serialPortName, Serial_Port, sizeof(serialPortName));
    strncpy(encoderRateTemp,Encoder_Baud_Rate, sizeof(encoderRateTemp));
    strncpy(serialRateTemp,Serial_Baud_Rate, sizeof(serialRateTemp));
    
    setEncoderRate();
    setSerialRate();
    
    //controlUnit = new SerialCom((char *)SHRD_DEFAULT_PORT,SHRD_DEFAULT_RATE);
    //leftEncoder  = new WheelEncoder((char *)ENCL_DEFAULT_PORT, ENC_DEFAULT_RATE);
    //rightEncoder = new WheelEncoder((char *)ENCR_DEFAULT_PORT, ENC_DEFAULT_RATE);
    
    leftEncoder  = new WheelEncoder(leftEncoderPort , encoderRate);
    rightEncoder = new WheelEncoder(rightEncoderPort, encoderRate);
    controlUnit  = new SerialCom(serialPortName,serialRate);
    fflush(stdout);
    this->power = false;
}

void WheelChair::setEncoderRate()
{
      if(encoderRateTemp[1] == ('1')) 
      {
	if (encoderRateTemp[2] == ('1')) encoderRate = B115200;
	else encoderRate = B19200;
      }
      else if(encoderRateTemp[1] == ('2')) encoderRate = B2400;
      else if(encoderRateTemp[1] == ('3')) encoderRate = B38400;
      else if(encoderRateTemp[1] == ('4')) encoderRate = B4800;
      else if(encoderRateTemp[1] == ('5')) encoderRate = B57600;
      else if(encoderRateTemp[1] == ('9')) encoderRate = ENC_DEFAULT_RATE;   
      /*
      B2400 = 11                
      B4800 = 12
      B9600 = 13
      B19200 = 14
      B38400 = 15
      B57600 = 4097
      B115200 = 4098
      */
}

void WheelChair::setSerialRate()
{
      if(serialRateTemp[1] == ('1')) 
      {
	if (serialRateTemp[2] == ('1')) serialRate = SHRD_DEFAULT_RATE;
	else serialRate = B19200;
      }
      else if(serialRateTemp[1] == ('2')) serialRate = B2400;
      else if(serialRateTemp[1] == ('3')) serialRate = B38400;
      else if(serialRateTemp[1] == ('4')) serialRate = B4800;
      else if(serialRateTemp[1] == ('5')) serialRate = B57600;
      else if(serialRateTemp[1] == ('9')) serialRate = B9600;   
}

int WheelChair::getLeftTicks()
{
    return leftEncoder->GetTicks();
}

int WheelChair::getRightTicks()
{
    return rightEncoder->GetTicks();
}



WheelChair::~WheelChair()
{
    puts("\n- Shutting Down WheelChair Driver");
	WheelChair::driveMotors(0,0);
	WheelChair::sendCommand(SETMODE,MANUAL);
    //	unsigned int retbyte;
    //Resetting Motor and Joystick Voltages//
    /*
	controlUnit->Write("O0000\r", 6);
	controlUnit->ReadByte(&retbyte);
	controlUnit->ReadByte(&retbyte);
	controlUnit->Write("L0800\r", 6);
	controlUnit->ReadByte(&retbyte);
	controlUnit->ReadByte(&retbyte);
	controlUnit->Write("L1800\r", 6);
	controlUnit->ReadByte(&retbyte);
	controlUnit->ReadByte(&retbyte);
*/
    cout <<"\n--->> WheelChair's Power is turned OFF\n";
    fflush(stdout);
    delete controlUnit;
    delete leftEncoder;
    delete rightEncoder;
    controlUnit = NULL;
    leftEncoder = NULL;
    rightEncoder= NULL;
}

int WheelChair :: resetUnit()
{
    unsigned int retbyte;
    printf("\nResetting unit"); fflush(stdout);
    if (controlUnit->SendCommand((char*)"O0000") != 0) //Reset output and wait response
    {
        ROS_ERROR("\n	-->Failed to find Wheelchair Interface Unit");
        return -1;
    }
    else
        puts("\n- Wheelchair Interface Unit Found and Reset");
    controlUnit->ReadByte(&retbyte);
    if (controlUnit->SendCommand((char*)"L0800") != 0) //Set fwd/rev to 2.5v
    {
        ROS_ERROR("\n	-->Failed to set fwd/rev voltage to 2.5V");
        return -1;
    }
    else
        puts("		+ Forward/Reverse Voltage was successfully set to 2.5V");

    if (controlUnit->SendCommand((char*)"L1800") != 0) //Set left/right to 2.5v
    {
        ROS_ERROR("\n	-->Failed to set l/r voltage to 2.5V");
        return -1;
    }
    else
        puts("		+ Left/Right Voltage was successfully set to 2.5V");
    printf("-->Unit Reset"); fflush(stdout);
    return 0;
};

int WheelChair::sendCommand(int WCcmd, bool param) 
{
    static unsigned char status;
    unsigned int retBytes[7];
    char cmd[7];
    unsigned int retbyte, retbyte2;
    int voltageReadings,a,e;
    switch (WCcmd)
    {
    case POWER:
        while((a=getReading('A'))==-1);{usleep(SLEEP);}
        while((e=getReading('E'))==-1);{usleep(SLEEP);}
        voltageReadings = a + e;
        //printf("\n Voltage Readings=%d",voltageReadings); fflush(stdout);
        if ( voltageReadings > 2000)
            power = true;
        else
            power = false;

        if ((power && param) || (!power && !param)) // Same power state -> nothing to change
            break;
        if((!power && param) || (power && !param))
        {
            while(controlUnit->SendCommand((char*)"O0008") != 0) {usleep(SLEEP);}
            usleep(SLEEP);
            while(controlUnit->SendCommand((char*)"O0000") != 0) {usleep(SLEEP);}
            (power)?power = false:power = true;
        }
        //printf("\nPower is:%d\n",power); fflush(stdout);
        break;

    case SETMODE:
        sprintf(cmd, "U8\r");
        controlUnit->Write(cmd, 3);
        printf("\n	+-->Processing Set Mode Request !!!");
        controlUnit->Read(retBytes,6);
        if ((char)retBytes[0] != 'U')
        {
            printf("\nReturned: .%c.\n",(char)retbyte);
            ROS_ERROR("Failed to read auto/man status from Wheelchair Interface Unit\n");
            return -1;
        }

        if (((char)retBytes[2] == '0' && param) || ((char)retBytes[2] != '0' && !param))
        {
            // we need to toggle the mode
            if(controlUnit->SendCommand((char*)"O0020") != 0)
            {
                ROS_ERROR("Failed to set mode\n");
                controlUnit->SendCommand((char*)"O0000");
                return -1;
            }
            usleep(LATCHDELAY);
            if(controlUnit->SendCommand((char*)"O0000") != 0)
            {
                ROS_ERROR("Failed to set mode\n");
                return -1;
            }
        }
        break;
    case GEAR:
        printf("\n	+-->Processing Gear Request /");
        if (param)
        {
            printf(" Going one Gear UP");
            // Gear up
            status |= 0x02;
            sprintf(cmd,"O00%02X", status);
            if(controlUnit->SendCommand(cmd)!=0)
            {
                ROS_ERROR("Failed to increment gear\n");
                return -1;
            }
            usleep(SLEEP);
            usleep(SLEEP);
            usleep(SLEEP);
            status &= ~0x02;
            sprintf(cmd,"O00%02X", status);
            if(controlUnit->SendCommand(cmd)!=0)
            {
                ROS_ERROR("Failed to increment gear\n");
                return -1;
            }
        }
        else
        {
            // Gear down
            printf(" Going one Gear DOWN");
            status |= 0x01;
            sprintf(cmd,"O00%02X", status);
            if(controlUnit->SendCommand(cmd)!=0)
            {
                ROS_ERROR("Failed to decrement gear\n");
                return -1;
            }
            usleep(SLEEP);
            usleep(SLEEP);
            usleep(SLEEP);
            status &= ~0x01;
            sprintf(cmd,"O00%02X", status);
            if(controlUnit->SendCommand(cmd)!=0)
            {
                ROS_ERROR("Failed to decrement gear\n");
                return -1;
            }
        }
        break;
    case HORN:
        printf("\n	+-->Processing Horn Request !!!");
        //if (param)
        {
            // Turn horn on
            status |= 0x04;
            sprintf(cmd,"O00%02X", status);
            if(controlUnit->SendCommand(cmd)!=0)
            {
                ROS_ERROR("Failed to enable horn\n");
                return -1;
            }
        }
        //else
        usleep(100000);
        {
            // Turn horn off
            status &= ~0x04;
            sprintf(cmd,"O00%02X", status);
            if(controlUnit->SendCommand(cmd)!=0)
            {
                ROS_ERROR("Failed to disable horn\n");
                return -1;
            }
        }
        break;
    case GETMODE:
        //printf("\n	+-->Processing Get Mode Request ->");
        sprintf(cmd, "U8\r");
        controlUnit->Write(cmd, 3);
        controlUnit->ReadByte(&retbyte);
        if ((char)retbyte != 'U')
        {
            ROS_ERROR("\n	-->Failed to read auto/man status from Wheelchair Interface Unit\n");
            return -1;
        }
        controlUnit->ReadByte(&retbyte);
        controlUnit->ReadByte(&retbyte2);
        controlUnit->ReadByte(&retbyte);
        controlUnit->ReadByte(&retbyte);
        controlUnit->ReadByte(&retbyte);

        if ((char)retbyte2 == '0')
        {
            //printf("Control is  Manual");
            return (int) MANUAL;
        }
        else
        {
            //printf("Control is  Automatic");
            return (int) AUTO;
        }
        break;
    default:
        ROS_ERROR("Unknown command");
        return -1;
    }
    return 0;
};

int WheelChair::getReading(char channel)
{
    int count = 0;
    unsigned int readingValue[8];
    unsigned int Position = 0;
	fflush(stdout);
    controlUnit->WriteByte('U'); controlUnit->WriteByte(channel); controlUnit->WriteByte(13);
    count = controlUnit->Read(readingValue,6);
    /*for(int i=0;i<count;i++)
	{
		printf("%c",readingValue[i]);
	}*/
    if(count!=6 || (readingValue[0]&=0x000000ff)!='U')
        return -1;

    readingValue[2]&=0x000000ff;readingValue[3]&=0x000000ff;readingValue[4]&=0x000000ff;
    //	printf("\nBefore Conv %d %d %d",readingValue[2],readingValue[3],readingValue[4]);
    readingValue[2]-=48; if(readingValue[2]>9) readingValue[2]-=7;
    Position |= (readingValue[2]<<8);
    //	printf("\n Converted Value is:%d",Position);
    readingValue[3]-=48; if(readingValue[3]>9) readingValue[3]-=7;
    Position |= (readingValue[3]<<4);
    //	printf(" Converted Value is:%d",Position);
    readingValue[4]-=48; if(readingValue[4]>9) readingValue[4]-=7;
    Position |= (readingValue[4]);
    //	printf(" Converted Value is:%d",Position);
    return Position;
};

/*!
 * Gear one (1) curve fitting voltage function, it applies to speeds between [-0.2 0.33] m/sec only
 */
void WheelChair::driveMotors(double xspeed, double yawspeed) 
{
    double yawval, xval;
    char cmd[7];
    if ((xspeed != oldxspeed) || (yawspeed != oldyaw))
    {
        oldxspeed = xspeed;
        oldyaw = yawspeed;
        // Boundary Checking, Joystick Blocks if voltage limits are exceeded
        if(xspeed > 0.33)
        {
            xval = 2800.0;
        }
        else if(xspeed < -0.2)
        {
            xval = 850.0;
        }
        else if (xspeed == 0.0)
        {
            xval = 2028.0;
        }
        else
        {
            //trying to save computational time by avoiding pow math function
            xval = -14217*xspeed*xspeed*xspeed-1875.5*xspeed*xspeed + 5652.2*xspeed + 1948.7;
            if (xval > 2800.0)
                xval=2800.0;
            else if (xval < 850.0)
                xval= 850.0;
        }
        if(yawspeed < -1.7)
        {
            yawval = 2800.0;
        }
        else if (yawspeed == 0.0 )
        {
             yawval = 2044.0;
        }
        else
        {
            //trying to save computational time by avoiding pow math function
            yawval   = 183.44*yawspeed*yawspeed*yawspeed - 19.158*yawspeed*yawspeed - 1147.5*yawspeed + 2019.6;
            if (yawval > 2800.0   )
            {
                yawval   = 2800.0;
            }
            else if (yawval <  850.0 )
            {
                yawval   = 850.0;
            }
        }
        sprintf(cmd, "L1%03X", (int)yawval);
        controlUnit->SendCommand(cmd);
        sprintf(cmd, "L0%03X", (int)xval);
        controlUnit->SendCommand(cmd);
        //		printf("\n Xspeed=%.3f Xval=%.3f Yspeed=%.3f Yval=%.3f",xspeed,xval,yawspeed,yawval);
        fflush(stdout);
    }
};

void WheelChair::driveMotors2(double xspeed, double yawspeed)
{
    double yawval, xval;
    char cmd[7];
    if ((xspeed != oldxspeed) || (yawspeed != oldyaw))
    {
        oldxspeed = xspeed;
        oldyaw = yawspeed;
        // Boundary Checking, Joystick Blocks if voltage limits are exceeded
        if(xspeed > 1.0)
        {
            xval = 3170.0;
        }
        else if(xspeed < -0.5)
        {
            xval = 1020.0;
        }
        else if (xspeed == 0.0)
        {
            xval = 2040.0;
        }
        else
        {
            //trying to save computational time by avoiding pow math function
            xval = 19.7*xspeed*xspeed*xspeed-427.2*xspeed*xspeed + 1597.2*xspeed + 1993.7;
            if (xval > 3170.0)
                xval=3170.0;
            else if (xval < 1020.0)
                xval= 1020.0;
        }
        if(yawspeed < -1.0)
        {
            yawval = 3129.0;
        }
		else if(yawspeed > 1.0)
			yawval = 780.0;
        else if (yawspeed == 0.0 )
        {
             yawval = 2000.0;
        }
        else
        {
            //trying to save computational time by avoiding pow math function
            yawval   = 524.3*yawspeed*yawspeed*yawspeed - 163.3*yawspeed*yawspeed - 1858.8*yawspeed + 1917.5;
            if (yawval > 3129.0   )
            {
                yawval   = 3129.0;
            }
            else if (yawval <  780.0 )
            {
                yawval   = 780.0;
            }
        }
        sprintf(cmd, "L1%03X", (int)yawval);
        controlUnit->SendCommand(cmd);
        sprintf(cmd, "L0%03X", (int)xval);
        controlUnit->SendCommand(cmd);
        //		printf("\n Xspeed=%.3f Xval=%.3f Yspeed=%.3f Yval=%.3f",xspeed,xval,yawspeed,yawval);
        fflush(stdout);
    }
};

void WheelChair::driveMotors_direct(int xval, int yawval)
{
	//allows direct input of joystick values
	if ((xval != oldxspeed) || (yawval != oldyaw))
    {
		oldxspeed = xval; oldyaw = yawval;
		char cmd[7];

		sprintf(cmd, "L1%03X", (int)yawval);
        controlUnit->SendCommand(cmd);
        sprintf(cmd, "L0%03X", (int)xval);
        controlUnit->SendCommand(cmd);
        fflush(stdout);
	}
};

float WheelChair::linj(int in)
{
  if(in>dzpx && in<dznx) return 0.0;
  else if(in<dzpx)
  {
	  if(in<=joy_maxx) return 1.0;
	  else return (datum_joyx-in)/(float)dpx;
  }
  else
  {
	  if(in>=joy_minx) return -1.0;
	  else return (datum_joyx-in)/(float)dnx;
  }
};

float WheelChair::angj(int in)
{
  if(in>dzpy && in<dzny) return 0.0;
  else if(in<dzpy)
  {
	  if(in<=joy_maxy) return 1.0;
	  else return (datum_joyy-in)/(float)dpy;
  }
  else
  {
	  if(in>=joy_miny) return -1.0;
	  else return (datum_joyy-in)/(float)dny;
  }
};
