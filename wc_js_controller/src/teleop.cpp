#include <ros/ros.h>
#include <sensor_msgs/Joy.h>
#include <geometry_msgs/Twist.h>
#include <nav_msgs/Odometry.h>

//set max linear, angular vels
#define X_MAX 0.3
#define Y_MAX 0.6/0.555

class TeleopWC
{
  public: TeleopWC();

  private:
	void joy_cb(const sensor_msgs::Joy::ConstPtr& msg);
	void odom_cb(const nav_msgs::Odometry::ConstPtr& odom);

	ros::NodeHandle nh;
	ros::Subscriber sub, sub1;
	ros::Publisher pub;

	geometry_msgs::Twist vels;
};

TeleopWC::TeleopWC()
{
  this->pub = nh.advertise<geometry_msgs::Twist>("drive_rates", 1);
  this->sub = nh.subscribe("joy", 1, &TeleopWC::joy_cb, this);
  this->sub1 = nh.subscribe("odometry", 1, &TeleopWC::odom_cb, this);
}

void TeleopWC::joy_cb(const sensor_msgs::Joy::ConstPtr& msg)
{
  vels.linear.x = msg->axes[1] * X_MAX;
  vels.angular.z = msg->axes[0] * Y_MAX;

  pub.publish(vels);
}

void TeleopWC::odom_cb(const nav_msgs::Odometry::ConstPtr& odom)
{
  ROS_INFO("Pos X: %f Y: %f", odom->pose.pose.position.x, odom->pose.pose.position.y);
}

int main(int argc, char **argv)
{
  ros::init(argc, argv, "wc_teleop");
  TeleopWC teleop_wc;
  ros::spin();
}
