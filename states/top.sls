base:
  '*':
    - core
    - maratsh
    - openssh
    - openssh.config
    - users
    - hostname
  'G@roles:xbt-api':
    - xbtapp    
  xbt-tasks-01:
    - core
    - maratsh
    - openssh
    - openssh.config
    - users
    - hostname
    - xbtapp
    - xbtapp.tasks
  xbt-web-01:
    - core
    - maratsh
    - openssh
    - openssh.config
    - users
    - hostname
    - xbtapp
  xbt-monitoring-01:
    - core
    - maratsh
    - openssh
    - openssh.config
    - users
    - hostname
    - postgres
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
