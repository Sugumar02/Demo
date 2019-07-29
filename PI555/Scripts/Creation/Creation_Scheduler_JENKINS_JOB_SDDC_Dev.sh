cd /opt/mqm/bin
./fteCreateTransfer -p QDD2MFT1 -sa WIN_STUB_SVER -sm QDD2MFT1 -da FTE_LOCAL_FTP -dm QDD2MFT1 -sd delete -de overwrite -jn MFT_MADRID_PI254_STKTRS_MPE_DEV -presrc executable:/home/mqm/Script/PRESRC_MFT_MADRID_PI254_STKTRS_ARCHIVE_DEV.sh -ss 2019-06-20T07:00 -tb source -oi minutes -of 15 -qmp true -dq PLU.PRODUCTPRICE.IN \\C:\\MPE_FTP\\MPE_DEV\\Madrid\\TRANSIN.*.795.*



