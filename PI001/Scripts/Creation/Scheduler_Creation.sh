fteCreateTransfer -p QDD1MFT1 -sa TEST_JENKINS -sm QDD1MFT1 -da FTE_CLIENT_FTP -dm QDD1MFT1 -sd leave -postdst executable:/home/mqm/Script/DUMMY_APP/Post_Destination.sh -jn MFT_TEST_SCHEDULER -ss 06:00 -tb source -oi minutes -of 30 -dd /home/mqm/Test/ /home/mqm/Test/*.txt