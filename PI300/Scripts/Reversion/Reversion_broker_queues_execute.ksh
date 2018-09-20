
## Queue definitions
if [[ "$#" = 0 || "$1" = '-?' || "$1" = '?' || "$1" = '-help' || "$1" = 'help' ]]; then
     echo " "
     echo "Queue definitions for the specified Queue Manager"
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
echo "CLEAR  QL(ESB.PSM.ASNOUT.THROTTLE)" >> tmp_mqs_script.mqsc
echo "DELETE QL(ESB.PSM.ASNOUT.THROTTLE)" >> tmp_mqs_script.mqsc
echo " " >> tmp_mqs_script.mqsc
echo "CLEAR  QL(ESB.PSM.ASNOUT.THROTTLE.BAK)" >> tmp_mqs_script.mqsc
echo "DELETE QL(ESB.PSM.ASNOUT.THROTTLE.BAK)" >> tmp_mqs_script.mqsc
echo " " >> tmp_mqs_script.mqsc
echo "CLEAR  QL(ESB.PSM.ASNOUT)" >> tmp_mqs_script.mqsc
echo "DELETE QL(ESB.PSM.ASNOUT)" >> tmp_mqs_script.mqsc
echo " " >> tmp_mqs_script.mqsc
echo "CLEAR  QL(ESB.PSM.ASNOUT.BAK)" >> tmp_mqs_script.mqsc
echo "DELETE QL(ESB.PSM.ASNOUT.BAK)" >> tmp_mqs_script.mqsc
echo " " >> tmp_mqs_script.mqsc
echo "CLEAR  QL(ESB.USER.1113.BAK)" >> tmp_mqs_script.mqsc
echo "DELETE QL(ESB.USER.1113.BAK)" >> tmp_mqs_script.mqsc
echo " " >> tmp_mqs_script.mqsc
echo "DELETE SUB('ESB.RMS.ASNOUT.SUB')">> tmp_mqs_script.mqsc 
echo " " >> tmp_mqs_script.mqsc
echo "DELETE TOPIC('PSM.ASNOUT.TOPIC')">> tmp_mqs_script.mqsc 
echo " " >> tmp_mqs_script.mqsc
echo "END" >> tmp_mqs_script.mqsc
 
runmqsc $qmgr <tmp_mqs_script.mqsc

