#!/bin/bash

szUrl=$(zenity --password --width=560)
echo $szUrl| sudo -S date
hostsfile="/etc/hosts"
#CAN_I_RUN_SUDO=$(sudo -n uptime 2>&1|grep "load"|wc -l)
#if [ ${CAN_I_RUN_SUDO} -gt 0 ]
#then
    echo "#CustomFirewall Access Rules" | sudo tee -a $hostsfile
    ans=$(zenity  --list  --text "Choose services" --checklist  --column "Pick" --column "Services" TRUE "Social" TRUE "Gmail" --separator=":"); echo $ans
	if [ -z "$ans" ] ; then
	   zenity --error --text "No selections made! "
	   exit 1
	fi
	IFS=":" ; for word in $ans ; do 
	   case $word in
	"Social") echo "127.0.0.1        web.whatsapp.com" | sudo tee -a $hostsfile ; echo "127.0.0.1        www.facebook.com" | sudo tee -a $hostsfile ; echo "127.0.0.1        mbasic.facebook.com" | sudo tee -a $hostsfile ; echo "127.0.0.1        m.facebook.com" | sudo tee -a $hostsfile ; echo "127.0.0.1        www.linkedin.com" | sudo tee -a $hostsfile  ; echo "127.0.0.1        www.instagram.com" | sudo tee -a $hostsfile ;;
	"Gmail") echo "127.0.0.1        mail.google.com" | sudo tee -a $hostsfile;;
	   esac
	done
	echo $szUrl| sudo -S service network-manager restart
#else
#    zenity --error --text "Authentication failed! "
#fi
