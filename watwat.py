#!/usr/bin/env python
# -*- coding: utf-8 -*-

import smtplib
import urllib2
def cutBetween(startword,endword,word,startindex=0,startend=10000000):
	index_start=word.find(startword,startindex,startend)
	len_startword=len(startword)
	between=word[index_start+len_startword:word.find(endword,index_start+len_startword)]
	return between
def maxPage(post_url):
	url_1 = 'http://www.watthakhanun.com/webboard/showthread.php?t='+str(post_url)
	response = urllib2.urlopen(url_1)
	Data = response.read()
	maxpage=cutBetween("\xa8\xd2\xa1\xb7\xd1\xe9\xa7\xcb\xc1\xb4 "," ",Data)#str
#	maxpage=Data
	return maxpage
print("page max : ",maxPage(5112))


post_url=5112
page_url=maxPage(post_url)
# page_url=2
# url = 'http://www.watthakhanun.com/webboard/showthread.php?t=4969'
url = 'http://www.watthakhanun.com/webboard/showthread.php?t='+str(post_url)+'&page='+str(page_url)
response = urllib2.urlopen(url)
respData = response.read()
print("curent page :",page_url)


index_wattu=respData.find('<font size="6"><font color="DarkGreen">')#respData.find(r'\xc3\xd2\xc2\xa1\xd2\xc3\xc7\xd1\xb5\xb6\xd8\xc1\xa7\xa4\xc5 \xc3\xe8\xc7\xc1\xba\xd8\xad\xa1\xb0\xd4\xb9\xbb\xc5\xb4\xcb\xb9\xd5\xe9')
if index_wattu > 0 :
	print("index_wattu",index_wattu)
	post_this=cutBetween("post_message_",'"',respData,index_wattu-100,index_wattu)
	print("id post this : ",post_this)
	file = open('notes.txt','r+')
	post_file=file.read()
	if post_file == post_this:
		print("dup post")

	else:
		print("new post")
		print("send msg")
		server = smtplib.SMTP('smtp.gmail.com', 587)
		server.ehlo()
		server.starttls()
		server.ehlo()
		server.login("lineemb@gmail.com", "linebot123")	
		text = "Wat tu"#+time.ctime()
		server.sendmail("lineemb@gmail.com", "lineemb@gmail.com", text)
		server.quit()
		a = open('notes.txt','w')
		a.write(str(post_this))

#		b= open('have','w')
#		b.write("have")

file.close()
#a.close()
