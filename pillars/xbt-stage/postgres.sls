database:
  datadisk:
    dev: '/dev/xvdh'
    dir: '/var/lib/postgresql/'
  backup:
    passhrase: |
      -----BEGIN PGP MESSAGE-----
      Version: GnuPG v2

      hQEMA/XI2iCydQqJAQf+KIm2QcX+066TP9lMKjf/wilxJmQAP7RgSfoyvU27PhQV
      MFRgiKSs4dSZt4/ZYUAdGtmyKSs9t4iz6t/dvzlkpmVFkvnfF/BnCqvdoRYiB4ew
      QZ1Vg9voq6tSmUHWT7sja2i+jgFtPV2k/WVFhqbjUGFYx0VJuy46gDswXIGs2ugP
      D9UTuh6Tw8lXDlMQ2fxg9WZM/o0U83E+ZHHQpYTnZUjHyQqkNGO5GjI3RjzG9N4j
      nPLoZ7NpTJ/pGRkua0CDtiwcYHBsNFD+OpSX15waxf7cGcShXQlamVlVSvQU9+2a
      RncFtXMFGeDbm9mHKXymQuqBZ6rV7vHHYjYc6nx8/NJGATclg+UqHSCFugWkLbZp
      IFGY2XelExVEnwCVrS9QEOpM6L8rY+XkwpDGUB6H0HbwJudTVzgWgQPR1lSc9e5B
      KtJ9S9+Xhw==
      =mHx0
      -----END PGP MESSAGE-----
      
    aki: 'AKIAIPWJ5XQJWYDCJYLA'
    sak: ''
    dest: 's3://s3-eu-west-1.amazonaws.com/backup-xbt-app/database/postgresql/'
    src: '/var/backups/xbt/postgres/'

postgres:
  pg_hba.conf: salt://postgres/pg_hba.conf
  commands:
    initdb: '/usr/lib/postgresql/9.5/bin/initdb -D '

  use_upstream_repo: True
  init_db: True

  lookup:
    pkg: 'postgresql-9.5'
    pkg_client: 'postgresql-client-9.5'
    pkgs_extra:
      - postgresql-contrib
      - postgresql-plpython-9.5
    pg_hba: '/etc/postgresql/9.5/main/main/pg_hba.conf'
    data_dir: '/var/lib/postgresql/9.5/main/'
    conf_dir: '/etc/postgresql/9.5/main/'
    #service: postgresql@9.5-main

  users:
    xbterm_usr:
      ensure: present
      password: 'n6L{Yx@BXWP2Zd*3'
      createdb: False
      createroles: False
      createuser: False
      inherit: True
      replication: False

  # This section cover this ACL management of the pg_hba.conf file.
  # <type>, <database>, <user>, [host], <method>
  acls:
    - ['host', 'xbterminal', 'xbterm_usr', '172.90.205.0/24', 'md5']
    - ['local', 'replication', 'postgres',  'peer']

  databases:
    xbterminal:
      owner: 'xbterm_usr'
      user: 'xbterm_usr'
      template: 'template0'
      lc_ctype: 'en_US.UTF-8'
      lc_collate: 'en_US.UTF-8'
      # optional extensions to enable on database
      extensions:
        uuid-ossp:
  postgresconf: |
    listen_addresses = '*'
    port = 5432
    max_connections = 100
    default_statistics_target = 100
    checkpoint_completion_target = 0.9
    min_wal_size = 10485760
    max_wal_size = 268435456
    dynamic_shared_memory_type = posix
    effective_cache_size = 1000MB
    maintenance_work_mem = 128MB
    shared_buffers = 512MB
    wal_buffers = 16MB
    wal_level = hot_standby
    work_mem = 5MB
    max_wal_senders = 4
    timezone = 'localtime'
    datestyle = 'iso, mdy'
    default_text_search_config = 'pg_catalog.english'
    lc_messages = 'en_US.UTF-8'
    lc_monetary = 'en_US.UTF-8'
    lc_numeric = 'en_US.UTF-8'
    lc_time = 'en_US.UTF-8'
    log_line_prefix = '%t [%p-%l] %q%u@%d '
    log_timezone = 'localtime'
