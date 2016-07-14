#include "io_expander.hpp"

unsigned char buf[65];

//open the usb device - must have root privledges, fix this..
hid_device* dev_open() 
{
	hid_device *device;
	device = hid_open(0x04D8, 0x003F, NULL);

	if(device) 
	{
		ROS_INFO("HID Device opened");
		hid_set_nonblocking(device, 1);
	} else
		ROS_ERROR("HID Device open failed");

	return device;
}

//closes usb device connection
void closeDevice(hid_device *device) 
{
	hid_close(device);
}

void checkmSec(int msec) 
{
	struct timeval ts, te;
	long tdiff, sec, ms;

	gettimeofday(&ts, NULL);

	while(1) 
	{
		gettimeofday(&te, NULL);
		tdiff = (1000000*(te.tv_sec - ts.tv_sec)) + (te.tv_usec - ts.tv_usec);
		ms = tdiff / 1000;
		if(ms > msec)
			break;
	}
}

//function writes commands to the io_board and reads the response - stores in buf
int rwUSB(hid_device *device) 
{
	int getRval = 0;
	if(hid_write(device, buf, sizeof(buf)) == -1) 
	{
		closeDevice(device);
		return -1;
	}

	checkmSec(50);

	if(hid_read(device, buf, sizeof(buf)) == -1) 
	{
		closeDevice(device);
		return -1;
	}

	if(buf[0] == 0x98) 
	{
		getRval = buf[1];
		//ROS_INFO("Got value (0x%x) at PORTA", getRval);
	}
	return getRval;
}

//waits for status msg on io_write, reads user input and outputs status
//#TODO needs to be improved
void io_cb(const io_expander::io_write& msg)
{
	io_write_ = msg;

	read_port();

	write_port();
}

void initialise(int argc, char **argv)
{
	//initialise ros
	ros::init(argc, argv, "io_expander");
	ros::NodeHandle nh;
	ROS_INFO("Starting IO_Expander Node");
	
	//setup publisher/subscriber
	iox_pub_ = nh.advertise<io_expander::io_read>("io_read", 1);
	iox_sub_ = nh.subscribe("io_write", 1, io_cb);

	//open usb_io device
	device = dev_open();
	if(!device)
		ROS_ERROR("Failed to initialise USB_IO, check ReadMe.");
	//system("clear");

	ROS_INFO("Initialisation Complete. Publishing to io_data."); 
}

//run the main ros_node program
int main(int argc, char **argv)
{
	initialise(argc, argv);

	ros::spin();

	ROS_INFO("Closing IO_Expander Node");
	closeDevice(device);
}

//#TODO make variable port arguements - currently reads portA
void read_port()
{
	//clear the buffer memory for new command/data
	buf[0] = 0x00;
	memset((void*)&buf[2], 0x00, sizeof(buf) - 2);

	//cmd to read a specific register - 0x80 = PORTA
	buf[0] = 0x98;
	buf[10] = 0x80;

	int msg = rwUSB(device);
	io_read_.data = msg;

	//publish io readings
	iox_pub_.publish(io_read_);
}

void write_port()
{
	//clear the buffer memory for new command/data
	buf[0] = 0x00;
	memset((void*)&buf[2], 0x00, sizeof(buf) - 2);

	//cmd to set specific register
	buf[0] = 0x99;
	buf[10] = 0x83;

	unsigned char cmd = io_write_.data;

	//the value to set the register
	buf[11] = cmd;

	//send command to io_expander
	int ret_val = rwUSB(device);
}