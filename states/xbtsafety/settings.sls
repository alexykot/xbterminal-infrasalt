CIS-2.16|CIS-2.14|CIS-2.15:
  mount.mounted:
    - name: /dev/shm
    - device: tmpfs
    - fstype: tmpfs
    - opts: rw,nosuid,nodev,noexec,nosuid
    - dump: 0
    - pass_num: 0
    - persist: True
    - mkmnt: True


CIS-8.1.2:
  pkg.installed:
    - name: auditd
  service.running:
    - name: auditd
    - enable: true
