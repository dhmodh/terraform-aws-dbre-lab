#!/bin/bash

docker exec dev-postgres-primary psql \
-U dishant \
-d healthcare_dbre \
-c "
SELECT
application_name,
client_addr,
state,
sync_state,
pg_size_pretty(
pg_wal_lsn_diff(
pg_current_wal_lsn(),
replay_lsn
)
) AS replication_lag
FROM pg_stat_replication;
"
