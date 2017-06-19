{% set bd = pillar['bitcoind'] %}

include:
  - xbthq.repo
  - bitcoind.user
  - bitcoind.datadisk
  - bitcoind.configure

extend:
  directory-datadisk:
    file:
      - require:
        - user: bitcoind-user

blockchain-dir:
  file:
    - directory
    - name: {{ bd.datadir }}
    - user: bitcoind
    - group: bitcoind
    - require:
      - mount: mount-datadisk


bitcoind:
  service:
    - running
    - enable: True
    - sig: '/usr/bin/bitcoind'
    - init_delay: 1
    - watch:
      - pkg: bitcoind
      - file: /etc/bitcoin/*
      - cmd: bitcoind-service
      - file: /var/bitcoind/shaper.sh
      - user: bitcoind
      - file: blockchain-dir
  pkg:
    - installed
    - refresh: True
    - version: '0.13.1-0.1'
    - require:
      - file: /etc/apt/sources.list.d/xbterminal-backend.list


libevent:
  pkg:
    - installed
    - pkgs:
      - libevent-2.0-5: '2.0.21-stable-2+deb8u1'
      - libevent-core-2.0-5:  '2.0.21-stable-2+deb8u1'
      - libevent-pthreads-2.0-5: '2.0.21-stable-2+deb8u1'
