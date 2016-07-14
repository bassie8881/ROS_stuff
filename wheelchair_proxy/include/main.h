#ifndef MAIN_H
#define MAIN_H

//node includes
#include <std_msgs/Empty.h>
#include <std_msgs/Int32MultiArray.h>
#include <std_msgs/Int32.h>
#include <geometry_msgs/Twist.h>
#include <sensor_msgs/Joy.h>
#include <boost/thread.hpp>
#include <nav_msgs/Odometry.h>
//driver include
#include "wheelchair.h"
#include <tf/transform_datatypes.h>
#include <tf/transform_broadcaster.h>

//node defines
#define SPIN_HZ 20

namespace wheelchair
{
  class WheelchairROS
  {
  public:
	//wheelchair constructor
	WheelchairROS(ros::NodeHandle* n);
	//destructor
	~WheelchairROS() {}
	//spins the node
	void spinner();

	//callbacks and public prototypes
	void drive(const geometry_msgs::Twist::ConstPtr& twist);
	void RFU_cb(const std_msgs::Int32::ConstPtr& n);
	void update_movement();

	int gear;
	//calibration
	bool calib; int ns_ac_,dz_, calprev,caltemp;

  private:
	//communication point between this node and ROS
	ros::NodeHandle* nh;
	//use for data to and from wheelchair
	WheelChair wc;

	//pubs, subs, msgs
	ros::Publisher wc_odom, joy_out;
	nav_msgs::Odometry odom2D; sensor_msgs::Joy joy;
	ros::Subscriber x_yaw_speeds, rfu_sub;

	//Odometry variables
	tf::TransformBroadcaster odom_broadcaster;
	geometry_msgs::TransformStamped odom_trans;
	void send_tf();
	double prev_time,delta_t, d_l,d_r,linear_d, turn_r, delta_yaw,yaw_inc;
	int ticks_l,ticks_r, delta_l,delta_r, last_l,last_r;

	//movement variables
	ros::Time last_drive_command; bool rfu_stop;
  };
}

#endif
