#!/bin/bash

szUrl=$(zenity --password --width=560)
CAN_I_RUN_SUDO=$(zenity --password --width=560)
if [ ${CAN_I_RUN_SUDO} -eq 949593 ]
then
echo $szUrl| sudo -S date
echo $szUrl| sudo -S grep -vwE "(whatsapp|facebook|linkedin|google|instagram|Rules)" /etc/hosts > /tmp/hosts
echo $szUrl| sudo -S cp /tmp/hosts /etc/hosts
echo $szUrl| sudo -S service network-manager restart
else
    zenity --error --text "Authentication failed! "
fi
