#!/bin/bash

timestamp() {
  date +"%s"
}

timestampFile=/tmp/speedtestlastrun.timestamp
waitTimeSeconds=3600

if [ -r $timestampFile ] && [ $((`timestamp`-waitTimeSeconds)) -ge $(< $timestampFile) ] || [ ! -r $timestampFile ];
then  
  echo "Testing internet speed..."
  timestamp > $timestampFile
  (speedtest-cli | egrep -o '(.* \(.+\))|(\d+.\d+ Mbit/s)' | tr '\n' '\t'; echo) >> speedtest.log
  echo "Done"
fi


