#
# == Class: tftp_server::install
#
# Install tftp_server.
#
class tftp_server::install inherits tftp_server::params {

  package { $::tftp_server::params::package_name:
    ensure => installed,
  }

  package { $::tftp_server::params::pxelinux_package_name:
    ensure => installed,
  }
  
}
