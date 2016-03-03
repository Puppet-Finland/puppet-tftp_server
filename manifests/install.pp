#
# == Class: tftp_server::install
#
# Install tftp_server.
#
class tftp_server::install inherits tftp_server::params {

  package { $::tftp_server::params::package_name:
    ensure => installed,
  }
  
}
