base:
  '*':
    - core
    - maratsh
    - openssh
    - openssh.config
    - users
    - hostname
    - zabbix.agent
  'G@roles:xbt-sentry':
    - redis
    - database
    - sentry
    - postfix
  'G@roles:xbt-api':
    - xbtapp
    - postfix
  'G@roles:xbt-web':
    - xbtapp
    - postfix
  'G@roles:xbt-tasks':
    - xbtapp
    - xbtapp.tasks
    - postfix
  xbt-monitoring-01:
    - core
    - maratsh
    - openssh
    - openssh.config
    - users
    - hostname
    - postgres
    - postfix
  xbt-postgresql-01:
    - core
    - maratsh
    - openssh
    - openssh.config
    - users
    - hostname
    - database
  xbt-bitcoincl-01:
    - core
    - maratsh
    - openssh
    - openssh.config
    - users
    - hostname
    - bitcoind
  xbt-stage-bitcoin-01:
    - core
    - maratsh
    - openssh
    - openssh.config
    - users
    - hostname
    - bitcoind
