<?php
// Zabbix GUI configuration file.
global $DB;

$DB['TYPE']     = 'POSTGRESQL';
$DB['SERVER']   = '{{ db.host }}';
$DB['PORT']     = '{{ db.port }}';
$DB['DATABASE'] = '{{ db.name }}';
$DB['USER']     = '{{ db.user }}';
$DB['PASSWORD'] = '{{ db.password }}';

// Schema name. Used for IBM DB2 and PostgreSQL.
$DB['SCHEMA'] = 'public';

$ZBX_SERVER      = '127.0.0.1';
$ZBX_SERVER_PORT = '10051';
$ZBX_SERVER_NAME = '{{ zbx.server.name }}';

$IMAGE_FORMAT_DEFAULT = IMAGE_FORMAT_PNG;
?>

