{% set db = pillar['database'] %}

{% set blk = db.datadisk.dev %}
{% set dir = db.datadisk.dir %}

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
    - user: postgres
    - group: postgres
    - dir_mode:  0700
    - file_mode: 0600
    - recurse:
      - user
      - group
      - mode
