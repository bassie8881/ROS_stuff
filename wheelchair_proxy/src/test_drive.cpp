#include <ros/ros.h>
#include <geometry_msgs/Twist.h>
#include <nav_msgs/Odometry.h>

ros::Publisher pub;
bool goal_reached = 0, moving = 1;

void odom_cb(const nav_msgs::Odometry::ConstPtr& msg)
{
  if(msg->pose.pose.position.x >= 2.0) goal_reached = 1;
  if(goal_reached && msg->twist.twist.linear.x == 0) moving = 0;
  //ROS_INFO("%f %f at v = %f", msg->pose.pose.position.x,msg->pose.pose.position.y, msg->twist.twist.linear.x);
}

int main(int argc, char **argv)
{
  ros::init(argc, argv, "wc_tester"); 
  ros::NodeHandle nh; 

  geometry_msgs::Twist twisty;
  ros::Publisher pub = nh.advertise<geometry_msgs::Twist>("cmd_vel", 1);
  ros::Subscriber sub = nh.subscribe("odom", 1, odom_cb);

  while(ros::ok() && !goal_reached)
  {
	twisty.linear.x = 0.25; twisty.angular.z = 0.0;
	pub.publish(twisty);
	ros::spinOnce();
  }
  ROS_INFO("STOPPING");
  while(moving)
  {
	twisty.linear.x = 0;
	pub.publish(twisty);
  }
}
