base:
  '*':
    - core
    - maratsh
    - openssh
    - openssh.config
    - users
    - hostname
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
    - postgresql
  xbt-bitcoin-01:
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