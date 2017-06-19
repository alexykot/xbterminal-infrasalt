debian-release:
  pkg:
    - installed
    - refresh: True
    - name: base-files
    - version: 8+deb8u8
    - order: 1

core:
  pkg:
    - installed
    - refresh: True
    - order: 2
    - require: [ pkg: debian-release ]
    - pkgs:
      - sudo: '1.8.10p3-1+deb8u3'
      - vim:  '2:7.4.488-7+deb8u3'
      - rsync
      - screen
      - git: '1:2.1.4-2.1+deb8u3'
      - git-core: '1:2.1.4-2.1+deb8u3'
      - git-man: '1:2.1.4-2.1+deb8u3'
      - curl: '7.38.0-4+deb8u5'
      - man
      - mosh
      - htop
      - aptitude
      - ifstat
      - atop
      - strace
      - xfsprogs
      - dstat
