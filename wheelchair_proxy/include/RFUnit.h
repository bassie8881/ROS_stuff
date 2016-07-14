#ifndef RFUNIT_H
#define RFUNIT_H

#include "rfu_ser.h"

//enable printf outputs
#define ENABLE_NORMAL_PRINT 0
#define ENABLE_WARN_PRINT 0

//port address (make sure .rules is working first)
#define RFU_Serial_Add "/dev/RFU"
#define RFU_Rate B9600

//output defines
#define RF_GO 1
#define RF_COMEBACK 2
#define RF_STOP 3
#define RF_ESTOP 4
#define RF_GOTO 5

//command processing
#define RF_CMD_INIT_BYTE 'x'
#define RF_CMD_CONFIRM_BYTE ' '
#define GOTO_BYTE 0
#define COMEBACK_BYTE 1
#define GO_BYTE 2
#define STOP_BYTE 3
#define ESTOP_BYTE 4

#define STEP_1 1
#define STEP_2 2
#define STEP_3 3
#define STEP_4 4

using namespace std;
class RFUnit
{
  public:
	RFUnit();
	virtual ~RFUnit();
	unsigned int read_RFU();

  private:
	SerialCom * RFU_ser;
	char serialPortName[20];
	int tempchar; char retbyte;
	unsigned int commandStep;
};

#endif
