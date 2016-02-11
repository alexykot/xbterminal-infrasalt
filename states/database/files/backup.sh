#!/usr/bin/env bash

set -u
set -e

backup ()
{
  export PASSPHRASE='{{ b.passhrase}}'
  export AWS_ACCESS_KEY_ID='{{ b.aki }}'
  export AWS_SECRET_ACCESS_KEY='{{ b.sak }}'

  cd /var/backups/xbt/postgres/
  rm /var/backups/xbt/postgres/* -rf

  su -s /bin/bash -c "pg_basebackup -v -x -D /var/backups/xbt/postgres/" postgres
  duplicity  $1  \
    --volsize 500  \
    --s3-use-new-style \
    --s3-multipart-chunk-size 10 \
    -v3 \
    {{ b.src }} {{ b.dest }}

    sync; echo 2 > /proc/sys/vm/drop_caches
}

backup $1
