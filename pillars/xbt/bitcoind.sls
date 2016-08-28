#!yaml|gpg

bitcoind:
  net: mainnet
  datadisk:
    dir: /var/bitcoind/
    dev:  /dev/mapper/vgdata-lvbit #manually created
  datadir: /var/bitcoind/mainnet
  rpcuser: xbterminal
  rpcpassword: |
    -----BEGIN PGP MESSAGE-----
    Version: GnuPG v2

    hQEMA/XI2iCydQqJAQf8DJd0TLYItmDO6DsO6L0R5Bb++Iad7LDNgJCzPMveqmyV
    1FJeiiynyriKqp+hVuitrOYzUSocRD+uOtanISDBTQZmGN1crCJtnZVgF9X4wy3m
    HfxuvRuTyEUUMAgbevay141YFmO/1xYQqf7iCMwbQWnro3bk/sQTQEtKBSYo3tUy
    hDvggjaryEVxbQr7AYN+fKvNrIhbnxHwYEXDQtTqP3WbR+Pu6fV76vdANC98r+V7
    yk4zMoxoy9xH5OnRifO5Lpx2Hw66wR41BdTjHDjLJ9Dvu9xW6cngflrn9HJj7/0V
    o8T2QcXg+XOSYSQJQe7a6GKQ1NAc59qYgOLagAz/ctJrAXcQTDWedXK/yI4CsA6e
    GaqXkPBoINhvCTa73ZY9cgMDli/FyH9ddOketf/8DwC+CZSopX70hW9vYzooQPwW
    X0/PD3qXrfOKVI0YsBak3QnRJvYByOzNu/kDlPYlStjqVZuSIrRyuUGvd5o=
    =v5S8
    -----END PGP MESSAGE-----

  rpcallowip: [ 172.90.0.0/16, 188.226.182.85/32 ]
  rpcthreads: 10
  txindex: 1
  logips: 1
