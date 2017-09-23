{% from "bitcoind-abc/map.jinja" import bitcoind_abc  with context %}
{% set bd = bitcoind_abc %}


{% if bd.datadisk.blockdevice == True %}

{% set blk = bd.datadisk.dev %}
{% set dir = bd.datadisk.dir %}

datadisk:
  blockdev:
    - formatted
    - fs_type: xfs
    - name: {{ blk }}

mount-datadisk:
  mount.mounted:
    - name: {{ dir }}
    - device: {{ blk }}
    - fstype: xfs
    - opts: noatime,nodiratime,nobarrier,logbufs=8
    - persist: True
    - mount: True
    - mkmnt: True
    - check_cmd:
      - grep {{ blk  }} /etc/mtab
    - require:
      - blockdev: datadisk
{% endif %}