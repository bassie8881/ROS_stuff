#include "main.h"

using namespace wheelchair;

WheelchairROS::WheelchairROS(ros::NodeHandle* n)
  : nh(n), wc()
{
  ros::NodeHandle publicNodeHandle;
  this->wc_odom = publicNodeHandle.advertise<nav_msgs::Odometry>("odom", 1);
  this->joy_out = publicNodeHandle.advertise<sensor_msgs::Joy>("joy", 1);

  this->x_yaw_speeds = publicNodeHandle.subscribe("cmd_vel", 1, &WheelchairROS::drive, this);
  this->rfu_sub = publicNodeHandle.subscribe("RFU", 1, &WheelchairROS::RFU_cb, this);

  this->odom2D.pose.pose.position.x=this->odom2D.pose.pose.position.y=this->odom2D.pose.pose.position.z=0;
  this->odom_trans.header.frame_id = this->odom2D.header.frame_id = "odom";
//  this->odom_trans.child_frame_id = this->odom2D.child_frame_id = "base_link"; 
  this->odom_trans.child_frame_id = this->odom2D.child_frame_id = "base_footprint"; 
  this->yaw_inc = 0; this->prev_time = ros::Time::now().toSec();
  this->rfu_stop = 0; this->joy.axes.resize(2);
}

void WheelchairROS::drive(const geometry_msgs::Twist::ConstPtr& twist)
{
  if(!rfu_stop)
  {
	if(gear==1) this->wc.driveMotors(twist->linear.x, twist->angular.z);
	else this->wc.driveMotors2(twist->linear.x, twist->angular.z);
  }
  last_drive_command = ros::Time::now();
}

void WheelchairROS::RFU_cb(const std_msgs::Int32::ConstPtr& n)
{
  switch(n->data)
  {
	case 1: //go
		rfu_stop = 0;
		ROS_INFO("RFU: Go");
		break;
	case 2: //come back
		
		break;
	case 3: //stop
		rfu_stop = 1;
		ROS_INFO("RFU: Stop");
		break;
	default: break;
  }  
}

void WheelchairROS::send_tf(void)
{

}

void WheelchairROS::update_movement(void)
{
  last_l = this->wc.getLeftTicks(); last_r = this->wc.getRightTicks();
  ROS_INFO("Odometry thread initialized");
  while(ros::ok())
  {
	ticks_l = this->wc.getLeftTicks(); ticks_r = this->wc.getRightTicks();
	delta_t = ros::Time::now().toSec() - prev_time;
	delta_l = ticks_l-last_l; delta_r = ticks_r-last_r;

	//buffer overflow check
	if (delta_l>1e6)
	{
		if(ticks_l<1e6) delta_l = ticks_l + (MAX_ENCODER_VALUE - last_l);
		else delta_l = last_l + (MAX_ENCODER_VALUE - ticks_l);
	}
	delta_l *= -1; //Left Motor goes ccw
	if (delta_r>1e6)
	{
		if(ticks_r<1e6) delta_r = ticks_r + (MAX_ENCODER_VALUE - last_r);
		else delta_r = last_r + (MAX_ENCODER_VALUE - ticks_r);
	}

	d_l = delta_l * M_PER_TICK; d_r = delta_r * M_PER_TICK;
	linear_d = (d_l+d_r)/2; delta_yaw = (d_r-d_l)/AXLE_LENGTH;

	if(d_l==d_r)
	{
		odom2D.pose.pose.position.x += linear_d * cos(yaw_inc);
		odom2D.pose.pose.position.y += linear_d * sin(yaw_inc);
	}
	else
	{
		turn_r = linear_d / delta_yaw;
		odom2D.pose.pose.position.x += turn_r * (sin(delta_yaw+yaw_inc)-sin(yaw_inc));
		odom2D.pose.pose.position.y -= turn_r * (cos(delta_yaw+yaw_inc)-cos(yaw_inc));
	}

	//linear, angular velocity update
	odom2D.twist.twist.linear.x = linear_d / delta_t;
	odom2D.twist.twist.angular.z = delta_yaw / delta_t;
	yaw_inc += delta_yaw;
	if(yaw_inc>=M_PI) yaw_inc -= 2*M_PI;
	else if(yaw_inc<=-M_PI) yaw_inc += 2*M_PI;
	odom2D.pose.pose.orientation = tf::createQuaternionMsgFromYaw(yaw_inc);

	odom_trans.transform.translation.x = odom2D.pose.pose.position.x;
	odom_trans.transform.translation.y = odom2D.pose.pose.position.y;
	odom_trans.transform.translation.z = odom2D.pose.pose.position.z;
	odom_trans.transform.rotation = odom2D.pose.pose.orientation;

	odom2D.header.stamp=odom_trans.header.stamp = ros::Time::now();
	wc_odom.publish(odom2D); odom_broadcaster.sendTransform(odom_trans);

	last_l = ticks_l; last_r = ticks_r;	prev_time = ros::Time::now().toSec();
  }
}

void WheelchairROS::spinner(void)
{
  this->wc.sendCommand(POWER,ON); this->wc.driveMotors(0,0);
  if(calib)
  {
	ns_ac_ = 10; ros::Duration calib_d(0.05);
	this->wc.dz = dz_/100.0; ROS_INFO("Joystick deadzone set to %f", this->wc.dz);
	ROS_INFO("Starting calibration. Setting origin, please do not touch joystick:");
	this->wc.datum_joyx = this->wc.getReading('B'); this->wc.datum_joyy = this->wc.getReading('A');

	ROS_INFO("Origin set. Please move joystick up to maximum Fwd:");
	calprev=caltemp = this->wc.getReading('B');
	while(ros::ok() && caltemp==calprev)
	{
		caltemp = this->wc.getReading('B');
		if(caltemp-calprev>ns_ac_)
		{
			this->wc.joy_maxx = calprev;
			this->wc.dzpx = this->wc.datum_joyx + this->wc.dz*(calprev-this->wc.datum_joyx);
			this->wc.dpx = this->wc.dzpx - calprev;
		}
		else calprev = caltemp;
	}
	ROS_INFO("Max X set. Please move joystick down to maximum Rev:");
	while(ros::ok() && this->wc.getReading('B')<this->wc.datum_joyx) calib_d.sleep();
	calprev=caltemp = this->wc.getReading('B');
	while(ros::ok() && caltemp==calprev)
	{
		caltemp = this->wc.getReading('B');
		if(calprev-caltemp>ns_ac_)
		{
			this->wc.joy_minx = calprev;
			this->wc.dznx = this->wc.datum_joyx + this->wc.dz*(calprev-this->wc.datum_joyx);
			this->wc.dnx = calprev - this->wc.dznx;
		}
		else calprev = caltemp;
	}
	ROS_INFO("X-axis set. Please move joystick back to origin:");
	while(ros::ok() && this->wc.getReading('B')>this->wc.dznx) calib_d.sleep();

	ROS_INFO("Please move joystick to maximum Left:");
	calprev=caltemp = this->wc.getReading('A');
	while(ros::ok() && caltemp==calprev)
	{
		caltemp = this->wc.getReading('A');
		if(caltemp-calprev>ns_ac_)
		{
			this->wc.joy_maxy = calprev;
			this->wc.dzpy = this->wc.datum_joyy + this->wc.dz*(calprev-this->wc.datum_joyy);
			this->wc.dpy = this->wc.dzpy - calprev;
		}
		else calprev = caltemp;
	}
	ROS_INFO("Max Y set. Please move joystick to maximum Right:");
	while(ros::ok() && this->wc.getReading('A')<this->wc.datum_joyy) calib_d.sleep();
	calprev=caltemp = this->wc.getReading('A');
	while(ros::ok() && caltemp==calprev)
	{
		caltemp = this->wc.getReading('A');
		if(calprev-caltemp>ns_ac_)
		{
			this->wc.joy_miny = calprev;
			this->wc.dzny = this->wc.datum_joyy + this->wc.dz*(calprev-this->wc.datum_joyy);
			this->wc.dny = calprev - this->wc.dzny;
		}
		else calprev = caltemp;
	}
	ROS_INFO("Calibration complete. Please move joystick back to origin:");
	while(ros::ok() && this->wc.getReading('A')>this->wc.dzny) calib_d.sleep();
  }

  ros::Rate rate(SPIN_HZ); ROS_INFO("Wheelchair node initialized");
  while(ros::ok())
  {
	ros::spinOnce();
	if(rfu_stop || (ros::Time::now()-last_drive_command).toSec() > 0.5)
		this->wc.driveMotors(0,0);

	if(calib)
	{
		joy.axes[1] = this->wc.linj(this->wc.getReading('B'));
		joy.axes[0] = this->wc.angj(this->wc.getReading('A'));
		joy.header.stamp = ros::Time::now(); joy_out.publish(joy);
		//ROS_INFO("%f %f", joy.axes[1], joy.axes[0]);
	}
	rate.sleep();
  }
}

int main(int argc, char** argv) 
{
  ros::init(argc, argv, "wheelchair");
  ros::NodeHandle nh("~");
  boost::thread_group threads;

  WheelchairROS wcros(&nh);

  //odometry thread run
  bool have_odom; nh.param("RUN_ODOM",have_odom, true);
  if(have_odom) threads.create_thread(boost::bind(&WheelchairROS::update_movement, &wcros));
  else ROS_WARN("No encoder odometry provided");
  nh.param("WC_GEAR", wcros.gear, 2);
  if(wcros.gear<1 || wcros.gear>2) ROS_WARN("Invalid WC gear set. Defaulting to 2");
  nh.param("USE_JS", wcros.calib, false); nh.param("JS_DZ", wcros.dz_, 5);

  //main loop run
  wcros.spinner();

  //wait for odom thread to end
  threads.join_all();
  return 0;
}
