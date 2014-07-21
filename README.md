# Speedtest Logger
I was researching ways to use speedtest.net regularly so I could see over time how my internet connection was running.  I also figured that using other tools I could send alerts whenever I started to see problems.

This first lead me to [sivel's speedtest-cli](https://github.com/sivel/speedtest-cli) where I found a wonderful utility for acquiring the speed test results.  Now to wrap that up into something automated for my purposes.  This lead me to [Pezmc's speedtest-cli-logging-wrapper](https://github.com/Pezmc/speedtest-cli-logging-wrapper), but that wasn't flushed out enough for my purposes... time to fork!

## Installation
I tried to keep things simple... you should be able to acquire these files either via downloading the zip or cloning this repo... but once you have it run the following command:

>wget https://github.com/danielheth/speedtest-cli-logging-wrapper/tarball/master

>tar -xpvf master

>cd danielheth*

>./install.sh

This will put all the files where they need to go.  Don't forget Python 2.4-3.4 is required for speedtest-cli.

## Details
Essentially what I'm contributing is a simple installer and wrapper scripts to run the speedtest-cli utility once an hour and log the results to /var/log/speedtest.log
