postfix:
  config:
    relay:
      host: 'email-smtp.eu-west-1.amazonaws.com'
      port: 587
      user: 'AA'
      password: 'AmvP'


xbt:
  app:
    version: '1.2016.06.29-b1'
    infrastructure-certs:
      xbt_payment_protocol_key: |
        -----BEGIN PRIVATE KEY-----
        -----END PRIVATE KEY-----

      xbt_payment_protocol_crt: |
        -----BEGIN CERTIFICATE-----
        -----END CERTIFICATE-----
      ca: |
        -----BEGIN CERTIFICATE-----
        -----END CERTIFICATE-----
      crt: |
        -----BEGIN CERTIFICATE-----
        -----END CERTIFICATE-----
      key: |
        -----BEGIN PRIVATE KEY-----
        -----END PRIVATE KEY-----



    config:
      ALLOWED_HOSTS:
        - '*'

      RAVEN_CONFIG:
        dsn: 'http://d68:d10f7ede908f@sentry.xbthq.int/7'

      AWS_STORAGE_BUCKET_NAME: 'xbt-storage-prod'
      AWS_ACCESS_KEY_ID: ''
      AWS_SECRET_ACCESS_KEY: ''

      RECAPTCHA_PRIVATE_KEY: ''
      RECAPTCHA_PUBLIC_KEY: ''
      STATIC_URL: 'https://xbt-webstatic-prod.s3-eu-west-1.amazonaws.com/'

      EMAIL_HOST: 127.0.0.1
      EMAIL_PORT: 25
      EMAIL_HOST_USER: ''
      EMAIL_HOST_PASSWORD: ''
      EMAIL_USE_TLS: False
      EMAIL_USE_SSL: False
      DEFAULT_FROM_EMAIL: no-reply@xbterminal.io

      SESSION_COOKIE_SECURE: True
      CSRF_COOKIE_SECURE: True

      PKI_KEY_FILE: 'bip70/xbterminal_io.key'
      PKI_CERTIFICATES:
        - 'bip70/xbterminal_io.pem'
        - 'bip70/COMODORSADomainValidationSecureServerCA.pem'
        - 'bip70/COMODORSAAddTrustCA.pem'
        - 'bip70/AddTrustExternalCARoot.pem'

      DATABASES:
        default:
          ENGINE: 'django.db.backends.postgresql_psycopg2'
          NAME: 'xbterminal'
          USER: 'xbterminal'
          PASSWORD: 'n3'
          HOST: 'xbt-rds-.eu-west-1.rds.amazonaws.com'
          PORT: 5432

      BITCOIND_SERVERS:
        mainnet:
          HOST: node.xbterminal.io
          USER: xbterminal
          PASSWORD: 'WB'
          USE_SSL: False
        testnet:
          HOST: node.xbterminal.io
          USER: user
          PASSWORD: password

      SALT_SERVERS:
        default:
          HOST: https://sam.xbthq.co.uk/
          USER: salt-xbt-prod
          PASSWORD: 9d
          CLIENT_CERT: client/server.crt
          CLIENT_KEY: client/server.key
          CA_CERT: xbthq.crt

      APTLY_SERVERS:
        default:
          HOST: https://repo.xbthq.co.uk/
          CLIENT_CERT: client/server.crt
          CLIENT_KEY: client/server.key
          CA_CERT: xbthq.crt

      CACHES:
         default:
           BACKEND: 'django_redis.cache.RedisCache'
           LOCATION: 'redis://127.0.0.1:6379/0'
           OPTIONS:
             CLIENT_CLASS: 'django_redis.client.DefaultClient'

      RQ_QUEUES:
        low:
          URL: 'redis://172.90.205.31:6379/1'
        high:
          URL: 'redis://172.90.205.31:6379/1'

      TIME_ZONE: 'Europe/London'


systemd:
  tasks:
    - name: xbterminal-rqworker-high
      unit:
        - Description = xbterminal-rqworker-high
      service:
        - ExecStart=/var/www/xbterminal.com/venv/bin/python /var/www/xbterminal.com/xbterminal/manage.py rqworker high
        - Restart=no
        - LimitNOFILE=8192
        - User=xbt-app
      install:
        - WantedBy=multi-user.target


    - name: xbterminal-rqworker-low
      unit:
        - Description = xbterminal-rqworker-low
      service:
        - ExecStart=/var/www/xbterminal.com/venv/bin/python /var/www/xbterminal.com/xbterminal/manage.py rqworker low
        - Restart=no
        - LimitNOFILE=8192
        - User=xbt-app
      install:
        - WantedBy=multi-user.target


    - name: xbterminal-rqscheduler
      unit:
        - Description = xbterminal-rqscheduler
      service:
        - ExecStart=/var/www/xbterminal.com/venv/bin/python /var/www/xbterminal.com/xbterminal/manage.py rqscheduler --queue high --interval=1
        - Restart=no
        - LimitNOFILE=8192
        - User=xbt-app
      install:
        - WantedBy=multi-user.target

    - name: xbterminal-cryptopay_sync
      unit:
        - Description = xbterminal-cryptopay_sync
      service:
        - ExecStart=/var/www/xbterminal.com/venv/bin/python /var/www/xbterminal.com/xbterminal/manage.py cryptopay_sync
        - Restart=no
        - LimitNOFILE=8192
        - User=xbt-app
      install: []
      timer:
        - OnUnitInactiveSec=30m

    -  name: xbterminal-send_reconciliation
       unit:
         - Description = xbterminal-send_reconciliation
       service:
         - ExecStart=/var/www/xbterminal.com/venv/bin/python /var/www/xbterminal.com/xbterminal/manage.py send_reconciliation
         - Restart=no
         - LimitNOFILE=8192
         - User=xbt-app
       install: []
       timer:
         - OnUnitInactiveSec=5m

    -  name: xbterminal-check_wallet
       unit:
         - Description = xbterminal-check_wallet
       service:
         - ExecStart=/var/www/xbterminal.com/venv/bin/python /var/www/xbterminal.com/xbterminal/manage.py check_wallet
         - Restart=no
         - LimitNOFILE=8192
         - User=xbt-app
       install: []
       timer:
         - OnUnitInactiveSec=30m
