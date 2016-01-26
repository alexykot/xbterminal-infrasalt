/etc/php5/fpm/pool.d/zabbix.conf:
  file:
    - managed
    - source: salt://zabbix/server/files/php-zabbix.conf
    - template: jinja

zabbix-www:
  user:
    - present
    - gid_from_name: True

/etc/zabbix/zabbix_server.conf:
  file:
    - managed
    - source: salt://zabbix/server/files/zabbix_server.conf
    - template: jinja
    - makedirs: True
    - context:
      db:
        host: 127.0.0.1
        port: 5432
        password: yatZyoddIt4
        name: zxserver
        user: zxserver

/etc/zabbix/web/zabbix.conf.php:
  file:
    - symlink
    - makedirs: True
    - target: /usr/share/zabbix/conf/zabbix.conf.php
    - require:
      - file: /usr/share/zabbix/conf/zabbix.conf.php

/usr/share/zabbix/conf/zabbix.conf.php:
  file:
    - managed
    - source: salt://zabbix/server/files/zabbix.conf.php
    - makedirs: True
    - follow_symlinks: False
    - template: jinja
    - context:
      db:
        host: 127.0.0.1
        port: 5432
        password: yatZyoddIt4
        name: zxserver
        user: zxserver
      zbx:
        server:
          name: xbthq


/etc/nginx/conf.d/zabbix.conf:
  file:
    - managed
    - source: salt://zabbix/server/files/nginx-zabbix.conf
    - template: jinja
