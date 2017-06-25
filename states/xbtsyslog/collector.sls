{% from "xbtsyslog/map.jinja" import xbtsyslog with context %}

rsyslog:
  service:
    - running
    - watch:
      -  pkg : 'rsyslog'
      - file: /etc/rsyslog.d/*
  pkg:
     - installed
     - version: '8.4.2-1+deb8u2'
  file:
    - managed
    - name: /etc/rsyslog.d/xbt.conf
    - source: salt://xbtsyslog/files/xbt-rsyslog-collector.conf
    - template: jinja
    - context:
      syslog: {{ xbtsyslog.collector }}
