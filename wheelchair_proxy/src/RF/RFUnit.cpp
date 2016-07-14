#include "RFUnit.h"

RFUnit::RFUnit()
{
  RFU_ser = NULL;
  strncpy(serialPortName, RFU_Serial_Add, sizeof(serialPortName));
  RFU_ser = new SerialCom(serialPortName, RFU_Rate);
  fflush(stdout);

  commandStep = STEP_1;
  printf("RF Unit initialized \n");
}

RFUnit::~RFUnit()
{
  fflush(stdout);
  delete RFU_ser; RFU_ser = NULL;
}

unsigned int RFUnit::read_RFU()
{
	retbyte = 0;
	tempchar = RFU_ser->ReadByte(&retbyte); 
	
	//If read failed, return 0, otherwise continue command recognition process
	if(!tempchar) return 0;
	else
	{
		//Switch to the correct command recognition step
		switch(commandStep)
		{
		case STEP_1:
			//If the command initialisation byte is recieved, then increment the command recongition process
			if(retbyte == RF_CMD_INIT_BYTE) 
			{
				commandStep++;
				if(ENABLE_NORMAL_PRINT) printf("Initial command byte received \n");
			}
			return 0;
			break;
		case STEP_2:
			//If confirmation byte is recieved, increment command recognition process. Otherwise, reset recognition process
			if(retbyte == RF_CMD_CONFIRM_BYTE) 
			{
				commandStep++;
				if(ENABLE_NORMAL_PRINT) printf("1st confirmation byte received \n");
			}
			else
			{
				if(ENABLE_WARN_PRINT) printf("Did not receive 1st confirmation byte \n");
				commandStep = STEP_1;
			}
			return 0;
			break;
		case STEP_3:
			//If the command byte received is known, increment command recongition process. Otherwise, reset recognition process
			if(retbyte == GOTO_BYTE) 
			{
				if(ENABLE_NORMAL_PRINT) printf("'GOTO' byte received \n");
				commandStep++; return RF_GOTO;
			}
			else if(retbyte == COMEBACK_BYTE)
			{
				if(ENABLE_NORMAL_PRINT) printf("'COMEBACK' byte received \n");
				commandStep++; return RF_COMEBACK;
			}
			else if(retbyte == GO_BYTE)
			{
				if(ENABLE_NORMAL_PRINT) printf("'GO' byte received \n");
				commandStep++; return RF_GO;
			}
			else if(retbyte == STOP_BYTE)
			{
				if(ENABLE_NORMAL_PRINT) printf("'STOP' byte received \n");
				commandStep++; return RF_STOP;
			}
			else if(retbyte == ESTOP_BYTE)
			{
				if(ENABLE_NORMAL_PRINT) printf("'E-STOP' byte received \n");
				commandStep++; return RF_ESTOP;
			}
			else
			{
				if(ENABLE_WARN_PRINT) printf("Unknown: %d", retbyte);
				commandStep++; return 0;
			}
			break;
		case STEP_4:
			//Check to see if confirmation byte is received. Reset recognition process
			if(retbyte == RF_CMD_CONFIRM_BYTE) 
			{
				if(ENABLE_NORMAL_PRINT) printf("2nd confirmation byte received");
			}
			else
			{
				if(ENABLE_WARN_PRINT) printf("Did not receive 2nd confirmation byte");
			}
			commandStep = STEP_1;
			return 0;
			break;

		//Default action is to reset the recognition process
		default:
			commandStep = STEP_1;
			return 0;
			break;
		}
	}
}
