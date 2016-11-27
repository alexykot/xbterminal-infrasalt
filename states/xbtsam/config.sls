{% from "xbtsam/map.jinja" import xbtsam with context %}

/etc/salt/master.d/config.conf:
  file:
    - serialize
    - source: salt://xbtsam/files/config.conf
    - template: jinja
    - mode: 0600
    - user: root
    - group: root
    - dataset: {{ xbtsam.config }}
    - formatter: yaml
    - makedirs: True
