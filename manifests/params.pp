#
# == Class: tftp_server::params
#
# Defines some variables based on the operating system
#
class tftp_server::params {
  
  case $::osfamily {
    'Debian': {
      $package_name = 'tftpd-hpa'
      $service_name = 'tftpd-hpa'
    }
    default: {
      fail("Unsupported OS: ${::osfamily}")
    }
  }
}
