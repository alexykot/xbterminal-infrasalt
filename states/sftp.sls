itl:
 user:
   - present
   - uid: 5004
   - gid: 5004
   - gid_from_name: Trueks
   - home: /var/blobs/itl
   - shell: /bin/bash
   - require_in:
     - ssh_auth: itl-key
     - file: /var/blobs
     - file: /var/blobs/itl
     - file: /var/blobs/itl/interface

itl-key:
  ssh_auth:
    - present
    - user: itl
    - enc: ssh-rsa
    - comment: itl@xbt
    - name: 'AAAAB3NzaC1yc2EAAAADAQABAAACAQDgsmT6nw5Ype7yFr75PR5PQyEdTmizm69U7N0XUERxRTVD3VN7nLM8WGP/NuCYTHMlbn4Gj93UReMe4aMWwrYCl8+vt960rLhE1uEqfCKEbIQLRVWjrAmfIHTr9CuGJQqUEp+EZMLMRzyV4NmfLgdSTmKrSkUhzytGtgo0fAKRbalOiuZvo/Aaj8kLwmguSSQZed3Dvm70NiM0jS79ptqgeaITLZoX3o37jThz5DfyERmmEBsMiZ4O1zH7g1afEwI+rMWU4nJIMOhvSW+iWwnGGYLUoH9PaHuZbbCX2FcOmxF+kLS7QXGiy/dIuDSmKpFWlCYAcjOCThgiVbg66NzGGgs/mx+FxC/Mcfr/57k5L+Lxb2KT0TdgDk36Igmyz1YnsPo9ynl6aVkABJbQeeX8IEgZpYYRnUo05xTdVQHCckTqnNBzepVdmSSP0kOeuD7J3kaFlMgUCxBlfVn4Gi8TLup+EUDNN9QNGrc1i9xdno5fv63RZ5UHDF8/KMG1XTdMIfqC2gDRv8N+PgDNEGEYcibtINnF/VdIQ+8TO1OInhCBfmJjdjKcycoFseWwpIz/RtK1fHsgbXMJAVXXd1sfICS1hu5JRPhswyfoRCBXiwafRf0Bf5o9+IHgEFxapOCv1PcjRQHiNPHciqaGY6SrZhvovtEiS/41CmTh0sf9Hw== itl@world'



/var/blobs:
  file:
    - directory
    - mode: 0755
    - user: root
    - group: root
    - makedirs: True



/var/blobs/itl:
  file:
    - directory
    - mode: 0750
    - user: root
    - group: itl
    - makedirs: True

/var/blobs/itl/interface:
  file:
    - directory
    - mode: 0755
    - user: itl
    - group: itl
    - makedirs: True

/var/blobs/itl/itl:
 file:
   - directory
   - mode: 0755
   - user: itl
   - group: itl
   - makedirs: True

