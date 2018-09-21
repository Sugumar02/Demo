broker=$1
mqsicreateexecutiongroup $broker -e OracleFinancial
mqsichangeproperties $broker -e OracleFinancial -o HTTPConnector -n explicitlySetPortNumber -v 7905