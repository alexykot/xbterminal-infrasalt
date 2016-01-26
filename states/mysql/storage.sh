pvcreate /dev/xvdb
vgcreate vgdb /dev/xvdb
lvcreate -n lvmysql vgdb -l100%FREE
mkfs.xfs /dev/vgdb/lvmysql 
mkdir /var/lib/mysql/
mount /dev/vgdb/lvmysql /var/lib/mysql/
chown mysql:mysql -R /var/lib/mysql/
