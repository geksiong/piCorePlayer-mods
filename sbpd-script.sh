#!/bin/sh

# start pigpiod daemon
pigpiod -t 0 -f -l -s 10

# wait for pigpiod to initialize - indicated by 'pigs t' exit code of zero

count=10 # approx time limit in seconds
while ! pigs t >/dev/null 2>&1 ; do
	if [ $((count--)) -le 0 ]; then
		printf "\npigpiod failed to initialize within time limit\n"
		exit 1
	fi
#	printf "\nWaiting for pigpiod to initialize\n"
	sleep 1
done
printf "\npigpiod is running\n"

# load uinput module - required to be able to send keystrokes
# then set the permission to group writable, so you don't need to run sbpd with root permissions
sudo modprobe uinput
sudo chmod g+w /dev/uinput

# The full list of Jivelite key commands can be found here:
# https://github.com/ralph-irving/tcz-lirc/blob/master/jivekeys.csv

# Button 1						# button-section, defines the GPIO and key-commands
SW1=13 							# GPIO (BCM, not Board)
SH1=KEY:KEY_LEFTBRACE					# key-command for SHORT press (Now Playing)
LO1=KEY:KEY_POWER					# key-command for LONG press (Power)
LMS1=250 						# milliseconds for long press

# Button rotary 1
SW4=12
SH4=KEY:KEY_ENTER				# key-command for SHORT press (Enter)
LO4=KEY:KEY_BACK				# key-command for LONG press (Back)
LMS4=250

# Encoder Rotary 1
EN1_UP=5
EN1_DN=6
EN1_CMD=KEY:KEY_UP-KEY_DOWN

CMD="sbpd -d -f /home/tc/sbpd_commands.cfg \
b,$SW1,$SH1,2,0,$LO1,$LMS1 \
b,$SW4,$SH4,2,0,$LO4,$LMS4 \
e,$EN1_UP,$EN1_DN,$EN1_CMD,4"

echo $CMD
$CMD > /dev/null 2>&1 &
