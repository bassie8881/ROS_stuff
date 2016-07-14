/*By Maroun Boutayeh.
	Help from Tarek's Serial comm files, and the following guides:
	- http://www.faqs.org/docs/Linux-HOWTO/Serial-Programming-HOWTO.html
	- http://www.easysw.com/~mike/serial/serial.html
*/

#include "rfu_ser.h"

SerialCom::SerialCom(char * port, int rate) 
{
    // open the serial port
    //printf("\n HERE begin");  fflush(stdout);
	
	/* 
	  Open port for reading and writing and not as controlling tty
	  because we don't want to get killed if linenoise sends CTRL-C.
    */
    fd = open(port, O_RDWR | O_NOCTTY );
    if ( fd<0 )
    {
        fprintf(stderr, "Could not open serial device %s\n",port);
        return;
    }
	
	int flags = fcntl(fd, F_GETFL, 0);		//Copy the status of all file flags
	//Set the O_NONBLOCK file status flag to prevent blocking while reading
	if( -1 == fcntl(fd, F_SETFL, flags | O_NONBLOCK ) )
	{
        fprintf(stderr, "Could not set NONBLOCK file status flag\n");
    }	
	
    // save the current io settings
    tcgetattr(fd, &oldtio);


    //set up new settings
    struct termios newtio;
    bzero(&newtio, sizeof(newtio));		//clear struct for new port settings
    /*
		Set control mode flags
		----------------------
		CS8     : 8n1 (8bit,no parity,1 stopbit)
		CLOCAL  : local connection, no modem contol
		CREAD   : enable receiving characters
	*/
	newtio.c_cflag = CS8 | CLOCAL | CREAD;

    // No Parity
    newtio.c_cflag &= ~PARENB;
    // One Stop Bit
    newtio.c_cflag &= ~CSTOPB;
    // for 8-bit char, this prevents setting the MSB to zero
    newtio.c_iflag &= ~ISTRIP;

    // For soft Flow
    //newtio.c_iflag |= IXON|IXOFF;
    //newtio.c_cflag &= ~ CRTSCTS;
    // Start and stop characters
    //newtio.c_cc[VSTART] = 0x11; // ^q
    //newtio.c_cc[VSTOP]  = 0x13; // ^s

    // Ignore Parity errors
    newtio.c_iflag = IGNPAR;

    newtio.c_oflag = 0;		//Raw output
    newtio.c_lflag = 0;		//Do not set any local modes
    newtio.c_cc[VTIME] = 1;	//set timeout (in deciseconds) for read
    newtio.c_cc[VMIN]  = 1;	//blocking read until 1 character arrives
    
	// activate new settings
    tcflush(fd, TCIFLUSH);
	
	//Set read/write baud rate. Return upon error
    if (cfsetispeed(&newtio, rate) < 0 || cfsetospeed(&newtio, rate) < 0)
    {
        fprintf(stderr,"Failed to set serial baud rate: %d\n", rate);
        tcsetattr(fd, TCSANOW, &oldtio);	//restore old port settings
        close(fd);	//close file descriptor
        fd = -1;
        return;
    }
	
	//Activate new settings for port
    tcsetattr(fd, TCSANOW, &newtio);
	
    // clear the input buffer in case junk data is on the port
    usleep(10000);
    tcflush(fd, TCIFLUSH);
	
    flags = fcntl(fd, F_GETFL, 0);	//Copy the status of all file flags
	
	//Clear the O_NONBLOCK file status flag
    //if( -1 == fcntl(fd, F_SETFL,flags & ~O_NONBLOCK ) )
    //{
    //   fprintf(stderr, "Could not clear NONBLOCK file status flag\n");
    //}
    //printf("\n HERE begin");  fflush(stdout);
}

SerialCom::~SerialCom() 
{
    //restore old port settings
    if (fd > 0) {
        tcsetattr(fd, TCSANOW, &oldtio);
        close(fd);
    }
}

void SerialCom::Flush(void) 
{
    tcflush(fd, TCIOFLUSH);
}

int SerialCom::ReadByte(char *buf) 
{
    char temp;
    temp = read(fd,buf,1);
    return temp;
}

int SerialCom::Read(unsigned int *buf,int size) 
{
    char temp;
    for(int i=0;i<size;i++)
    {
        if((temp = read(fd,&buf[i],1))==-1)
            return -1;
    }
    return size;
}

void SerialCom::WriteByte(char buf) 
{
    write(fd,&buf,1);
}

void SerialCom::Write(char buf[], int numChars) 
{
    write(fd,buf,numChars);
}
