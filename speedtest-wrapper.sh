#!/bin/bash

timestamp() {
  date +"%s"
}

timestampFile=./lastrun.timestamp
waitTimeSeconds=3600


if [ -r $timestampFile ] && [ $((`timestamp`-waitTimeSeconds)) -ge $(< $timestampFile) ] || [ ! -r $timestampFile ];
then  
  echo "Testing internet speed..."
  
  TIMESTAMP=`date +"%s"`
  RESULTS=`speedtest-cli | grep 'Mbits/s' | awk -F':' '{print $2}' | awk -F' ' '{print $1;}' | awk 'NR%2{printf $0"|";next;}1'`
  DOWNLOAD=`echo $RESULTS | awk -F'|' '{print $1}'`
  UPLOAD=`echo $RESULTS | awk -F'|' '{print $2}'`
  
  echo "$DOWNLOAD|$UPLOAD|$TIMESTAMP" >> /var/log/speedtest.log  
  echo "$TIMESTAMP" > $timestampFile  

  echo "Done"
fi
