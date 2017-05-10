## Alter queues for Broker Queue manager

## Check that the script has been called correctly.
if [[ "$#" = 0 || "$1" = '-?' || "$1" = '?' || "$1" = '-help' || "$1" = 'help' ]]; then
     echo " "
     echo "Define queues: Please supply target queue manager name"
     echo " "
     exit 0
fi

qmgr=$1
node=$2
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
echo "DEFINE QL('ORACLEFINANCIAL_TEMPLATE_QUEUE') -" >> tmp_mqs_script.mqsc
echo "       DESCR('ESB MODEL QUEUE') - " >> tmp_mqs_script.mqsc
echo "       DEFPSIST(YES) - " >> tmp_mqs_script.mqsc
echo "       DEFPRTY(0) - " >> tmp_mqs_script.mqsc
echo "       MAXDEPTH(10000) - " >> tmp_mqs_script.mqsc
echo "       MAXMSGL(4194304) - " >> tmp_mqs_script.mqsc
echo "       QDEPTHLO(1) - " >> tmp_mqs_script.mqsc
echo "       QDEPTHHI(10) - " >> tmp_mqs_script.mqsc
echo "       QDPMAXEV(ENABLED) - " >> tmp_mqs_script.mqsc
echo "       QDPHIEV(ENABLED) - " >> tmp_mqs_script.mqsc
echo "       QDPLOEV(DISABLED) - " >> tmp_mqs_script.mqsc
echo "       DEFBIND(NOTFIXED) - " >> tmp_mqs_script.mqsc
echo "       REPLACE" >> tmp_mqs_script.mqsc
echo " " >> tmp_mqs_script.mqsc
echo "DEFINE QL('ORACLE.ESB.INVOICE.STATUS.BAK') - " >> tmp_mqs_script.mqsc
echo "       LIKE('ORACLEFINANCIAL_TEMPLATE_QUEUE') -" >> tmp_mqs_script.mqsc
echo "       DESCR('PI177- APPAYMENTS PMF BACKOUT QUEUE') - " >> tmp_mqs_script.mqsc
echo "       DEFPSIST(YES) - " >> tmp_mqs_script.mqsc
echo "       DEFBIND(NOTFIXED) - " >> tmp_mqs_script.mqsc
echo "       REPLACE" >> tmp_mqs_script.mqsc
echo " " >> tmp_mqs_script.mqsc
echo "DEFINE QL('ORACLE.ESB.INVOICE.STATUS') - " >> tmp_mqs_script.mqsc
echo "       LIKE('ORACLEFINANCIAL_TEMPLATE_QUEUE') -" >> tmp_mqs_script.mqsc
echo "       DESCR('PI177- APPAYMENTS PMF INPUT QUEUE') - " >> tmp_mqs_script.mqsc
echo "       DEFPSIST(YES) - " >> tmp_mqs_script.mqsc
echo "       BOQNAME(ORACLE.ESB.INVOICE.STATUS.BAK) - " >> tmp_mqs_script.mqsc
echo "       DEFBIND(NOTFIXED) - " >> tmp_mqs_script.mqsc
echo "       REPLACE" >> tmp_mqs_script.mqsc
echo " " >> tmp_mqs_script.mqsc
echo "DEFINE QL('ESB.PIAT.INVOICE.STATUS.IQ.BAK') - " >> tmp_mqs_script.mqsc
echo "       LIKE('ORACLEFINANCIAL_TEMPLATE_QUEUE') -" >> tmp_mqs_script.mqsc
echo "       DESCR('PI177- APPAYMENTS CMF BACKOUT QUEUE') - " >> tmp_mqs_script.mqsc
echo "       DEFPSIST(YES) - " >> tmp_mqs_script.mqsc
echo "       DEFBIND(NOTFIXED) - " >> tmp_mqs_script.mqsc
echo "       REPLACE" >> tmp_mqs_script.mqsc
echo " " >> tmp_mqs_script.mqsc
echo "DEFINE QL('ESB.PIAT.INVOICE.STATUS.IQ') - " >> tmp_mqs_script.mqsc
echo "       LIKE('ORACLEFINANCIAL_TEMPLATE_QUEUE') -" >> tmp_mqs_script.mqsc
echo "       DESCR('PI177- APPAYMENTS CMF INPUT QUEUE') - " >> tmp_mqs_script.mqsc
echo "       DEFPSIST(YES) - " >> tmp_mqs_script.mqsc
echo "       BOQNAME(ESB.PIAT.INVOICE.STATUS.IQ.BAK) - " >> tmp_mqs_script.mqsc
echo "       DEFBIND(NOTFIXED) - " >> tmp_mqs_script.mqsc
echo "       REPLACE" >> tmp_mqs_script.mqsc
echo " " >> tmp_mqs_script.mqsc

### Creating subscriptions for interface flows in Oracle Financial Server

echo "Define SUB('ORACLE.INVOICE.STATUS.SUB') TOPICSTR('ORACLE/APPAYMENTS/INVOICE/STATUS') DEST('ESB.PIAT.INVOICE.STATUS.IQ') REPLACE" >> tmp_mqs_script.mqsc

echo " " >> tmp_mqs_script.mqsc
echo "END" >> tmp_mqs_script.mqsc

runmqsc $qmgr <tmp_mqs_script.mqsc
