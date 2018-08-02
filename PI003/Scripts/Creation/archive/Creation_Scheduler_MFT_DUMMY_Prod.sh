cd /opt/mqm/bin
./fteCreateTransfer -sa MFT01 -sm MFT01 -da MFT01 -dm MFT01 -sd leave -de overwrite -ss 2014-09-29T23:45 -oi days -of 5 -jn MFT_DUMMY -dd /home/MQFTE_LINUX /home/TEST/test/*.txt -p MFT01 -presrc DUMMY.sh 
