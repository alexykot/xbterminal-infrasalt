{% from "xbtsam/map.jinja" import xbtsam with context %}

git_root:
  git.latest:
    - name: {{ xbtsam.file_root.git_uri }}
    - target: {{ xbtsam.file_root.path }}
    - user: root
{% if xbtsam.file_root.key != 'nokey' %}
    - identity: {{ xbtsam.file_root.key_path }}


git_key:
  file:
    - managed
    - name: {{ xbtsam.file_root.key_path }}
    - mode: 0600
    - user: root
    - group: root
    - makedirs: True
    - contents_pillar: xbtsam:file_root.key
{% endif %}
