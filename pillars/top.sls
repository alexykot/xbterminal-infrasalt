base:
  'xbt-*':
    - xbt.minion
    - xbt.time
    - xbt.hq
    - xbt.syslog_collector
  'G@roles:xbt-syslog':
    - xbt.openssh
    - xbt.users
    - xbt.syslog
  'G@roles:xbt-sentry':
    - xbt.openssh
    - xbt.users
    - xbt.sentry
  'G@roles:xbt-ca':
    - xbt.openssh
    - xbt.users
  'G@roles:xbt-sftp':
    - xbt.openssh-sftp
    - xbt.users
  'G@roles:xbt-api':
    - xbt.app
    - xbt.openssh
    - xbt.users
    - xbt.discovery
  'G@roles:xbt-web':
    - xbt.app
    - xbt.openssh
    - xbt.users
    - xbt.discovery
  xbt-bitcoin-0*:
    - xbt.openssh
    - xbt.users
    - xbt.bitcoind
    - xbt.discovery
  xbt-stage-bitcoin-*:
    - xbt-stage.openssh
    - xbt-stage.users
    - xbt-stage.bitcoind
  'G@roles:xbt-tasks':
    - xbt.openssh
    - xbt.users
    - xbt.uwsgi
    - xbt.app
    - xbt.discovery
  xbt-dev:
    - xbt.openssh
    - xbt.users
  xbt-build-main:
    - xbt.openssh
    - xbt.users
  xbt-build-slave-scw-01:
    - xbt.users
  xbt-repo:
    - xbt.nginx_ssl
    - xbt.users
    - xbt.repo
    - xbt.openssh
  xbt-build-slave-ami:
    - xbt.users
  xbt-monitoring-01:
    - xbt.users
    - xbt.openssh
    - xbt.zabbix
    - xbt.nginx
    - xbt.discovery
  xbt-stage-sam-01:
    - xbt-stage.sam
    - xbt.users
    - xbt.openssh
    - xbt.zabbix
  xbt-salt-master-01:
    - xbt.users
    - xbt.openssh
    - xbt.zabbix
    - xbt.nginx
    - xbt.nginx_ssl
