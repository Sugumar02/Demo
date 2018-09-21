## Alter queues for Broker Queue manager

## Check that the script has been called correctly.
if [[ "$#" = 0 || "$1" = '-?' || "$1" = '?' || "$1" = '-help' || "$1" = 'help' ]]; then
     echo " "
     echo "Define queues: Please supply target queue manager name"
     echo " "
     exit 0
fi

qmgr=$1

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
echo "DEFINE QL('ESB.USER.PI184.BAK') - " >> tmp_mqs_script.mqsc
echo "       LIKE('ORACLEFINANCIAL_TEMPLATE_QUEUE') -" >> tmp_mqs_script.mqsc
echo "       DESCR('PI184-XCHGRATES ADAPTER BACKOUT QUEUE') - " >> tmp_mqs_script.mqsc
echo "       DEFPSIST(YES) - " >> tmp_mqs_script.mqsc
echo "       DEFBIND(NOTFIXED) - " >> tmp_mqs_script.mqsc
echo "       REPLACE" >> tmp_mqs_script.mqsc
echo " " >> tmp_mqs_script.mqsc
echo "DEFINE QL('ORACLE.ESB.XCHG.RATES.BAK') - " >> tmp_mqs_script.mqsc
echo "       LIKE('ORACLEFINANCIAL_TEMPLATE_QUEUE') -" >> tmp_mqs_script.mqsc
echo "       DESCR('PI184-XCHGRATES PMF BACKOUT QUEUE') - " >> tmp_mqs_script.mqsc
echo "       DEFPSIST(YES) - " >> tmp_mqs_script.mqsc
echo "       DEFBIND(NOTFIXED) - " >> tmp_mqs_script.mqsc
echo "       CLUSTER(MQC_L1ESB1) - " >> tmp_mqs_script.mqsc
echo "       REPLACE" >> tmp_mqs_script.mqsc
echo " " >> tmp_mqs_script.mqsc
echo "DEFINE QL('ORACLE.ESB.XCHG.RATES') - " >> tmp_mqs_script.mqsc
echo "       LIKE('ORACLEFINANCIAL_TEMPLATE_QUEUE') -" >> tmp_mqs_script.mqsc
echo "       DESCR('PI184-XCHG_RATES PMF INPUT QUEUE') - " >> tmp_mqs_script.mqsc
echo "       DEFPSIST(YES) - " >> tmp_mqs_script.mqsc
echo "       BOQNAME(ORACLE.ESB.XCHG.RATES.BAK) - " >> tmp_mqs_script.mqsc
echo "       DEFBIND(NOTFIXED) - " >> tmp_mqs_script.mqsc
echo "       CLUSTER(MQC_L1ESB1) - " >> tmp_mqs_script.mqsc
echo "       REPLACE" >> tmp_mqs_script.mqsc
echo " " >> tmp_mqs_script.mqsc
echo "DEFINE QL('ESB.PIAT.XCHG.RATES.IQ.BAK') - " >> tmp_mqs_script.mqsc
echo "       LIKE('ORACLEFINANCIAL_TEMPLATE_QUEUE') -" >> tmp_mqs_script.mqsc
echo "       DESCR('PI184-XCHG_RATES CMF BACKOUT QUEUE') - " >> tmp_mqs_script.mqsc
echo "       DEFPSIST(YES) - " >> tmp_mqs_script.mqsc
echo "       DEFBIND(NOTFIXED) - " >> tmp_mqs_script.mqsc
echo "       REPLACE" >> tmp_mqs_script.mqsc
echo " " >> tmp_mqs_script.mqsc
echo "DEFINE QL('ESB.PIAT.XCHG.RATES.IQ') - " >> tmp_mqs_script.mqsc
echo "       LIKE('ORACLEFINANCIAL_TEMPLATE_QUEUE') -" >> tmp_mqs_script.mqsc
echo "       DESCR('PI184-XCHG_RATES CMF INPUT QUEUE') - " >> tmp_mqs_script.mqsc
echo "       DEFPSIST(YES) - " >> tmp_mqs_script.mqsc
echo "       BOQNAME(ESB.PIAT.XCHG.RATES.IQ.BAK) - " >> tmp_mqs_script.mqsc
echo "       DEFBIND(NOTFIXED) - " >> tmp_mqs_script.mqsc
echo "       REPLACE" >> tmp_mqs_script.mqsc
echo " " >> tmp_mqs_script.mqsc
echo " " >> tmp_mqs_script.mqsc
### Creating subscriptions for interface flows in Oracle Financial Server

echo "Define SUB('ORACLE.XCHG.RATES.SUB') TOPICSTR('ORACLE/MASTERDATA/XCHGRATES') DEST('ESB.PIAT.XCHG.RATES.IQ') REPLACE" >> tmp_mqs_script.mqsc
echo " " >> tmp_mqs_script.mqsc
echo "END" >> tmp_mqs_script.mqsc

runmqsc $qmgr <tmp_mqs_script.mqsc
