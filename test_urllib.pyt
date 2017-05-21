import urllib
import re
def cutBetween(startword,endword,word,startindex=0,startend=10000000):
        index_start=word.find(startword,startindex,startend)
        len_startword=len(startword)
        between=word[index_start+len_startword:word.find(endword,index_start+len_startword)]
        return between

htmlfile=urllib.urlopen("http://www.watthakhanun.com/webboard/showthread.php?t=5235&page=7")
#req.headers['content-type']
#'text/html; charset=windows-1251'

htmltext=htmlfile.read().decode('cp874')
#regex='<div id="post_message_177020">(.+?)</div>'
#regex='<span id="reputationmenu_177021">(.+?)</span>'
#pattern=re.compile(regex)
#detail=re.findall(pattern,htmltext)
#detail=cutBetween("กรรมฐาน","ปรับปรุงข้อมูล",htmltext)

#print(htmltext)
