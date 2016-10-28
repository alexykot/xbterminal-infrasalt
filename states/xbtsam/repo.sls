{% from "xbtsam/map.jinja" import xbtsam with context %}

{% set reponame = 'deb http://repo.saltstack.com/apt/' +
salt['grains.get']('os')|lower + '/' + salt['grains.get']('osmajorrelease', osrelease) + '/amd64/{{ xbtsam.series }} ' + salt['grains.get']('oscodename') + ' main' %}
saltstack-pkgrepo:
  pkgrepo.managed:
    - humanname: SaltStack Debian Repo
    - name: {{ reponame }}
    - file: /etc/apt/sources.list.d/saltstack.list
    - key_url: https://repo.saltstack.com/apt/' + salt['grains.get']('os')|lower + '/' + salt['grains.get']('osmajorrelease', osrelease) + '/amd64/latest/SALTSTACK-GPG-KEY.pub
    - clean_file: True
    - order: 1
