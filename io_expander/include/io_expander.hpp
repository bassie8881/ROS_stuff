#include <stdio.h>
#include <sys/types.h>
#include "hidapi.h"
#include "ros/ros.h"
#include "std_msgs/Int32.h"
#include <string>
#include <io_expander/io_read.h>
#include <io_expander/io_write.h>

//function prototypes
void io_cb(const io_expander::io_write& msg);
hid_device* dev_open();
void closeDevice(hid_device *device);
void checkmSec(int msec);
int rwUSB(hid_device *device);
void read_port();
void write_port();
void initialise();

//pointer to device interface
hid_device *device;

//ros publishers
ros::Publisher iox_pub_;

//ros subscribers
ros::Subscriber iox_sub_;

//ros variables
//std_msgs::Int32 io_data_;
io_expander::io_write io_write_;
io_expander::io_read io_read_;