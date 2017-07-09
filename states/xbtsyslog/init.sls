{% from "xbtsyslog/map.jinja" import xbtsyslog with context %}

include:
  - xbtsyslog.storage
  - xbtsyslog.repo

syslog-ng-package:
  pkg:
    - installed
    - version: '3.10.1-1'
    - name: syslog-ng
    - require:
      - pkgrepo: syslog-ng-repo


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

/etc/syslog-ng/conf.d/infra.conf:
  file:
    - managed
    - source: salt://xbtsyslog/files/infra.conf
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
    - template: jinja
      context:
        xbtsyslog: {{ xbtsyslog }}

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
