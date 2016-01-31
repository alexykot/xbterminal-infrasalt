base:
  xbt-monitoring-01:
    - core
    - maratsh
    - openssh
    - openssh.config
    - users
    - hostname
    - postgres
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