# db-benchmark

Database benchmark, running database on Docker.

# MySQL

sysbench result.

| Kind | Transaction qps |  MySQL CPU | sysbench CPU | sysbench Threads | innodb_flush_method | innodb_doublewrite |
---- | ---- | ---- | ---- | ---- | ---- | ---- |
| Select Simple | 30000qps | 4 | 4 | 8 | fsync | ON |
| Select Simple | 28540qps | 4 | 4 | 8 | O_DIRECT_NO_FSYNC | ON |
| Select Simple | 30001qps | 4 | 4 | 8 | O_DIRECT_NO_FSYNC | OFF |
| Select Simple | 29407qps | 4 | 4 | 8 | O_DIRECT | OFF |
| Select Range | 21000qps | 4 | 4 | 8 | fsync | ON |
| Select Range | 21879qps | 4 | 4 | 8 | O_DIRECT_NO_FSYNC | ON |
| Select Range | 21485qps | 4 | 4 | 8 | O_DIRECT_NO_FSYNC | OFF |
| Select Range | 21037qps | 4 | 4 | 8 | O_DIRECT | OFF |
| Select Distinct Range | 16800qps | 4 | 4 | 8 | fsync | ON |
| Select Distinct Range | 17413qps | 4 | 4 | 8 | O_DIRECT_NO_FSYNC | ON |
| Select Distinct Range | 17323qps | 4 | 4 | 8 | O_DIRECT_NO_FSYNC | OFF |
| Select Distinct Range | 16206qps | 4 | 4 | 8 | O_DIRECT | OFF |
| Select Order Range | 19000qps | 4 | 4 | 8 | fsync | ON |
| Select Order Range | 19382qps | 4 | 4 | 8 | O_DIRECT_NO_FSYNC | ON |
| Select Order Range | 19156qps | 4 | 4 | 8 | O_DIRECT_NO_FSYNC | OFF |
| Select Order Range | 19299qps | 4 | 4 | 8 | O_DIRECT | OFF |
| Update Index | 19000qps | 4 | 4 | 8 | fsync | ON |
| Update Index | 19002qps | 4 | 4 | 8 | O_DIRECT_NO_FSYNC | ON |
| Update Index | 18063qps | 4 | 4 | 8 | O_DIRECT_NO_FSYNC | OFF |
| Update Index | 18492qps | 4 | 4 | 8 | O_DIRECT | OFF |
| Update Non-Index | 17000qps| 4 | 4 | 8 | fsync | ON |
| Update Non-Index | 17456qps | 4 | 4 | 8 | O_DIRECT_NO_FSYNC | ON |
| Update Non-Index | 17596qps | 4 | 4 | 8 | O_DIRECT_NO_FSYNC | OFF |
| Update Non-Index | 17829qps | 4 | 4 | 8 | O_DIRECT | OFF |
| Delete Insert | 2900qps | 4 | 4 | 8 | fsync | ON |
| Delete Insert | 2873qps | 4 | 4 | 8 | O_DIRECT_NO_FSYNC | ON |
| Delete Insert | 2746qps | 4 | 4 | 8 | O_DIRECT_NO_FSYNC | OFF |
| Delete Insert | 2826qps | 4 | 4 | 8 | O_DIRECT | OFF |
| ReadWrite | 2700qps | 4 | 4 | 8 | fsync | ON |
| ReadWrite | 2538qps | 4 | 4 | 8 | O_DIRECT_NO_FSYNC | ON |
| ReadWrite | 2605qps | 4 | 4 | 8 | O_DIRECT_NO_FSYNC | OFF |
| ReadWrite | 2490qps | 4 | 4 | 8 | O_DIRECT | OFF |

MySQL parameters. `*` is tuned parameter.

```
# General parameters
table_open_cache = 4000
thread_cache = 18

# InnoDB parameters
innodb_buffer_pool_size = 3221225472 (3G) *
innodb_log_file_size = 50331648 (48M)
innodb_log_buffer_size = 16777216 (16M)
innodb_flush_log_at_trx_commit = 0 *
innodb_lock_wait_timeout = 50
innodb_doublewrite = ON
innodb_doublewrite_batch_size = 0
innodb_doublewrite_files = 2
innodb_doublewrite_pages = 4
innodb_flush_method = fsync
innodb_thread_concurrency = 0
innodb_max_dirty_pages_pct = 90
```

# MariaDB

# PostgreSQL

# SQL Server
