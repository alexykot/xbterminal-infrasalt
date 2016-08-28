#!yaml|gpg

include:
  - xbt.nginx_ssl

postfix:
  config:
    relay:
      host: 'email-smtp.eu-west-1.amazonaws.com'
      port: 587
      user: 'AKIAIAJCDL6MAUXOU53Q'
      password: |
        -----BEGIN PGP MESSAGE-----
        Version: GnuPG v2

        hQEMA/XI2iCydQqJAQf/fl8w8+Y5JJ5rRmO9aKBwQ52msLLbLmIgBWiJebp08t33
        +TSYAkWL6xxi3u2sE1YvBTThx85BrtxZlRWmtn6c8pNL/EyfIfJVrhkIdiys4aAh
        XUq6ADm6SleLJQkVzy2P0fj3+Rc3umrp38lqGof9b1OzPNfYKqyF0ofw3uo2aEre
        vQNQKzIW8e7nTdWpAOkImtyMdeayNwLegJfPMHiI8m9rQT7aFZ3Qd1OQlR5NAlAi
        jEZQ1NtNBAMCoAkgkE5cZcRY0fQip+ssNNQLrW4sfS+Cu4cDyW+1eNQaxJfvbTlr
        xGEfC+/klTvaNsFVOyBYwm+zY10rEJEhCDTAKpXq9tJnAd7VT5ZfIZWM6wAVYqIZ
        q+ur93uym6q5/rnlNm6rOTne6H0at27WoPq+AdAboWiY2lgoP0DvVYXnHySvb0do
        KViBDMZAEykeUWr162zE7Uo7FgPESgB1iu4efM+Jdnb8msvKyNwOnA==
        =BWeO
        -----END PGP MESSAGE-----



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
      password: |
        -----BEGIN PGP MESSAGE-----
        Version: GnuPG v2

        hQEMA/XI2iCydQqJAQf5Ab0DMpVSJwNwtWVJA510ryxNA5DGm8a5Yujzyq6Flsuq
        MNcmNNkdKQozmp8PKFjVS30FMbmJd2tVt6Hw8d3T2pLYr0Mdy5L+u1pkg28e5wCd
        gWRNofmG+bxB/toWHQ72N8eTAB7CMRfgXmOemon1mqtNPN0RkN4C0VQs0K68u1SO
        B25VHTCqSfjVNZobkgfeSsMC5/DPL+yWujEuu8XXR1eGm1cB5I8ZnkzgdKqkirke
        fIlOVI6/AyEsOMTRUkqD59D1yqY7LotJKd5PUNS9vP8brejBmdv9jrp5PqTIfbJ/
        FDzaFTyDjrlSw1nsDJT3JYT4k6WoavRKvcRLYjZnytJGATg2dxBURaLGGteXj/LD
        LTXqRHx26k9zmsCK+7u+bhYvudhzYqD8n4MGjDXANZepMZNAtwLipoY522VN9uLj
        9w4y1aN1Hw==
        =yexg
        -----END PGP MESSAGE-----
          
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
