#!/bin/bash
set -euo pipefail

# sysbench
# * table_size: not effect qps
# * time: test duration seconds
# * threads: CPU Core * 2
# * db-ps-mode: disable or auto. disable means use Dabase's prepared statement. should be disable.
sysbench /usr/share/sysbench/oltp_common.lua --mysql-db=sb_test --db-driver=mysql --mysql-host=mysql --mysql-user=root --mysql-password=password --table_size=100000 --db-ps-mode=disable prepare
time sysbench /usr/share/sysbench/oltp_read_write.lua --mysql-db=sb_test --db-driver=mysql --mysql-host=mysql --mysql-user=root --mysql-password=password --time=30 --table_size=100000 --db-ps-mode=disable --threads=8 run
