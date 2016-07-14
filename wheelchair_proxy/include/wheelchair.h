#ifndef WHEELCHAIR_H_
#define WHEELCHAIR_H_

#include "defs.h"
#include <cstdlib>

using namespace std;

class WheelChair
{
public:
    WheelChair();
    virtual ~WheelChair();
    int getLeftTicks();
    int getRightTicks();
    int resetUnit();
    int sendCommand(int WCcmd, bool param);
    int getReading(char Channel);
    void driveMotors(double xspeed, double yawspeed);
    void driveMotors2(double xspeed, double yawspeed);
    void driveMotors_direct(int xval, int yawval);

    float linj(int in);
    float angj(int in);
	int datum_joyx,datum_joyy, joy_maxx,joy_minx, joy_maxy,joy_miny;
	float dz; int dzpx,dznx,dpx,dnx, dzpy,dzny,dpy,dny;

private:
    WheelEncoder * leftEncoder, * rightEncoder;
    SerialCom * controlUnit;
    char serialPortName[MAX_FILENAME_SIZE];
    
    void setSerialRate();
    void setEncoderRate();
    
    int  serialRate,encoderRate;
    char serialRateTemp[MAX_FILENAME_SIZE];
    char encoderRateTemp[MAX_FILENAME_SIZE];
    
    char leftEncoderPort[MAX_FILENAME_SIZE];
    char rightEncoderPort[MAX_FILENAME_SIZE];
    double oldxspeed,oldyaw;
    bool power;
};

#endif /*WHEELCHAIR_H_*/
