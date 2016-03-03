#
# == Class: tftp_server::service
#
class tftp_server::service inherits tftp_server::params {
  
  service { 'tftp_server':
    ensure => running,
    enable => true,
    name   => $::tftp_server::params::service_name,
  }
}
