# db-benchmark

Database benchmark, running database on Docker.

# MySQL

sysbench result.

| Version | Kind | Transaction qps |  MySQL CPU | sysbench CPU | sysbench Threads | innodb_flush_method | innodb_doublewrite |
| ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- |
| 8.0.31 | Select Simple | 29832qps | 4 | 4 | 8 | fsync | ON |
| 8.0.31 | Select Range | 21237qps | 4 | 4 | 8 | fsync | ON |
| 8.0.31 | Select Distinct Range | 16622qps | 4 | 4 | 8 | fsync | ON |
| 8.0.31 | Select Order Range | 18985qps | 4 | 4 | 8 | fsync | ON |
| 8.0.31 | Update Index | 18611qps | 4 | 4 | 8 | fsync | ON |
| 8.0.31 | Update Non-Index | 17600qps| 4 | 4 | 8 | fsync | ON |
| 8.0.31 | Delete Insert | 2728qps | 4 | 4 | 8 | fsync | ON |
| 8.0.31 | ReadWrite | 2510qps | 4 | 4 | 8 | fsync | ON |

| Version | Kind | Transaction qps |  MySQL CPU | sysbench CPU | sysbench Threads | innodb_flush_method | innodb_doublewrite |
| ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- |
| 8.0.31 | Select Simple | 28540qps | 4 | 4 | 8 | O_DIRECT_NO_FSYNC | ON |
| 8.0.31 | Select Range | 21879qps | 4 | 4 | 8 | O_DIRECT_NO_FSYNC | ON |
| 8.0.31 | Select Distinct Range | 17413qps | 4 | 4 | 8 | O_DIRECT_NO_FSYNC | ON |
| 8.0.31 | Select Order Range | 19382qps | 4 | 4 | 8 | O_DIRECT_NO_FSYNC | ON |
| 8.0.31 | Update Index | 19002qps | 4 | 4 | 8 | O_DIRECT_NO_FSYNC | ON |
| 8.0.31 | Update Non-Index | 17456qps | 4 | 4 | 8 | O_DIRECT_NO_FSYNC | ON |
| 8.0.31 | Delete Insert | 2873qps | 4 | 4 | 8 | O_DIRECT_NO_FSYNC | ON |
| 8.0.31 | ReadWrite | 2538qps | 4 | 4 | 8 | O_DIRECT_NO_FSYNC | ON |

| Version | Kind | Transaction qps |  MySQL CPU | sysbench CPU | sysbench Threads | innodb_flush_method | innodb_doublewrite |
| ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- |
| 8.0.31 | Select Simple | 30001qps | 4 | 4 | 8 | O_DIRECT_NO_FSYNC | OFF |
| 8.0.31 | Select Range | 21485qps | 4 | 4 | 8 | O_DIRECT_NO_FSYNC | OFF |
| 8.0.31 | Select Distinct Range | 17323qps | 4 | 4 | 8 | O_DIRECT_NO_FSYNC | OFF |
| 8.0.31 | Select Order Range | 19156qps | 4 | 4 | 8 | O_DIRECT_NO_FSYNC | OFF |
| 8.0.31 | Update Index | 18643qps | 4 | 4 | 8 | O_DIRECT_NO_FSYNC | OFF |
| 8.0.31 | Update Non-Index | 17596qps | 4 | 4 | 8 | O_DIRECT_NO_FSYNC | OFF |
| 8.0.31 | Delete Insert | 2842qps | 4 | 4 | 8 | O_DIRECT_NO_FSYNC | OFF |
| 8.0.31 | ReadWrite | 2605qps | 4 | 4 | 8 | O_DIRECT_NO_FSYNC | OFF |

| Version | Kind | Transaction qps |  MySQL CPU | sysbench CPU | sysbench Threads | innodb_flush_method | innodb_doublewrite |
| ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- |
| 8.0.31 | Select Simple | 29407qps | 4 | 4 | 8 | O_DIRECT | OFF |
| 8.0.31 | Select Range | 21037qps | 4 | 4 | 8 | O_DIRECT | OFF |
| 8.0.31 | Select Distinct Range | 16206qps | 4 | 4 | 8 | O_DIRECT | OFF |
| 8.0.31 | Select Order Range | 19299qps | 4 | 4 | 8 | O_DIRECT | OFF |
| 8.0.31 | Update Index | 18492qps | 4 | 4 | 8 | O_DIRECT | OFF |
| 8.0.31 | Update Non-Index | 17829qps | 4 | 4 | 8 | O_DIRECT | OFF |
| 8.0.31 | Delete Insert | 2826qps | 4 | 4 | 8 | O_DIRECT | OFF |
| 8.0.31 | ReadWrite | 2490qps | 4 | 4 | 8 | O_DIRECT | OFF |

MySQL parameters. `*` is tuned parameter.

```
# General parameters
table_open_cache = 4000
thread_cache = 18

# InnoDB parameters
innodb_buffer_pool_size = 3221225472 (3G) * (Default: 128M)
innodb_log_file_size = 50331648 (48M)
innodb_log_buffer_size = 16777216 (16M)
innodb_flush_log_at_trx_commit = 0 * (Default: 1)
innodb_lock_wait_timeout = 50
innodb_doublewrite = OFF * (Default: ON)
innodb_flush_method = O_DIRECT_NO_FSYNC * (Default: fsync)
innodb_thread_concurrency = 0
innodb_max_dirty_pages_pct = 90
```

# MariaDB

Version | Kind | Transaction qps |  MariaDB CPU | sysbench CPU | sysbench Threads | innodb_flush_method | innodb_doublewrite |
| ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- |
| 10.10 | Select Simple | 52219qps | 4 | 4 | 8 | O_DIRECT | OFF |
| 10.10 | Select Range | 33850qps | 4 | 4 | 8 | O_DIRECT | OFF |
| 10.10 | Select Distinct Range | 19660qps | 4 | 4 | 8 | O_DIRECT | OFF |
| 10.10 | Select Order Range | 24748qps | 4 | 4 | 8 | O_DIRECT | OFF |
| 10.10 | Update Index | 38741qps | 4 | 4 | 8 | O_DIRECT | OFF |
| 10.10 | Update Non-Index | 46308qps | 4 | 4 | 8 | O_DIRECT | OFF |
| 10.10 | Delete Insert | 3656qps | 4 | 4 | 8 | O_DIRECT | OFF |
| 10.10 | ReadWrite | 3083qps | 4 | 4 | 8 | O_DIRECT | OFF |

MariaDB parameters. `*` is tuned parameter.

```
# General parameters
table_open_cache = 4000
thread_cache = 18

# InnoDB parameters
innodb_buffer_pool_size = 3221225472 (3G) * (Default: 128M)
innodb_log_file_size = 50331648 (48M)
innodb_log_buffer_size = 16777216 (16M)
innodb_flush_log_at_trx_commit = 0 * (Default: 1)
innodb_lock_wait_timeout = 50
innodb_doublewrite = OFF * (Default: ON)
innodb_flush_method = O_DIRECT_NO_FSYNC * (Default: fsync)
innodb_thread_concurrency = 0
innodb_max_dirty_pages_pct = 90
```


# PostgreSQL

# SQL Server
