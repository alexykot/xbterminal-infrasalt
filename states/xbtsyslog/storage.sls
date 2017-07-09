{% from "xbtsyslog/map.jinja" import xbtsyslog with context %}

storage:
  blockdev:
    - formatted
    - fs_type: xfs
    - name: {{ xbtsyslog.blockdev }}

mount-storage:
  mount.mounted:
    - name: {{ xbtsyslog.dir }}
    - device: {{ xbtsyslog.blockdev }}
    - fstype: xfs
    - opts:  noatime,nodiratime,nobarrier,logbufs=8
    - persist: True
    - mount: True
    - mkmnt: True
    - check_cmd:
      - grep {{ xbtsyslog.blockdev }} /etc/mtab
    - require:
      - blockdev: storage

directory-storage:
  file:
    - directory
    - name: {{ xbtsyslog.dir }}
    - user: root
    - group: root
    - dir_mode:  0750
    - file_mode: 0644
    - require:
      - mount: mount-storage
    - recurse:
      - user
      - group
      - mode
