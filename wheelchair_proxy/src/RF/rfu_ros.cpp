#include <ros/ros.h>
#include <std_msgs/Int32.h>
#include "RFUnit.h"

int main(int argc, char** argv) 
{
  ros::init(argc, argv, "rfu_wrapper");
  ros::NodeHandle nh;

  ros::Publisher pub = nh.advertise<std_msgs::Int32>("RFU", 1);
  std_msgs::Int32 rfu_out;

  RFUnit rfu;

  ros::Rate r(100);
  while(ros::ok())
  {
	  rfu_out.data = rfu.read_RFU();
	  if(rfu_out.data > 0) pub.publish(rfu_out);
	  r.sleep();
  }
  return 0;
}
