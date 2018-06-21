# -------------------------------------------------------------------------------------------------------------------------- #
# This script below will email a time & date stamped photo                                                                   #
# -------------------------------------------------------------------------------------------------------------------------- #

#!/bin/bash

# create an infinite loop inside wwhich operations will be done
# to continuously check for door status and send notifications
while true; 
do 

    trap 'echo "4" > /sys/class/gpio/unexport' 0

    # get the state value of the pin on the raspberry
    stat=`cat /sys/class/gpio/gpio4/value`

    while [$stat = "0"]
    do
        # get date and time
        date=`date +%d-%m-%Y`
        time=`date '+%H:%M'`

        # display door status
        echo "Door opened at $time on $date"
        
        # take a picture
        raspistill -o $t$d.jpg -w 1024 -h 768 -q 30
        
        stat='1'
    done
    
    # add a waiting time reduce the the processor use by over 90%
    sleep 0.09

done

exit 0
# -------------------------------------------------------------------------------------------------------------------------- #
