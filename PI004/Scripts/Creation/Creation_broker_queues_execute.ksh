## Alter queues for Broker Queue manager

## Check that the script has been called correctly.
if [[ "$#" = 0 || "$1" = '-?' || "$1" = '?' || "$1" = '-help' || "$1" = 'help' ]]; then
     echo " "
     echo "Define queues: Please supply target queue manager name"
     echo " "
     exit 0
fi

qmgr=$1
cluster=$2

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
echo "DEFINE QL('DUMMY.TEST.BAK') - " >> tmp_mqs_script.mqsc
echo "       LIKE('ORACLEFINANCIAL_TEMPLATE_QUEUE') -" >> tmp_mqs_script.mqsc
echo "       DESCR('DUMMY.TEST BACKOUT') - " >> tmp_mqs_script.mqsc
echo "       DEFPSIST(YES) - " >> tmp_mqs_script.mqsc
echo "       DEFBIND(NOTFIXED) - " >> tmp_mqs_script.mqsc
echo "       CLUSTER($cluster) - " >> tmp_mqs_script.mqsc
echo "       REPLACE" >> tmp_mqs_script.mqsc
echo " " >> tmp_mqs_script.mqsc
echo "DEFINE QL('DUMMY.TEST') - " >> tmp_mqs_script.mqsc
echo "       LIKE('ORACLEFINANCIAL_TEMPLATE_QUEUE') -" >> tmp_mqs_script.mqsc
echo "       DESCR('DUMMY.TEST') - " >> tmp_mqs_script.mqsc
echo "       DEFPSIST(YES) - " >> tmp_mqs_script.mqsc
echo "       BOQNAME(DUMMY.TEST.BAK) - " >> tmp_mqs_script.mqsc
echo "       DEFBIND(NOTFIXED) - " >> tmp_mqs_script.mqsc
echo "       CLUSTER($cluster) - " >> tmp_mqs_script.mqsc
echo "       REPLACE" >> tmp_mqs_script.mqsc
echo " " >> tmp_mqs_script.mqsc
echo " " >> tmp_mqs_script.mqsc
### Creating subscriptions for interface flows in Oracle Financial Server

echo "Define SUB('DUMMY.TEST.SUB') TOPICSTR('DUMMY/TEST') DEST('DUMMY.TEST') REPLACE" >> tmp_mqs_script.mqsc
echo " " >> tmp_mqs_script.mqsc
echo "END" >> tmp_mqs_script.mqsc

runmqsc $qmgr <tmp_mqs_script.mqsc
