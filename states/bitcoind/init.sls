{% set bd = pillar['bitcoind'] %}

include:
  - xbthq.repo

/etc/bitcoin/bitcoind.conf:
  file:
    - managed
    - source: salt://bitcoind/files/bitcoind.conf
    - template: jinja
    - context:
      bd: {{ bd }}

/lib/systemd/system/bitcoind.service:
  file:
    - managed
    - source: salt://bitcoind/files/bitcoind.service

bitcoind-service:
  cmd:
    - wait
    - name: systemctl daemon-reload
    - watch:
      - file: /lib/systemd/system/bitcoind.service

/var/bitcoind/shaper.sh:
  file:
    - managed
    - source: salt://bitcoind/files/shaper.sh

bitcoind:
  service:
    - running
    - enable: True
    - watch:
      - pkg: bitcoind
      - file: /etc/bitcoin/bitcoind.conf
      - cmd: bitcoind-service
      - file: /var/bitcoind/shaper.sh
      - user: bitcoind
  pkg:
    - installed
    - require:
      - file: /etc/apt/sources.list.d/xbterminal-backend.list
  user:
    - present
    - uid: 1001
    - gid: 1001
    - home: /var/bitcoind
