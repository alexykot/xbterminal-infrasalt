{% from "bitcoind-abc/map.jinja" import bitcoind_abc  with context %}
{% set bd = bitcoind_abc %}

bitcoind_abc_distro:
  archive:
    - extracted
    - source: https://download.bitcoinabc.org/{{ bd.version}}/linux/bitcoin-abc-{{ bd.version }}-x86_64-linux-gnu.tar.gz
    - source_hash: {{ bd.hash }}
    - keep: True
    - name: /opt/bitcoind/
    - if_missing: /opt/bitcoind/bitcoin-abc-{{ bd.version }}
    - archive_format: tar

{% for binary in  ['bitcoin-cli' , 'bitcoind', 'bitcoin-qt', 'bitcoin-tx', 'test_bitcoin' ] %}

/usr/local/sbin/{{ binary }}:
  file:
    - symlink
    - target: /opt/bitcoind/bitcoin-abc-{{ bd.version }}/bin/{{ binary }}

{% endfor %}
