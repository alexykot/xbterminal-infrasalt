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

/etc/logrotate.d/xbt:
  file:
    - managed
    - source: salt://xbtsyslog/files/logrotate.conf
    - mode: 0600 
    - user: root
    - group: root
 
{% for file in [ 'crt', 'key' ] %}
/etc/syslog-ng/key.d/{{ file }}.pem:
  file:
    - managed
    - makedirs: True
    - mode: 0600
    - user: root
    - group: root
    - show_changes: False
    - contents_pillar: xbtsyslog:tls:{{ file }}

{% endfor %}
