# ------------------------------------------------------------------------------------- #
# This script is used for Streaming Video Using VLC Player                              #
# ------------------------------------------------------------------------------------- #

# notes:
# "raspivid" the command line used to capture the video with the Pi camera

# "-o -" causes the output to be written to stdout
# "-t 0" sets the timeout to disabled (capture indefinitely)

# "-w" width, available range: 64 to 1920 
# "-h" Height, available range: 64 to 1080

#!/bin/bash
raspivid -o - -t 0 -w 640 -h 360 -fps 25 -n|cvlc -vvv stream:///dev/stdin --sout '#standard{access=http,mux=ts,dst=:8090}' :demux=h264
