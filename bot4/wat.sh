#!/bin/bash
#page_max=$(curl http://www.watthakhanun.com/webboard/showthread.php?t=5156'&'page=7 |grep '<td class="vbmenu_control" style="font-weight:normal"><font color="#FFFFFF">' |head -1|tr -d " " |cut -c 93)
#page_max= "$(curl http://www.watthakhanun.com/webboard/showthread.php?t=5235'&'page=7 |grep '<td class="vbmenu_control" style="font-weight:normal"><font color="#FFFFFF">' |head -1|cut -d ' ' -f7 )"
work=5230
uni=cq89i1421146156.jpg
#uni='<div align="center"><b><font size="6"><font color="DarkGreen">'
#page_max="$(curl http://www.watthakhanun.com/webboard/showthread.php?t=$work |grep '<td class="vbmenu_control" style="font-weight:normal"><font color="#FFFFFF">' |head -1|cut -d ' ' -f7)"
#page_max=2
#echo "${page_max}"
#echo -e "page max : $page_max"


#find=$(curl http://www.watthakhanun.com/webboard/showthread.php?t=$work'&'page=$page_max |grep $uni | wc -l)
#find=$(curl http://www.watthakhanun.com/webboard/showthread.php?t=5230'&'page=$page_max |grep ', $(date +"%H:%M")')
find=$(curl http://www.watthakhanun.com/webboard/showthread.php?t=5230  | iconv -f tis-620 -t utf-8 | grep "สุธรรม is online" | wc -l)
#find=$("$findx" | wc -l)
echo -e  "number :  $find"
if [[ find   -gt 0 ]] ; then
	printf "find"
	if [[ $(cat /home/pi/bot/bot4/wattemp) -ne page_max  ]] ;  then
		echo -e "\nNew"
		echo   | mail -s "สุธรรม" lineemb@gmail.com
		$(omxplayer /home/pi/bot/bot3/h.mp3)
		$(echo $page_max > /home/pi/bot/bot4/wattemp )
	else 
		echo -e "\nDup"		
	fi
	else
		echo -e "page  : $page_max -----------> Not Found  T_T"
fi

