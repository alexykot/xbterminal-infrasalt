include:
  - zabbix.repo

zabbix-agent:
  pkg:
    - installed
    - refresh: True
    - require:
      - pkg: zabbix-release
  service:
    - running
    - name: zabbix-agent
    - enable: True
    - watch:
      - file: /etc/zabbix/zabbix_agentd.conf


/etc/zabbix/zabbix_agentd.conf:
  file.managed:
    - source: salt://zabbix/agent/files/zabbix_agentd.conf
    - user: root
    - group: root
    - mode: 644
    - backup: True
    - template: jinja
    - require:
      - pkg: zabbix-agent
    - context:
      za:
        servers_passive: 'mon.i.xbthq.co.uk'
        server_active: 'mon.i.xbthq.co.uk'
        metadata: '88e80d4c57e9307afdde3e56249cf1f2'
