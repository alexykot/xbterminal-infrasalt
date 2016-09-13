/var/repo/public/mirrors:
  file:
    - directory
    - mode: 0755
    - user: repo
    - group: repo

linux_imx_repo:
  git.latest:
    - name: git://git.freescale.com/imx/linux-2.6-imx.git
    - target: /var/repo/public/mirrors/linux-2.6-imx.git
    - bare: true
    - user: repo
    - require:
      - file: /var/repo/public/mirrors
