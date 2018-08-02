
## Queue definitions
if [[ "$#" = 0 || "$1" = '-?' || "$1" = '?' || "$1" = '-help' || "$1" = 'help' ]]; then
     echo " "
     echo "Queue definitions for the specified Queue Manager"
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
echo "CLEAR  QL(DUMMY.TEST.BAK)" >> tmp_mqs_script.mqsc
echo "DELETE QL(DUMMY.TEST.BAK)" >> tmp_mqs_script.mqsc
echo " " >> tmp_mqs_script.mqsc
echo "CLEAR  QL(DUMMY.TEST)" >> tmp_mqs_script.mqsc
echo "DELETE QL(DUMMY.TEST)" >> tmp_mqs_script.mqsc
echo " " >> tmp_mqs_script.mqsc
echo "DELETE SUB('DUMMY.TEST.SUB')">> tmp_mqs_script.mqsc 
echo " " >> tmp_mqs_script.mqsc
echo "END" >> tmp_mqs_script.mqsc
 
runmqsc $qmgr <tmp_mqs_script.mqsc

