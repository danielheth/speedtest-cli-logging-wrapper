#!/bin/sh
echo "Installing SpeedTest-Wrapper"

echo "Copying files..."
mkdir /etc/speedtest
cp speedtest-wrapper.sh /etc/speedtest/


echo "Adding Run Once an Hour"
echo "0 * * * * /etc/speedtest/speedtest-wrapper.sh" >> /etc/crontab

echo "Done"
