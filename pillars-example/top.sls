base:
  'G@roles:xbt-api':
    - xbtapp
    - xbt.openssh
    - xbt.users
    - xbt.discovery
  'G@roles:xbt-web':
    - xbtapp
    - xbt.openssh
    - xbt.users
    - xbt.discovery
  'G@roles:xbt-tasks':
    - xbtapp
    - xbt.openssh
    - xbt.users
    - xbt.discovery
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
    - xbt.app

