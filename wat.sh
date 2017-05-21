#!/bin/bash
#page_max=$(curl http://www.watthakhanun.com/webboard/showthread.php?t=5156'&'page=7 |grep '<td class="vbmenu_control" style="font-weight:normal"><font color="#FFFFFF">' |head -1|tr -d " " |cut -c 93)
#page_max= "$(curl http://www.watthakhanun.com/webboard/showthread.php?t=5235'&'page=7 |grep '<td class="vbmenu_control" style="font-weight:normal"><font color="#FFFFFF">' |head -1|cut -d ' ' -f7 )"
work=5324
uni=rvogz1420898258
page_max="$(curl http://www.watthakhanun.com/webboard/showthread.php?t=$work |grep '<td class="vbmenu_control" style="font-weight:normal"><font color="#FFFFFF">' |head -1|cut -d ' ' -f7)"
#echo "${page_max}"
echo -e "page max : $page_max"


#page_max=7
find=$(curl http://www.watthakhanun.com/webboard/showthread.php?t=$work'&'page=$page_max  | iconv -f tis-620 -t utf-8 | grep "พระครูวิลาศกาญจนธรรม" | wc -l)
#</font></font></b> <b><font size="7"><font color="Red">  a5hvz1343036843.jpg
echo -e  "number :  $find"
if [[ find -gt 0 ]] ; then
	printf "find"
	if [[ $(cat /home/pi/bot/wattemp) -ne page_max  ]] ;  then
		echo -e "\nNew"
		echo $(date) page max : $page_max    find : $find ท่าขนุน | mail -s "Wat" lineemb@gmail.com
		$(omxplayer /home/pi/bot/example.mp3)
		$(echo $page_max > /home/pi/bot/wattemp )
	else 
		echo -e "\nDup"		
	fi
	else
		echo -e "page max : $page_max -----------> Not Found  T_T"
fi

