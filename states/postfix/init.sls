{% from "postfix/map.jinja" import postfix with context %}

postfix:
  pkg:
    - installed
    - require:
      - pkg: cyrus
  service:
    - running
    - enable: True
    - watch:
      - file: /etc/postfix/main.cf
      - pkg: postfix

cyrus:
  pkg.installed:
    - pkgs:
      - libsasl2-modules

/etc/postfix/main.cf:
  file.managed:
     - source: salt://postfix/files/main.cf.template
     - template: jinja
     - mode: 0600
     - user: root
     - group: root
     - context:
       config: {{ postfix.config }}
