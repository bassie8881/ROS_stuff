#include <ros/ros.h>
#include <geometry_msgs/Twist.h>
#include <nav_msgs/Odometry.h>

//set max linear, angular vels
#define X_MAX 0.3
#define Y_MAX 0.6/0.555

class ftlWC
{
  public: ftlWC();

  private:
	void pose_cb(const nav_msgs::Odometry::ConstPtr& target);

	ros::NodeHandle nh;
	ros::Publisher pub;
	ros::Subscriber sub;

	geometry_msgs::Twist drv_fwd,drv_rev, brake;
	double xdis;
};

ftlWC::ftlWC()
{
  this->brake.linear.x=this->brake.angular.z = this->drv_fwd.angular.z=this->drv_rev.angular.z = 0;
  this->drv_fwd.linear.x = X_MAX; this->drv_rev.linear.x = -X_MAX;

  this->sub = nh.subscribe("pose", 1, &ftlWC::pose_cb, this);
  this->pub = nh.advertise<geometry_msgs::Twist>("drive_rates", 1);
}

void ftlWC::pose_cb(const nav_msgs::Odometry::ConstPtr& target)
{
  xdis = target->pose.pose.position.x;
  ROS_INFO("target distance %d cm", xdis);

  if(xdis > 105) pub.publish(drv_fwd);
  else if(xdis < 95) pub.publish(drv_rev);
  else pub.publish(brake);
}

int main(int argc, char **argv)
{
  ros::init(argc, argv, "ftl_teleop");
  ftlWC ftlwc;
  ros::spin();
}
