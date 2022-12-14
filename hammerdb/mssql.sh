#!/bin/bash
set -euo pipefail

isql -v -k "DRIVER={ODBC Driver 17 for SQL Server};TrustServerCertificate=yes;Server=sqlserver;UID=sa;PWD=Password!"
isql -v -k "DRIVER={ODBC Driver 18 for SQL Server};TrustServerCertificate=yes;Server=sqlserver;UID=sa;PWD=Password!"

./hammerdbcli

dbset db mssqls
dbset bm TPC-C
diset connection mssqls_tcp true
diset connection mssqls_linux_server sqlserver
diset connection mssqls_authentication sql
diset connection mssqls_pass Password!
diset tpcc mssqls_driver timed
diset tpcc mssqls_dbase tpcc_a
diset connection mssqls_odbc_driver "ODBC Driver 17 for SQL Server"
diset connection mssqls_linux_odbc "ODBC Driver 17 for SQL Server"
print dict

buildschema
datagenrun
vudestroy

loadscript

vuset vu 4
vuset logtotemp 1
vuset unique 1
vuset timestamps 1
print vuconf

vucreate
vustatus

vurun
