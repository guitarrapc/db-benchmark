-- default 128MB. change to 2GB
SHOW GLOBAL VARIABLES LIKE 'innodb_buffer_pool_size'
SET GLOBAL innodb_buffer_pool_size = 2415919104;

-- TRANSACTION OPTIMIZATION.
-- default 1. change to 0. performance gain 2000qps -> 2600qps.
SHOW GLOBAL VARIABLES LIKE 'innodb_flush_log_at_trx_commit';
SET GLOBAL innodb_flush_log_at_trx_commit = 0;

-- default 1. no performance gain.
-- SHOW GLOBAL VARIABLES LIKE 'autocommit';
-- SET GLOBAL AUTOCOMMIT = 0;

-- default `all`, nothing change.
-- SHOW GLOBAL VARIABLES LIKE 'innodb_change_buffering';
-- SET GLOBAL innodb_change_buffering = all

-- default 8192. no performance gain.
-- SHOW GLOBAL VARIABLES LIKE 'innodb_log_write_ahead_size';
-- SET GLOBAL innodb_log_write_ahead_size = 16384;

-- default 200. no performance gain.
-- SHOW GLOBAL VARIABLES LIKE "innodb_io_capacity";
-- SET GLOBAL innodb_io_capacity = 2000;
