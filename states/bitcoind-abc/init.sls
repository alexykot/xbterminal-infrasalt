{% from "bitcoind-abc/map.jinja" import bitcoind_abc  with context %}
{% set bd = bitcoind_abc %}


include:
  - bitcoind-abc.user
  - bitcoind-abc.datadisk
  - bitcoind-abc.configure
  - bitcoind-abc.install

bitcoind:
  service:
    - running
    - enable: True
    - sig: '/usr/bin/bitcoind'
    - init_delay: 1
    - watch:
      - file: /etc/bitcoin/*
      - cmd: bitcoind-service
      - file: /var/bitcoind/shaper.sh
      - user: bitcoind
      - file: blockchain-dir


blockchain-dir:
  file:
    - directory
    - name: {{ bd.config.datadir }}
    - user: bitcoind
    - group: bitcoind
    - recurse:
      - user
      - group