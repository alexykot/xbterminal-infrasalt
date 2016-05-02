base:
  xbt-bitcoin-01:
    - xbt.openssh
    - xbt.users
    - xbt.bitcoind
  xbt-bitcoincl-01:
    - xbt.openssh
    - xbt.users
    - xbt.bitcoind
  xbt-postgresql-01:
    - xbt.openssh
    - xbt.users
    - xbt.bitcoind
    - xbt.postgres
  xbt-api-01:
    - xbt.openssh
    - xbt.users
    - xbt.uwsgi
    - xbt.app
  xbt-web-01:
    - xbt.openssh
    - xbt.users
    - xbt.postgres
    - xbt.uwsgi
    - xbt.app
  xbt-tasks-01:
    - xbt.openssh
    - xbt.users
    - xbt.postgres
    - xbt.uwsgi
    - xbt.app
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