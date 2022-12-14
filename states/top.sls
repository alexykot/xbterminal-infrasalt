base:
  '*':
    - core
    - xbtsafety
    - maratsh
    - openssh
    - openssh.config
    - users
    - hostname
    - zabbix.agent
    - chrony.config
    - xbtsyslog.collector
  'xbt-repo':
    - xbtrepo
  'G@roles:xbtsam':
    - xbtsam
    - mongodb
  'G@roles:xbt-syslog':
    - xbtsyslog
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
  xbt-stage-bitcoin-01:
    - core
    - maratsh
    - openssh
    - openssh.config
    - users
    - hostname
    - bitcoind
  'G@roles:xbtbitcoin':
    - core
    - maratsh
    - openssh
    - openssh.config
    - users
    - hostname
    - bitcoind-abc