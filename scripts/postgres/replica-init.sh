#!/bin/bash
set -e

rm -rf /var/lib/postgresql/data/*

PGPASSWORD=replica123 pg_basebackup \
  -h postgres-primary \
  -D /var/lib/postgresql/data \
  -U replicator \
  -Fp \
  -Xs \
  -P \
  -R

chmod 0700 /var/lib/postgresql/data

exec postgres
