{% import_yaml "xbtsafety/sysctl.yml" as sysctl with context %}


/etc/sysctl.d/20-CIS.conf:
  file:
    - managed
    - user: root
    - group: root
    - mode: 0600
    - contents:
{% for comment, setting  in sysctl.sysctl.iteritems() %}
      - ""
      - '#{{ comment }}'
      - {{ setting }}
{% endfor %}

sysctl -p /etc/sysctl.d/20-CIS.conf:
  cmd:
    - wait
    - watch:
      - file: /etc/sysctl.d/20-CIS.conf
