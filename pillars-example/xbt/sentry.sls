postfix:
  config:
    relay:
      host: 'email-smtp.eu-west-1.amazonaws.com'
      port: 587
      user: 'AKIAIX'
      port: 'Aqz3Cx'


sentry:
  config:
    DATABASES:
      default:
        ENGINE: 'sentry.db.postgres'
        NAME: 'sentrydb'
        USER: 'sentry_usr'
        PASSWORD: 'zX'
        HOST: '127.0.0.1'
        PORT: 5432
    yml:
      mail.backend:  smtp
      mail.from: 'sentr@xbthq.co.uk'
      mail.host: '127.0.0.1'
      mail.port: 25
        redis.clusters:
          default:
            hosts:
              0:
                host: 127.0.0.1
                port: 6379
                db: 4


database:
  datadisk:
    dev: '/dev/xvdh'
    dir: '/var/lib/postgresql/'

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
    sentry_usr:
      ensure: present
      password: 'zX'
      createdb: False
      createroles: False
      createuser: False
      inherit: True
      replication: False

  # This section cover this ACL management of the pg_hba.conf file.
  # <type>, <database>, <user>, [host], <method>
  acls:
    - ['host', 'sentrydb', 'sentry_usr', '127.0.0.1/32', 'md5']
    - ['local', 'replication', 'postgres',  'peer']

  databases:
    sentrydb:
      owner: 'sentry_usr'
      user: 'sentry_usr'
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
