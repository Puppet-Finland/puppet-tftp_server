#
# == Class: tftp_server
#
class tftp_server
(

  $root_dir = '/var/lib/tftpboot',
  $server_args = '-c -p -u tftpd -U 117 -s /var/lib/tftpboot -vvv',
  $user = 'tftpd',
  $group = 'tftpd',
  
) inherits tftp_server::params
{
    
  include os
  include stdlib
  
  anchor { 'tftp_server::begin':
    notify => Class['tftp_server::service'],
  }
  
  class { 'tftp_server::install':
    require => Anchor['tftp_server::begin'],
    notify  => Class['tftp_server::config'],
  }
  
  class { 'tftp_server::config':
    server_args => $server_args,
    user        => $user,
    group       => $group,
    require     => Class['tftp_server::install'],
    notify      => Class['tftp_server::service'],
  }
  
  class { 'tftp_server::service':
    notify => Anchor['tftp_server::end'],
  }
  anchor {'tftp_server::end':
  }
}

