{% from "xbtsam/map.jinja" import xbtsam with context %}


include:
  - xbtsam.repo
  - xbtsam.config
  - xbtsam.root
  - xbtsam.nginx

salt-additional-requiremets:
  pkg:
    - installed
    - pkgs:
      - python-pymongo
      - python-futures
    - require_in:
      - pkg: salt-master
      - pkg: salt-api

salt-master:
  service:
    - running
    - enable: True
    - watch:
      - file: /etc/salt/master.d/*
    - require:
      - pkg: salt-api
  pkg:
    - installed
    - version: {{ xbtsam.version }}
    - require:
      - pkgrepo: saltstack-pkgrepo

salt-api:
  service:
    - running
    - enable: True
    - watch:
      - file: /etc/salt/master.d/*
    - require:
      - pkg: salt-api
  pkg:
    - installed
    - version: {{ xbtsam.version }}
    - require:
      - pkgrepo: saltstack-pkgrepo
