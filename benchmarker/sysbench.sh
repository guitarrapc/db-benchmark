#!/bin/bash
set -euo pipefail

#sysbench /usr/share/sysbench/oltp_read_write.lua --mysql-db=benchamrk_db --db-driver=mysql --table-size=40000000 --mysql-host=127.0.0.1:3306 --mysql-user=root --mysql-password=password --time=180 --threads=512 --db-ps-mode=disable run

# * table_size: not effect qps
# * time: test duration seconds
# * threads: CPU Core * 2
# * db-ps-mode: disable or auto. disable means use Dabase's prepared statement. should be disable.
sysbench /usr/share/sysbench/oltp_common.lua --mysql-db=sb_test --db-driver=mysql --mysql-host=mysql --mysql-user=root --mysql-password=password --time=30 --table_size=1000000 --db-ps-mode=disable prepare
time sysbench /usr/share/sysbench/oltp_read_write.lua --mysql-db=sb_test --db-driver=mysql --mysql-host=mysql --mysql-user=root --mysql-password=password --time=30 --threads=8 --table_size=1000000 --db-ps-mode=disable run
