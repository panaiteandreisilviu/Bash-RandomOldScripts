#!/bin/bash
pstorm &
google-chrome www.google.ro &
firefox http://smartrent.dev4.clientproof.co.uk/ &
sleep 1
wmctrl -r "Chrome" -t 1
wmctrl -s 0
exit 0
