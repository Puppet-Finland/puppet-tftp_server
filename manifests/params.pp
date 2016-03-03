#
# == Class: tftp_server::params
#
# Defines some variables based on the operating system
#
class tftp_server::params {
  
  case $::osfamily {
    'RedHat': {
      $package_name = [ 'tftp-server' ]
      $service_name = 'xinetd'
      $config_name = '/etc/xinetd.d/tftp'
      $root_dir = '/var/lib/tftpboot'
      $user = 'tftpd'
      $group = 'tftpd'
    }
    default: {
      fail("Unsupported OS: ${::osfamily}")
    }
  }
}
