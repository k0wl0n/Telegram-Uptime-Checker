#!/bin/bash
#kowlon

#dev server RAM usage
ram_total=$(cat /proc/meminfo | grep ^MemTotal: | awk '{ print $2 }')
ram_free=$(cat /proc/meminfo | grep ^MemFree: | awk '{ print $2 }')
ram_cached=$(cat /proc/meminfo | grep ^Cached: | awk '{ print $2 }')
ram_buffers=$(cat /proc/meminfo | grep ^Buffers: | awk '{ print $2 }')
ram_usage=$((($ram_total-($ram_free+$ram_cached+$ram_buffers))/1024))
ram_total=$((($ram_total/1024)))
ram_free=$((($ram_free/1024)))

#list of site
https =http://xxxxxx:7001/SiteWand/Submission/F_LDD93FRQ47S7P
https2=http://xxxxxx:7001/SiteWand/Submission/F_LDD93FRQ47S7P
https3=http://xxxxxx:7001/SiteWand/Submission/F_LCWGKL5KF25HJ
https4=http://xxxxxx

#simple CURL Request
status=`curl $https -k -s -f -o /dev/null && echo "UP" || echo "DOWN"`
status2=`curl $https2 -k -s -f -o /dev/null && echo "UP" || echo "DOWN"`
status3=`curl $https3 -k -s -f -o /dev/null && echo "UP" || echo "DOWN"`
status4=`curl $https4 -k -s -f -o /dev/null && echo "UP" || echo "DOWN"`

#this is bot assigned to Teletubies Group Chat
curl -s -X POST https://api.telegram.org/bot549286734:AAGWstqMD3iT1uBFE1B3Uwg1hCwXyKcZ59Y/sendMessage -d chat_id=xxxxxxx -d text="Bot Report : Webservice Status

Instantis PROD Server 1 is $status :
$https
Instantis PROD Server 2 is $status2 :
$https2
Instantis DEV Server is $status3 :
$https3
FABAPPS Server is $status4 :
$https4

Instantis DEV RAM Info
ram_total : $ram_total MB
ram_usage : $ram_usage MB
ram_free  : $ram_free MB"