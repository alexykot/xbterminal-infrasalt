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


CIS-8.1.2|CIS-8.1.1.3:
  pkg.installed:
    - name: auditd
  file:
    - managed
    - name: /etc/audit/auditd.conf
    - source: salt://xbtsafety/files/auditd.conf
    - mode: 0640
  service.running:
    - name: auditd
    - enable: true
  watch:
    - file: /etc/audit/auditd.conf
    - pkg: auditd

CIS-10.1.1|CIS-10.1.2:
  file.managed:
    - name: /etc/login.defs
    - source: salt://xbtsafety/files/login.defs


CIS 9.2.1|CIS 9.2.3:
  file.managed:
    - name: /etc/pam.d/common-password
    - source: salt://xbtsafety/files/pam.d-common-password
  pkg.installed:
    - pkgs:
      - libpam-pwquality
      - libpam-cracklib

CIS-10.4:
  file:
    - managed
    - name: /etc/bash.bashrc
    - source: salt://xbtsafety/files/bash.bashrc

CIS-10.4-profile:
  file:
    - managed
    - name: /etc/profile.d/cis-10.4.sh
    - source: salt://xbtsafety/files/profile-cis-10.4.sh


CIS-12.5:
  file:
    - name: /etc/shadow
    - managed
    - mode: 0640
    - user: root
    - group: root

{% for cron in
[
'/etc/cron.hourly',
'/etc/cron.weekly',
'/etc/cron.daily',
'/etc/cron.monthly',
'/etc/cron.d'
]
%}

CIS-9.1.3|CIS-9.1.4|CIS-9.1.5|CIS-9.1.6|CIS-9.1.7|-{{ cron }}:
  file:
    - directory
    - name: {{ cron }}
    - user: root
    - group: root
    - mode: 0700

{% endfor %}

CIS-4.1:
  file:
    - append
    - name: /etc/security/limits.conf
    - text: "*               soft    core            0"
