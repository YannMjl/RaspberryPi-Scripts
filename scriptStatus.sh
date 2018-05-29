# ------------------------------------------------------------------------------------- #
# This script is used to check the status of the doorStatus script                      #
# ------------------------------------------------------------------------------------- #

#!/bin/bash
while true; 
do
    # start doorStatus script and output error to a text file
    # the '&'' puts the process into the background, so the script goes to the next line
    sudo ./home/pi/Desktop/MyScripts/doorStatus.sh &

    # wait $! is a command that waits for the last command started to terminate
    # all this is in an infinite loop
    wait $!

    # wait for some period after the command terminated before it is restarted
    # this prevents rapid restarting that may draw lots of cpu time in case something is 
    # badly wrong and the start script command quickly terminates after start.
    sleep 10
done

exit 0
# ------------------------------------------------------------------------------------- #