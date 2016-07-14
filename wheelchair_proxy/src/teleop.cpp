#include <ros/ros.h>
#include <sensor_msgs/Joy.h>
#include <geometry_msgs/Twist.h>

//set max linear, angular vels
#define X_MAX 1.3
#define Y_MAX 1.5

class TeleopWC
{
  public:
	TeleopWC();
	void spin();

  private:
	void wcJoy_cb(const sensor_msgs::Joy::ConstPtr& msg);

	ros::NodeHandle nh;
	ros::Subscriber sub;
	ros::Publisher pub;	geometry_msgs::Twist vels, brake;

	double last_joy_cmd;
};

TeleopWC::TeleopWC()
{
  this->pub = nh.advertise<geometry_msgs::Twist>("cmd_vel", 1);
  this->sub = nh.subscribe("joy", 1, &TeleopWC::wcJoy_cb, this);
}

void TeleopWC::wcJoy_cb(const sensor_msgs::Joy::ConstPtr& msg)
{
  vels.linear.x = msg->axes[1] * X_MAX;
  vels.angular.z = msg->axes[0] * Y_MAX;
  if(vels.linear.x<0) vels.angular.z *= -1;

  pub.publish(vels); last_joy_cmd = ros::Time::now().toSec();
}

void TeleopWC::spin(void)
{
  brake.linear.x = brake.angular.z = 0;
  ros::Rate rate(20);

  while(ros::ok())
  {
	  //brake if no joystick input for some time
	  ros::spinOnce();
	  if(ros::Time::now().toSec()-last_joy_cmd > 0.5)
	    pub.publish(brake);
	  rate.sleep();
  }
}

int main(int argc, char **argv)
{
  ros::init(argc, argv, "wc_teleop");
  TeleopWC teleop_wc; teleop_wc.spin();
  return 0;
}
