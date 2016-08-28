chrony:
  config:
    package: chrony
    service: chrony
    config: /etc/chrony/chrony.conf
    config_src: salt://chrony/files/chrony_config
    ntpservers:  [
                 "0.amazon.pool.ntp.org ",
                 "1.amazon.pool.ntp.org ",
                 "2.amazon.pool.ntp.org ",
                 "3.amazon.pool.ntp.org "
                 ]
    options: iburst
    logdir: /var/log/chrony
    keyfile: /etc/chrony.keys
    driftfile: /var/lib/chrony/drift,
    otherparams: [
                 "rtcsync",
                 "makestep 10 3",
                 "stratumweight 0",
                 "bindcmdaddress 127.0.0.1",
                 "bindcmdaddress ::1",
                 "commandkey 1",
                 "generatecommandkey",
                 "noclientlog",
                 "logchange 0.5",
                 "lock_all"
                  ]
