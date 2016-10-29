{% from "xbtsyslog/map.jinja" import xbtsyslog with context %}

include:
  - xbtsyslog.storage

syslog-ng-package:
  pkg:
    - installed
    - version: '3.5.6-2'
    - name: syslog-ng


syslog-ng-service:
  service:
    - running
    - name: syslog-ng
    - watch:
      - file: /etc/syslog-ng/*
    - require:
      - pkg: syslog-ng-package
      - file: directory-storage

/etc/syslog-ng/syslog-ng.conf:
  file:
    - managed
    - source: salt://xbtsyslog/files/syslog-ng.conf
    - mode: 0600
    - user: root
    - group: root

/etc/syslog-ng/conf.d/terminals.conf:
  file:
    - managed
    - source: salt://xbtsyslog/files/terminals.conf
    - mode: 0600
    - user: root
    - group: root
    - template: jinja
    - context:
      xbtsyslog: {{ xbtsyslog }}