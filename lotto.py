#!/usr/bin/env python
# -*- coding: utf-8 -*-
import urllib2
import re
date="16072559"
lot="555556"
url = 'http://news.sanook.com/lotto/check/'+date+'/#'+lot
response = urllib2.urlopen(url)
respData=response.read()
def cutBetween(startword,endword,word):
	index_start=word.find(startword)
	len_startword=len(startword)
	between=word[index_start+len_startword:word.find(endword,index_start+len_startword)]
	return between

print(cutBetween('lotto__name lotto__green sukhumvitreg">',"</small",respData))
