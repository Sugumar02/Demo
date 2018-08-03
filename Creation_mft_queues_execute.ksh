## Alter queues for Broker Queue manager

## Check that the script has been called correctly.
if [[ "$#" = 0 || "$1" = '-?' || "$1" = '?' || "$1" = '-help' || "$1" = 'help' ]]; then
     echo " "
     echo "Define queues: Please supply target queue manager name"
     echo " "
     exit 0
fi

qmgr=$1
clustname=$2
CENV='echo $qmgr | cut -c-2'

echo " "
echo "Removing temporary file"
echo " "
rm tmp_mqs_script.mqsc
touch tmp_mqs_script.mqsc
chmod 777 tmp_mqs_script.mqsc

echo " "
echo "Defining queues for queue manager" $qmgr 
echo " " 
echo " " >> tmp_mqs_script.mqsc
echo "DEFINE QA('ESB.TEST1') -" >> tmp_mqs_script.mqsc
echo "       DEFPSIST(YES) - " >> tmp_mqs_script.mqsc
echo "       TARGTYPE(QUEUE) - " >> tmp_mqs_script.mqsc
echo "       TARGET('POS.ESB.DCL') - " >> tmp_mqs_script.mqsc
echo "       DEFPRTY(0) - " >> tmp_mqs_script.mqsc
echo "       DEFBIND(NOTFIXED) - " >> tmp_mqs_script.mqsc
echo "       CLUSTER($clustname) - " >> tmp_mqs_script.mqsc
echo "       REPLACE" >> tmp_mqs_script.mqsc
echo " " >> tmp_mqs_script.mqsc
echo "DEFINE QL('ESB.TEST.BAK') -" >> tmp_mqs_script.mqsc
echo "       DEFPSIST(YES) - " >> tmp_mqs_script.mqsc
echo "       BOTHRESH(0) - " >> tmp_mqs_script.mqsc
echo "       DEFPRTY(0) - " >> tmp_mqs_script.mqsc
echo "       MAXDEPTH(10000) - " >> tmp_mqs_script.mqsc
echo "       MAXMSGL(4194304) - " >> tmp_mqs_script.mqsc
echo "       QDEPTHLO(1) - " >> tmp_mqs_script.mqsc
echo "       QDEPTHHI(10) - " >> tmp_mqs_script.mqsc
echo "       QDPMAXEV(ENABLED) - " >> tmp_mqs_script.mqsc
echo "       QDPHIEV(ENABLED) - " >> tmp_mqs_script.mqsc
echo "       QDPLOEV(DISABLED) - " >> tmp_mqs_script.mqsc
echo "       DEFBIND(NOTFIXED) - " >> tmp_mqs_script.mqsc
echo "       CLUSTER($clustname) - " >> tmp_mqs_script.mqsc
echo "       REPLACE" >> tmp_mqs_script.mqsc
echo " " >> tmp_mqs_script.mqsc
echo "DEFINE QL('ESB.TEST') -" >> tmp_mqs_script.mqsc
echo "       DEFPSIST(YES) - " >> tmp_mqs_script.mqsc
echo "       BOQNAME(ESB.TERADATA.DCL.BAK) - " >> tmp_mqs_script.mqsc
echo "       BOTHRESH(0) - " >> tmp_mqs_script.mqsc
echo "       DEFPRTY(0) - " >> tmp_mqs_script.mqsc
echo "       MAXDEPTH(10000) - " >> tmp_mqs_script.mqsc
echo "       MAXMSGL(4194304) - " >> tmp_mqs_script.mqsc
echo "       QDEPTHLO(1) - " >> tmp_mqs_script.mqsc
echo "       QDEPTHHI(10) - " >> tmp_mqs_script.mqsc
echo "       QDPMAXEV(ENABLED) - " >> tmp_mqs_script.mqsc
echo "       QDPHIEV(ENABLED) - " >> tmp_mqs_script.mqsc
echo "       QDPLOEV(DISABLED) - " >> tmp_mqs_script.mqsc
echo "       DEFBIND(NOTFIXED) - " >> tmp_mqs_script.mqsc
echo "       CLUSTER($clustname) - " >> tmp_mqs_script.mqsc
echo "       REPLACE" >> tmp_mqs_script.mqsc
echo " " >> tmp_mqs_script.mqsc
echo "END" >> tmp_mqs_script.mqsc
runmqsc $qmgr <tmp_mqs_script.mqsc
