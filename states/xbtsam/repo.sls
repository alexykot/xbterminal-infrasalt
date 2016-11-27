{% from "xbtsam/map.jinja" import xbtsam with context %}

{% set reponame = 'deb http://repo.saltstack.com/apt/debian/8/amd64/' ~ xbtsam.release  ~ ' jessie main' %}

saltstack-pkgrepo:
  pkgrepo.managed:
    - humanname: SaltStack Debian Repo
    - name: {{ reponame }}
    - file: /etc/apt/sources.list.d/saltstack.list
    - key_url: 'https://repo.saltstack.com/apt/debian/8/amd64/latest/SALTSTACK-GPG-KEY.pub'
    - clean_file: True
    - order: 1
