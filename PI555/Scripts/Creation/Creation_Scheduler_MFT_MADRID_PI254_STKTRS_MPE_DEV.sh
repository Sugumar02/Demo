cd /opt/mqm/bin
./fteCreateTransfer -p QDD2MFT1 -sa JENKINS_TEST -sm QDD2MFT1 -da FTE_LOCAL_FTP -dm QDD2MFT1 -sd delete -de overwrite -jn JENKINS_JOB presrc executable:/home/iibdeploy/Script/PRESRC_JENKINS_JOB_SDDC_Dev.sh -ss 2019-06-20T07:00 -tb source -oi minutes -of 15 -qmp true -dq Jenkins.MFT.Queue \\C:\\MPE_FTP\\MPE_DEV\\Madrid\\TRANSIN.*.795.*



