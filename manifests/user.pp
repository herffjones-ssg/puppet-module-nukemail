# == Class: nukemail::user
#
# Nuke user's mailspool once a day.
#
# == Usage:
#
# nukemail::user { 'root':
#   hour   => '1',
#   minute => '15',
# }
#
define nukemail::user(
  $hour   = '12',
  $minute = '0',
) {

  cron { "nuke_mail_spool_${name}":
    ensure   => present,
    command  => "/bin/rm -f /var/spool/mail/${name}",
    user     => $name,
    hour     => $hour,
    minute   => $minute,
  }
}
