unrelated-packeges:
  pkg:
    - removed
    - pkgs:
      - exim4-base
      - exim4-config

kernel:
  pkg:
    - installed
    - refresh: True
    - pkgs:
      - linux-image-3.16.0-4-amd64: '3.16.43-2+deb8u5'
      - linux-headers-3.16.0-4-common: '3.16.43-2+deb8u5'


safety_pkg:
  pkg:
    - installed
    - refresh: True
    - pkgs:
      - apt: '1.0.9.8.4'
      - apt-transport-https: '1.0.9.8.4'
      - apt-utils: '1.0.9.8.4'
      - libapt-pkg4.12: '1.0.9.8.4'
      - libapt-inst1.5: '1.0.9.8.4'
      - unattended-upgrades: '0.83.3.2+deb8u1'
      - dpkg: '1.17.27'

      - libperl5.20: '5.20.2-3+deb8u9'
      - perl: '5.20.2-3+deb8u9'
      - perl-base: '5.20.2-3+deb8u9'
      - perl-modules: '5.20.2-3+deb8u9'

      - libxslt1.1: '1.1.28-2+deb8u3'

      - fontconfig: '2.11.0-6.3+deb8u1'
      - libfontconfig1: '2.11.0-6.3+deb8u1'
      - fontconfig-config: '2.11.0-6.3+deb8u1'
      - libfreetype6: '2.5.2-3+deb8u2'

      - libgnutls-openssl27: '3.3.8-6+deb8u6'
      - libsasl2-2: '2.1.26.dfsg1-13+deb8u1'
      - libgnutls-deb0-28: '3.3.8-6+deb8u6'

      - libgd3: '2.1.0-5+deb8u9'
      - libtiff5: '4.0.3-12.3+deb8u4'
      - libk5crypto3: '1.12.1+dfsg-19+deb8u2'
      - libgcrypt20: '1.6.3-2+deb8u4'
      - passwd: '1:4.2-3+deb8u4'
      - libxml2: '2.9.1+dfsg1-5+deb8u4'
      - grub-pc: '2.02~beta2-22+deb8u1'
      - grub-common: '2.02~beta2-22+deb8u1'
      - grub-pc-bin: '2.02~beta2-22+deb8u1'
      - libldap-2.4-2: '2.4.40+dfsg-1+deb8u3'
      - libirs-export91: '1:9.9.5.dfsg-9+deb8u12'
      - libisc-export95: '1:9.9.5.dfsg-9+deb8u12'
      - libdns-export100: '1:9.9.5.dfsg-9+deb8u12'
      - libisccfg-export90: '1:9.9.5.dfsg-9+deb8u12'
      - libssh2-1: '1.4.3-4.1+deb8u1'
      - openssh-server: '1:6.7p1-5+deb8u3'
      - libtasn1-6: '4.2-3+deb8u3'
      - tar: '1.27.1-2+deb8u1'
      - multiarch-support: '2.19-18+deb8u9'
      - libexpat1: '2.1.0-6+deb8u4'
      - libfuse2: '2.9.3-15+deb8u2'
      - openssl: '1.0.1t-1+deb8u6'
      - libssl1.0.0: '1.0.1t-1+deb8u6'
      - libcurl3: '7.38.0-4+deb8u5'
      - gpgv: '1.4.18-7+deb8u3'
      - gnupg: '1.4.18-7+deb8u3'
      - libc6: '2.19-18+deb8u10'
      - libc-bin: '2.19-18+deb8u10'
      - libgssapi-krb5-2: '1.12.1+dfsg-19+deb8u2'
      - libkrb5-3: '1.12.1+dfsg-19+deb8u2'
      - libcurl3-gnutls: '7.38.0-4+deb8u5'
      - libicu52: '52.1-8+deb8u5'
      - locales: '2.19-18+deb8u10'
      - libpng12-0: '1.2.50-2+deb8u3'
      - cpio: '2.11+dfsg-4.1+deb8u1'
      - libisc-export95: '1:9.9.5.dfsg-9+deb8u12'
      - libidn11: '1.29-1+deb8u2'
      - login: '1:4.2-3+deb8u4'

      - mysql-common: '5.5.57-0+deb8u1'
      - libmysqlclient18: '5.5.57-0+deb8u1'


      - librtmp1: '2.4+20150115.gita107cef-1+deb8u1'

      - isc-dhcp-client: '4.3.1-6+deb8u2'
      - isc-dhcp-common: '4.3.1-6+deb8u2'

      - libnss3-tools: '2:3.26-1+debu8u2'
      - libffi6: '3.1-2+deb8u1'

      - multiarch-support: '2.19-18+deb8u10'
