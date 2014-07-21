#!/bin/sh
echo "Installing SpeedTest-Wrapper"

echo "Downloading speedtest-cli"
wget -O speedtest-cli https://raw.github.com/sivel/speedtest-cli/master/speedtest_cli.py
chmod +x speedtest-cli


echo "Copying files..."
mv speedtest-cli /usr/local/bin/
mkdir /etc/speedtest
cp speedtest-wrapper.sh /etc/speedtest/


echo "Adding Run Once an Hour"
echo "0 * * * * /etc/speedtest/speedtest-wrapper.sh" >> /etc/crontab

echo "Done"
