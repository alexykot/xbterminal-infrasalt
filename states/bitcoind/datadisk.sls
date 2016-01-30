{% set blk = '/dev/xvdh' %}
{% set dir = '/var/bitcoind' %}

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
    - opts:  noatime,nodiratime,nobarrier,logbufs=8
    - persist: True
    - mount: True
    - mkmnt: True
    - check_cmd:
      - grep {{ blk  }} /etc/mtab
    - require:
      - blockdev: datadisk

directory-datadisk:
  file:
    - directory
    - name: {{ dir }}
    - user: bitcoind
    - group: bitcoind
    - dir_mode:  750
    - file_mode: 644
    - recurse:
      - user
      - group
      - mode
