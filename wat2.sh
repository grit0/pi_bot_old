#!/bin/bash
#page_max=$(curl http://www.watthakhanun.com/webboard/showthread.php?t=5156'&'page=7 |grep '<td class="vbmenu_control" style="font-weight:normal"><font color="#FFFFFF">' |head -1|tr -d " " |cut -c 93)
page_max= $(curl http://www.watthakhanun.com/webboard/showthread.php?t=5156'&'page=7 |grep '<td class="vbmenu_control" style="font-weight:normal"><font color="#FFFFFF">' |head -1|cut -d ' ' -f7 )
printf "$page_max"
#page_max=9
find=$(curl http://www.watthakhanun.com/webboard/showthread.php?t=5156'&'page=$page_max |grep "spfya1471278765.jpg" | wc -l)
printf "$find"
if [[ find -gt 0 ]] ; then
	printf "findd"
	if [[ $(cat /home/pi/bot/wattemp) -ne page_max  ]] ;  then
		echo -e "\nYES"
		echo $(date) page max : $page_max    find : $find | mail -s "Wat" lineemb@gmail.com
		$(omxplayer /home/pi/bot/example.mp3)
		$(echo $page_max > /home/pi/bot/wattemp )
	else
		echo -e "\nDup"		
	fi
fi

