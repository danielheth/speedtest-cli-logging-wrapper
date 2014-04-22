#!/bin/bash

timestamp() {
  date +"%s"
}

timestampFile=/tmp/speedtestlastrun.timestamp
waitTimeSeconds=3600

if [ -r $timestampFile ] && [ $((`timestamp`-waitTimeSeconds)) -ge $(< $timestampFile) ] || [ ! -r $timestampFile ];
then  
  timestamp > $timestampFile
  (speedtest-cli | egrep -o '(.* \(.+\))|(\d+.\d+ Mbit/s)' | tr '\n' '\t'; echo) >> speedtest.log
fi


