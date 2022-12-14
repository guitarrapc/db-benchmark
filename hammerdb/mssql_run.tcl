#!/usr/bin/tclsh

# reference: https://www.hammerdb.com/docs/ch09s09.html

# ./hammerdbclit auto mssql_run.tcl

# isql -v -k "DRIVER={ODBC Driver 17 for SQL Server};TrustServerCertificate=yes;Server=sqlserver;UID=sa;PWD=Password_"
# isql -v -k "DRIVER={ODBC Driver 18 for SQL Server};TrustServerCertificate=yes;Server=sqlserver;UID=sa;PWD=Password_"

# ./hammerdbcli < mssql.tcl

puts "ETTING CONFIGURATION"
dbset db mssqls
dbset bm TPC-C
diset connection mssqls_tcp false
diset connection mssqls_linux_server sqlserver
diset connection mssqls_authentication sql
diset connection mssqls_pass Password_
diset tpcc mssqls_driver timed
diset tpcc mssqls_dbase tpcc_a
diset tpcc mssqls_rampup 0
diset tpcc mssqls_duration 1
diset connection mssqls_odbc_driver "ODBC Driver 18 for SQL Server"
diset connection mssqls_linux_odbc "ODBC Driver 18 for SQL Server"

vuset logtotemp 1
vuset unique 1
vuset timestamps 1
print dict
loadscript

puts "TEST SEQUENCE START"
foreach z { 1 2 4 } {
puts "$z VU TEST"
vuset vu $z
vucreate
vustatus
vurun
vudestroy
}
puts "TEST SEQUENCE COMPLETE"
exit
