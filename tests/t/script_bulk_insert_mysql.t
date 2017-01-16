########################################################################
bulk_insert.lua + MySQL tests
########################################################################

  $ if [ -z "${SBTEST_MYSQL_ARGS:-}" ]
  > then
  >   exit 80
  > fi

  $ function db_show_table() {
  >   mysql -uroot sbtest -Nse "SHOW CREATE TABLE $1\G"
  > }

  $ DB_DRIVER_ARGS="--db-driver=mysql $SBTEST_MYSQL_ARGS"
  $ . $SBTEST_INCDIR/script_bulk_insert_common.sh
  Creating table 'sbtest1'...
  Creating table 'sbtest2'...
  *************************** 1. row ***************************
  sbtest1
  CREATE TABLE `sbtest1` (
    `id` int(11) NOT NULL,
    `k` int(11) NOT NULL DEFAULT '0',
    PRIMARY KEY (`id`)
  ) ENGINE=InnoDB * (glob)
  *************************** 1. row ***************************
  sbtest2
  CREATE TABLE `sbtest2` (
    `id` int(11) NOT NULL,
    `k` int(11) NOT NULL DEFAULT '0',
    PRIMARY KEY (`id`)
  ) ENGINE=InnoDB * (glob)
  ERROR 1146 (42S02) at line 1: Table 'sbtest.sbtest3' doesn't exist
  sysbench * (glob)
  
  Running the test with following options:
  Number of threads: 2
  Initializing random number generator from current time
  
  
  Initializing worker threads...
  
  Threads started!
  
  OLTP test statistics:
      queries performed:
          read:                            0
          write:                           2
          other:                           0
          total:                           2
      transactions:                        100    (* per sec.) (glob)
      queries:                             2      (* per sec.) (glob)
      ignored errors:                      0      (0.00 per sec.)
      reconnects:                          0      (0.00 per sec.)
  
  General statistics:
      total time:                          *s (glob)
      total number of events:              100
      total time taken by event execution: *s (glob)
  
  Latency statistics:
           min:                              *.*ms (glob)
           avg:                              *.*ms (glob)
           max:                              *.*ms (glob)
           approx.  95th percentile:         *.*ms (glob)
  
  Threads fairness:
      events (avg/stddev):* (glob)
      execution time (avg/stddev):* (glob)
  
  Dropping table 'sbtest1'...
  Dropping table 'sbtest2'...
  ERROR 1146 (42S02) at line 1: Table 'sbtest.sbtest1' doesn't exist
  ERROR 1146 (42S02) at line 1: Table 'sbtest.sbtest2' doesn't exist
  ERROR 1146 (42S02) at line 1: Table 'sbtest.sbtest3' doesn't exist