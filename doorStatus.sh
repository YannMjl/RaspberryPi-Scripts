echo "4" > /sys/class/gpio/export
echo "in" > /sys/class/gpio/gpio4/direction

while true; do 
    trap 'echo "4" > /sys/class/gpio/unexport' 0

    # get the state value of the pin on the raspberry
    stat=`cat /sys/class/gpio/gpio4/value`

    while [$stat = "1"]
    do
        # get date
        date=`date +%d-%m-%Y`
        time=`date '+%H:%M'`

        # display door status
        echo "Door opened at $time on $date"
        # send an email notification
        echo "Hi, Door opened at $time on $date" | mail -s "Door Open" example@gmail.com
