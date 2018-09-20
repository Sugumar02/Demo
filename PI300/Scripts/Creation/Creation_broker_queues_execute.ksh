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

runmqsc $qmgr <BrokerMQObjects.mqsc
