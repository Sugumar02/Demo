fteCreateTransfer -p QDD1MFT1 -sa TEST_JENKINS1 -sm QDD1MFT1 -da FTE_CLIENT_FTP -dm QDD1MFT1 -sd leave -postdst executable:/home/mqm/Script/DUMMY_APP/Post_Destination_MFT_TEST_SCHEDULER1.sh -jn MFT_TEST_SCHEDULER1 -ss 06:00 -tb source -oi minutes -of 30 -dd /home/mqm/Test/ /home/mqm/Test/*.txt