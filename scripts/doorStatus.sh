# --------------------------------------------------------------------------------------- #
# This script is used to monitor the status of a door with a Raspberry Pi 3 Mobel B       #
# and send an email when the door is opened or closed                                     #
# --------------------------------------------------------------------------------------- #
#!/bin/bash

echo "4" > /sys/class/gpio/export
echo "in" > /sys/class/gpio/gpio4/direction

# create an infinite loop inside wwhich operations will be done
# to continuously check for door status and send notifications
while true;
do

  trap 'echo "4" > /sys/class/gpio/unexport' 0

  # get the state value of the pin on the raspberry
  stat=`cat /sys/class/gpio/gpio4/value`

  while [$stat = "1"]
  do
    # get date and time
    date=`date +%d-%m-%Y`
    time=`date '+%H:%M'`

    # display door status
    echo "Door opened at $time on $date"
    # send an email notification
    echo "Hi, Door opened at $time on $date" | mail -s "Door Opened" example@gmail.com

    # save notificationn in a daily log file
    echo "Door was opened at $time on $date" >> log$date.txt

    # wait for the door to be closed again
    while [$stat = "1"]
    do
      stat=`cat /sys/class/gpio/gpio4/value`

      # add a waiting time
      sleep 0.09
    done

    # for when the door is closed
    # get date and time
    date=`date +%d-%m-%Y`
    time=`date '+%H:%M'`

    # display door status
    echo "Door was closed at $time on $date"
    # send an email notification
    echo "Hi, Door closed at $time on $date" | mail -s "Door Closed" example@gmail.com

    # save notificationn in a daily log file
    echo "Door was closed at $time on $date" >> log$date.txt
  done

  # add a waiting time reduce the the processor use by over 90%
  sleep 0.09

done

exit 0
