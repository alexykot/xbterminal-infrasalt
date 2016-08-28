{% set bd = pillar['bitcoind'] %}

bitcoind-service:
  cmd:
    - wait
    - name: systemctl daemon-reload
    - watch:
      - file: /lib/systemd/system/bitcoind.service
    - context:
      bd: {{ bd }}

/var/bitcoind/shaper.sh:
  file:
    - managed
    - source: salt://bitcoind/files/shaper.sh


/etc/bitcoin/bitcoind.conf:
  file:
    - managed
    - source: salt://bitcoind/files/bitcoind.conf
    - template: jinja
    - mode: 0640
    - dir_mode: 0750
    - group: bitcoind
    - user: root
    - makedirs: True
    - context:
      bd: {{ bd }}

/lib/systemd/system/bitcoind.service:
  file:
    - managed
    - source: salt://bitcoind/files/bitcoind.service
    - template: jinja
    - context:
      bd: {{ bd }}

rpccrt:
  file:
    - managed
    - name: {{ bd.rpcsslcertificatechainfile }}
    - template: jinja
    - contents_pillar: bitcoind:crt
    - mode: 0640
    - dir_mode: 0700
    - group: bitcoind
    - user: root

rpckey:
  file:
    - managed
    - name: {{ bd.rpcsslprivatekeyfile }}
    - template: jinja
    - contents_pillar: bitcoind:key
    - mode: 0640
    - dir_mode: 0750
    - group: bitcoind
    - user: root

minissdpd.service:
  service:
    - dead
    - enable: False
    - sig: '/usr/sbin/minissdpd'
