/* Software License Agreement (BSD License)
 *
 * Copyright (c) 2011, Willow Garage, Inc.
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 *  * Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 *  * Redistributions in binary form must reproduce the above
 *    copyright notice, this list of conditions and the following
 *    disclaimer in the documentation and/or other materials provided
 *    with the distribution.
 *  * Neither the name of Willow Garage, Inc. nor the names of its
 *    contributors may be used to endorse or promote products derived
 *    from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
 * FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
 * COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
 * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
 * BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 * CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
 * ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
 *
 * Auto-generated by genmsg_cpp from file /home/odroid/git_laser_scanner/src/laser_scanner/uts_sensor_box/sensor_drivers/rosserial/rosserial_arduino/msg/rgb.msg
 *
 */


#ifndef ROSSERIAL_ARDUINO_MESSAGE_RGB_H
#define ROSSERIAL_ARDUINO_MESSAGE_RGB_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace rosserial_arduino
{
template <class ContainerAllocator>
struct rgb_
{
  typedef rgb_<ContainerAllocator> Type;

  rgb_()
    : r(0)
    , g(0)
    , b(0)  {
    }
  rgb_(const ContainerAllocator& _alloc)
    : r(0)
    , g(0)
    , b(0)  {
    }



   typedef uint8_t _r_type;
  _r_type r;

   typedef uint8_t _g_type;
  _g_type g;

   typedef uint8_t _b_type;
  _b_type b;




  typedef boost::shared_ptr< ::rosserial_arduino::rgb_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::rosserial_arduino::rgb_<ContainerAllocator> const> ConstPtr;

}; // struct rgb_

typedef ::rosserial_arduino::rgb_<std::allocator<void> > rgb;

typedef boost::shared_ptr< ::rosserial_arduino::rgb > rgbPtr;
typedef boost::shared_ptr< ::rosserial_arduino::rgb const> rgbConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::rosserial_arduino::rgb_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::rosserial_arduino::rgb_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace rosserial_arduino

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'rosserial_arduino': ['/home/odroid/git_laser_scanner/src/laser_scanner/uts_sensor_box/sensor_drivers/rosserial/rosserial_arduino/msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::rosserial_arduino::rgb_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::rosserial_arduino::rgb_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::rosserial_arduino::rgb_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::rosserial_arduino::rgb_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::rosserial_arduino::rgb_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::rosserial_arduino::rgb_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::rosserial_arduino::rgb_<ContainerAllocator> >
{
  static const char* value()
  {
    return "353891e354491c51aabe32df673fb446";
  }

  static const char* value(const ::rosserial_arduino::rgb_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x353891e354491c51ULL;
  static const uint64_t static_value2 = 0xaabe32df673fb446ULL;
};

template<class ContainerAllocator>
struct DataType< ::rosserial_arduino::rgb_<ContainerAllocator> >
{
  static const char* value()
  {
    return "rosserial_arduino/rgb";
  }

  static const char* value(const ::rosserial_arduino::rgb_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::rosserial_arduino::rgb_<ContainerAllocator> >
{
  static const char* value()
  {
    return "uint8 r\n\
uint8 g\n\
uint8 b\n\
";
  }

  static const char* value(const ::rosserial_arduino::rgb_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::rosserial_arduino::rgb_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.r);
      stream.next(m.g);
      stream.next(m.b);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER;
  }; // struct rgb_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::rosserial_arduino::rgb_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::rosserial_arduino::rgb_<ContainerAllocator>& v)
  {
    s << indent << "r: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.r);
    s << indent << "g: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.g);
    s << indent << "b: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.b);
  }
};

} // namespace message_operations
} // namespace ros

#endif // ROSSERIAL_ARDUINO_MESSAGE_RGB_H