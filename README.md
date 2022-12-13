# db-benchmark

Database benchmark, running database on Docker.

# MySQL

sysbench.

| Kind | Transaction qps |  MySQL CPU | sysbench CPU | sysbench Threads |
---- | ---- | ---- | ---- | ----
| Select Simple | 30000qps | 4 | 4 | 8 |
| Select Range | 21000qps | 4 | 4 | 8 |
| Select Distinct Range | 16800qps | 4 | 4 | 8 |
| Select Order Range | 19000qps | 4 | 4 | 8 |
| Update Index | 19000qps | 4 | 4 | 8 |
| Update Non-Index | 17000qps| 4 | 4 | 8 |
| Delete Insert | 2900qps | 4 | 4 | 8 |
| ReadWrite | 2700qps | 4 | 4 | 8 |

# MariaDB

# PostgreSQL

# SQL Server
