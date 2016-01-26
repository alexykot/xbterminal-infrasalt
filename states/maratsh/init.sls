maratsh:
  user.present:
    - fullname: Marat Shakirov
    - home: /home/maratsh
    - shell: /bin/bash
    - password: '$6$YcgQVJbx$gSOYZHgml9sPUSOBZZinGptD4PhUEM5cbhOz3VgLEtxkEVRnK8wjbQjuy/T3B.VgPGtCc6rLWlqTM.vKQV7ab1'
    - require_in:
      - ssh_auth: maratsh-key

maratsh-key:
  ssh_auth:
    - present
    - user: maratsh
    - enc: ssh-rsa
    - comment: maratsh@10tracks.ru
    - name: ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAAD9QDCPFxHDiZrrzpxnqep9aaz4stq9UKJ3aTT5iXyxWuOSV2JX+4AI8ciqzho1xXv99FBXbU4N5Msk33MqIi85UcG5HXWd0BVo4yDoE40Y2U2+Eh1gbjSOju197VG3FsmNdr3qVzKPendwHT4aIwd6MX2KfZMLBFfrDFCinmQ1jBCp3IJ9vUXV2cddleyLtzW3Ir8OOY4ajkZxQgzf/8EBT4Hx2yMKYZQGWz1nTHh84puqsbhqEn9UwcyDmH4z9gSB8UbAU3cv5CXQW6m9bmHJUOcFc02zeUuqfT6ByEYYjWrSGOlomN2R+dDRLK1JwJ9jHjQhstOBrSU+CnGoVnwowL1CuxdZMPS+qrBcSj5ufepI3J03ViPEYz913HOboxuAJTgLBp9B/VX2qZUSOM9Uhu3y3QDFgSRYvYfE2pAABqbpS7hBzFgSrklJzQA4fx+YALWS7LEyS5gRY7zB8J6i9+QIYC8AZ5l7xYqirKQV582veMANMHSQm6OsKvudp5Vq7JylxbGJArnrZUKHBi8QffnS3h+TISgbrnKrpM4vqECWOjJvl2brdvN8sEC3eXqj1degQqdGlZLiVS8ejZsIl+0Q6aFGSZrcbhI0e3dc3O4zKNY7Q4ncb5sqoj1+BmQqtcUYOFwbNxeq9mTSAdgRq4Gkt358fi0CLKw4R9aLWjmJl/LtqOXXmxHrNjpJdUNxTxDrqlpTSiG66pUv5512IrRaUKt1BgRu4qsTNGAAXY/erL12eHFvUbuUKwTe6MXbtIcCqw9id1NEgD3ptc2TS0fvSOmL7CdZ5Ms2+IsLUCPFfYOwlr2J4gk8Z6mkK17DHEVZZ9HNOIZhyR51lOmkGhGyhuqDQf5mcmAZEB8yk6a/MqkbljqiSFMSFTd3JAQmLil+TRD9Aok1U6ccVbyNOTZ4RE6OZ8ZNwI9iLGFex1zvAVm5xHNy7MuIMUbJm0KYLr03ltZpwAKSToaCMjUPu6o+WlcfGPFrRMyDsh6I+Xq7uSbMFCoxPvexgp8ewd/29HZjKyIL5WImXcvJ0Nbklx11G8ZuMK+7Abq3lcN6elXaswMQgY1J2mrH0rSGoJ1/+U/8HYkf0SxYGKhEsFIQtzfYP3+KLDnCKzn6kqGoBjUQ68e/F70RyvJ3Mmj5L7z9DOhP0sFCKYLe75q0fh7SUxO2uIfHsPWCq6ktIneH9mKzD4SyJQFEI8Wc5rMHUAGre2oz3Y0TFrdjzyMRWmv+IyOtu4FJe30cwpgxrgrVWdslQZXnepV6tTA211IiZHAxZfi4bwFuQ57Hs8RsZIzn7JSlCngrxkuzApXxpJy2QiY0y7GoFjidX/hV6Om+cRrCeEJuax/ maratsh@Blackmesa

maratsh-sudoers:
  file.append:
    - name: /etc/sudoers
    - text: 'maratsh ALL=(ALL)	NOPASSWD:ALL'
