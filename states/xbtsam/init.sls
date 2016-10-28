{% from "xbtsam/map.jinja" import xbtsam with context %}


include:
  - xbtsam.repos

salt-master:
  pkg:
    - installed
    - version: {{ xbtsam.version }}
    - require:
      - pkgrepo: saltstack-pkgrepo
