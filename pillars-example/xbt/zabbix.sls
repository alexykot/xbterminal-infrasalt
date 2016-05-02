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
    zxserver:
      ensure: present
      password: 'yatZyoddIt4'
      createdb: False
      createroles: False
      createuser: False
      inherit: True
      replication: False

  # This section cover this ACL management of the pg_hba.conf file.
  # <type>, <database>, <user>, [host], <method>
  acls:
    - ['local', 'zxserver', 'zxserver']
    - ['host', 'zxserver', 'zxserver', '127.0.0.1/32', 'md5']

  databases:
    zxserver:
      owner: 'zxserver'
      user: 'zxserver'
      template: 'template0'
      lc_ctype: 'C.UTF-8'
      lc_collate: 'C.UTF-8'
      # optional schemas to enable on database
      schemas:
        uuid_ossp:
          owner: zxserver
      # optional extensions to enable on database
      extensions:
        uuid-ossp:
          schema: uuid_ossp
  postgresconf: |
    listen_addresses = 'localhost,*'

