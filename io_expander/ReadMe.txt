File contains information on using the IO_Expander Board and associated software.
Author: Dave Hunt


Check code in /io_expander/test/Odroid-USBIO/Microchip Solutions v2012-10-15/USB/Device - Bootloaders/HID/Firmware - PIC18 Non-J/main.c for onboard firmware (to see what calls do what), or to change any pin configurations: hint line 909 (tris declarations)

Source:		http://github.com/hardkernel/Odroid-USBIO

***************TO INSTALL****************
TODO

***************TO RUN*****************
Before the the node will run it needs to be set to have root priveledges using the following commands:
cd ~/ros/Indigo/devel/lib/io_expander
sudo bash
chown root io_expander_node
chmod ugo+s io_expander_node
exit

Then to run the program:
roscore
rosrun io_expander io_expander_node

*************SOFTWARE DETAILS*****************
buf[0] Commands
0x98: //- Get Register
0x99: //- Set Register
0x9A: //- Get Register Bit
0x9B: //- Set Register Bit

To read specific port, put the associated port number into buf[10] along with the Get Register command above in buf[0]
i.e. reads the entire PORTD status
buf[0] = 0x98
buf[10] = 0x83	(F added in software)
rw_USB();

Port Register Values	(from datasheet)
PORTA: F80h
PORTB: F81h
PORTC: F82h
PORTD: F83h
PORTE: F84h

By default the pins are set to digital I/O's and initialise to INPUTS. (excluding pins 6/7 of PORTD).

***************TROUBLE SHOOTING*****************
"Failed to initialise USB_IO, check ReadMe"
If this error appears follow the TO RUN section above. It is likely the program does not have sufficient priveledges to access the USB HUD.

"My pin isn't changing state!?"
Chances are you're trying to read a pin that is set as an input. The default firmware only has PortD pins 6/7 set as outputs. To change this new firmware must be installed on the io_board.
https://github.com/hardkernel/Odroid-USBIO/blob/master/Microchip%20Solutions%20v2012-10-15/USB/Device%20-%20HID%20-%20Custom%20Demos/Firmware/main.c