include:
  - zabbix.repo
  - zabbix.server.config
  - php.fpm
  - php.pgsql

zabbix-pkgs:
  pkg:
    - installed
    - pkgs:
       - zabbix-server-pgsql
       - zabbix-frontend-php
    - require:
      - pkg: zabbix-release


zabbix-server:
  service:
    - running
    - enable: True
    - watch:
      - file: /etc/zabbix/zabbix_server.conf


apache2:
  service:
    - dead
    - disable: True
    - require:
      - pkg: zabbix-pkgs
