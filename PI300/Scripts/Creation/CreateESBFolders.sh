#!/bin/sh

displayUsage()
{
    echo -e ***Invalid number of parameters***
    echo -e 'Usage: CreateESBFolders <Environment> where Environment is DEV/DEV2/SIT/PRF/PRD'
    echo -e 'where DEV is for R3 CIT and DEV2 is for PSM/R4 CIT'
}

echo -e  'Starting : ' && date
if [[ $# -ne 1 ]]
then
    displayUsage
    exit 2
fi

ENV=$1

# Create Folders for Inbound MoveIt Jobs.
echo Creating Inbound Folders for oramoveit for $ENV

mkdir /MQHA/$ENV/oramoveit/in/suppliers
mkdir /MQHA/$ENV/oramoveit/in/suppliers/DSDOrder

mkdir /MQHA/$ENV/oramoveit/in/psr
mkdir /MQHA/$ENV/oramoveit/in/psr/stocksales

# Need to set GUID bit so, file creation has mqm group instead of oramoveitdev so can be read by IIB.
chmod g+s -R /MQHA/$ENV/oramoveit/in/suppliers
chmod g+s -R /MQHA/$ENV/oramoveit/in/psr


chown mqm:mqm -R /MQHA/$ENV/oramoveit/in/suppliers
chown mqm:mqm -R /MQHA/$ENV/oramoveit/in/psr

chmod 770 -R /MQHA/$ENV/oramoveit/in/suppliers
chmod 770 -R /MQHA/$ENV/oramoveit/in/psr
