#!/bin/bash
set -euo pipefail

apt install -y curl unzip
curl -L -o ~/sysbench-tpcc.zip https://github.com/Percona-Lab/sysbench-tpcc/archive/refs/heads/master.zip
cd ~ && unzip -o ~/sysbench-tpcc.zip
cp ~/sysbench-tpcc-master/* /usr/share/sysbench/

# percona tpcc (do not use git. git install has sybench performance penalty)
# * --threads	The number of threads to run the operation at. This simulates the number of users addressing the database. Some example values are: 8, 16, 24, 32, 48, 64, 96, 128, 256, 512, and 1024. The higher the thread count the more the system resource usage will be. Default is 1.
# * --tables	The number of tables to create in the database/schema.
# * --scale	The scale factor (warehouses) which increases the amount of data to work on overall. Increase --tables and --scale to increase the database size and number of rows operated on. As a rough estimation, 100 warehouses with 1 table set produces about 10GB of data in non-compressed InnoDB tables (so 100 warehouses with 10 table sets gives about 100GB -- 50 tables and 500 warehouses offer 2.5TB-3TB of database size.)
sysbench /usr/share/sysbench/tpcc.lua --threads=8 --tables=5 --scale=1 --db-driver=mysql --mysql-db=sb_test --mysql-host=mysql --mysql-user=root --mysql-password=password prepare

# tpc-c
sysbench /usr/share/sysbench/tpcc.lua --threads=8 --time=30 --tables=5 --scale=1 --db-driver=mysql --mysql-db=sb_test --mysql-host=mysql --mysql-user=root --mysql-password=password run
