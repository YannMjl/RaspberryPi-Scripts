# -------------------------------------------------------------------------------------------------------------------------- #
# This script below will email a time & date stamped photo                                                                   #
# -------------------------------------------------------------------------------------------------------------------------- #
#!/bin/bash

# create an infinite loop inside which, the operations will be done
# to continuously check for door status and send notifications
while true;
do

  trap 'echo "4" > /sys/class/gpio/unexport' 0

  # get the state value of the pin on the raspberry
  stat=`cat /sys/class/gpio/gpio4/value`

  while [ $stat = "1" ]
  do
    # get date and time
    date=`date +%d-%m-%Y`
    time=`date '+%H:%M'`

    # display door status on terminal
    echo "Door opened at $time on $date"

    # runs camera for specific time, and take JPG capture at end if requested
    # -t, --timeout:Time (in ms) before takes picture and shuts down (if not specified, set to 5s)
    raspistill -t 100 -o $t$d.jpg -w 1024 -h 768 -q 30

    # convert the picture and stamped time & date on it
    convert -pointsize 20 -fill yellow -draw 'text 850,30 "'$t' '$d'"' $t$d.jpg $d$t.jpg

    # send email with the attached photo
    mpack -s "door opned" /home/pi/$d$t.jpg example@gmail.com

    while [ $stat = "1" ]
    do
      # get the state value of the pin on the raspberry
      stat=`cat /sys/class/gpio/gpio4/value`
      sleep 0.09
    done

    echo "door closed"

  done

  # add a waiting time reduce the the processor use by over 90%
  sleep 0.09

done

exit 0
