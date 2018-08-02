#!/bin/bash
cd /opt/mqm/bin
./fteCreateMonitor -ma WIN_AGENT -mn MONITOR_FOR_TEST -mm MFT1 -md /temp/temp/temp/ -mt /var/mqm/Monitor/TASKXML.xml -tr noSizeChange=2,*.json -pi 1 -pu minutes -p MFT2 -bs 1 -pt regex
