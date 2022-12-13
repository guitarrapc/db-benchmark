#!/bin/bash
set -euo pipefail

# see scenarios: https://hiroi10.hatenablog.com/entry/2019/12/18/000009

# sysbench
# * table_size: not effect qps
# * time: test duration seconds
# * threads: CPU Core * 2
# * db-ps-mode: disable or auto. disable means use Dabase's prepared statement. should be disable.
sysbench /usr/share/sysbench/oltp_common.lua --mysql-db=sb_test --db-driver=mysql --mysql-host=mysql --mysql-user=root --mysql-password=password --table_size=100000 --db-ps-mode=disable prepare

# select simple (30000qps)
time sysbench /usr/share/sysbench/oltp_read_only.lua --mysql-db=sb_test --db-driver=mysql --mysql-host=mysql --mysql-user=root --mysql-password=password --time=60 --table_size=100000 --db-ps-mode=disable --threads=8 --point_selects=1 --range_selects=0 run

# select range (21000qps)
time sysbench /usr/share/sysbench/oltp_read_only.lua --mysql-db=sb_test --db-driver=mysql --mysql-host=mysql --mysql-user=root --mysql-password=password --time=60 --table_size=100000 --db-ps-mode=disable --threads=8 --point_selects=0 --range_selects=1 --range_size=100 --distinct_ranges=0 --simple_ranges=1 --sum_ranges=0 --order_ranges=0 run

# select distinct range (16800qps)
time sysbench /usr/share/sysbench/oltp_read_only.lua --mysql-db=sb_test --db-driver=mysql --mysql-host=mysql --mysql-user=root --mysql-password=password --time=60 --table_size=100000 --db-ps-mode=disable --threads=8 --point_selects=0 --range_selects=1 --range_size=100 --distinct_ranges=1 --simple_ranges=0 --sum_ranges=0  --order_ranges=0 run

# select order range (19000qps)
time sysbench /usr/share/sysbench/oltp_read_only.lua --mysql-db=sb_test --db-driver=mysql --mysql-host=mysql --mysql-user=root --mysql-password=password --time=60 --table_size=100000 --db-ps-mode=disable --threads=8 --point_selects=0 --range_selects=1 --range_size=100 --distinct_ranges=0 --simple_ranges=0 --sum_ranges=0 --order_ranges=1 run

# update index (19000qps)
time sysbench /usr/share/sysbench/oltp_read_write.lua --mysql-db=sb_test --db-driver=mysql --mysql-host=mysql --mysql-user=root --mysql-password=password --time=60 --table_size=100000 --db-ps-mode=disable --threads=8 --point_selects=0 --range_selects=0 --index_updates=1 --non_index_updates=0 --delete_inserts=0 run

# update no-index (17000qps)
time sysbench /usr/share/sysbench/oltp_read_write.lua --mysql-db=sb_test --db-driver=mysql --mysql-host=mysql --mysql-user=root --mysql-password=password --time=60 --table_size=100000 --db-ps-mode=disable --threads=8 --point_selects=0 --range_selects=0 --index_updates=0 --non_index_updates=1 --delete_inserts=0 run

# delete insert (2900qps)
time sysbench /usr/share/sysbench/oltp_read_write.lua --mysql-db=sb_test --db-driver=mysql --mysql-host=mysql --mysql-user=root --mysql-password=password --time=60 --table_size=100000 --db-ps-mode=disable --threads=8 --index_updates=0 --non_index_updates=0 --delete_inserts=1 run

# read write (2700qps)
time sysbench /usr/share/sysbench/oltp_read_write.lua --mysql-db=sb_test --db-driver=mysql --mysql-host=mysql --mysql-user=root --mysql-password=password --time=60 --table_size=100000 --db-ps-mode=disable --threads=8 run
