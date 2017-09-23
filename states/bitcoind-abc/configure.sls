{% from "bitcoind-abc/map.jinja" import bitcoind_abc  with context %}
{% set bd = bitcoind_abc %}


/var/bitcoind/shaper.sh:
  file:
    - managed
    - source: salt://bitcoind-abc/files/shaper.sh


/etc/bitcoin/bitcoind.conf:
  file:
    - managed
    - source: salt://bitcoind-abc/files/bitcoind.conf
    - template: jinja
    - mode: 0640
    - dir_mode: 0750
    - group: bitcoind
    - user: root
    - makedirs: True
    - context:
      config: {{ bd.config }}

/lib/systemd/system/bitcoind.service:
  file:
    - managed
    - source: salt://bitcoind-abc/files/bitcoind.service
    - template: jinja
    - context:
      bd: {{ bd }}

bitcoind-service:
  cmd:
    - wait
    - name: systemctl daemon-reload
    - watch:
      - file: /lib/systemd/system/bitcoind.service


minissdpd.service:
  service:
    - dead
    - enable: False
    - sig: '/usr/sbin/minissdpd'
