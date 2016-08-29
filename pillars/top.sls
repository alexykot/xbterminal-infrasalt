base:
  'xbt-*':
    - xbt.minion
    - xbt.time
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
  xbt-bitcoin-01:
    - xbt.openssh
    - xbt.users
    - xbt.bitcoind
    - xbt.discovery
  xbt-bitcoincl-01:
    - xbt.openssh
    - xbt.users
    - xbt.bitcoind
    - xbt.discovery
  xbt-postgresql-01:
    - xbt.openssh
    - xbt.users
    - xbt.bitcoind
    - xbt.postgres
  xbt-tasks-*:
    - xbt.openssh
    - xbt.users
    - xbt.postgres
    - xbt.uwsgi
    - xbt.app
    - xbt.discovery
  xbt-stage-bitcoin-01:
    - xbt-stage.openssh
    - xbt-stage.users
    - xbt-stage.bitcoind
  xbt-dev:
    - xbt.openssh
    - xbt.users
  xbt-build-main:
    - xbt.openssh
    - xbt.users
  xbt-build-slave-scw-01:
    - xbt.users
  xbt-salt-master-01:
    - xbt.users
    - xbt.openssh
  xbt-repo:
    - xbt.users
    - xbt.openssh
  xbt-build-slave-ami:
    - xbt.users
  xbt-monitoring-01:
    - xbt.users
    - xbt.openssh
    - xbt.zabbix
    - xbt.nginx
    - xbt.discovery