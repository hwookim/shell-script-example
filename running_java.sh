#!/bin/bash

PSINFO=`ps -eo pid,pcpu,pmem,vsz,rss,command | grep java | grep -v grep | awk '{print "pid : " $1, "\ncpu% : " $2, "\nmem% : " $3, "\nvsz : " $4, "\nrss : " $5}'`
PORT=`lsof -i -P | grep java | awk '{print $9}'`
LISTEN_CONNECTION=`netstat -anp | grep java | grep LISTEN | wc -l`
ESTABLISHED_CONNECTION=`netstat -anp | grep java | grep ESTABLISHED | wc -l`

{
	echo -e "##running java program info\n"
	echo "$PSINFO"
	echo "PORT : $PORT"
	echo "LISTEN CONNECTION : $LISTEN_CONNECTION"
	echo "ESTABLISHED CONNECTION : $ESTABLISHED_CONNECTION"
}
