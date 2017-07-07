#
# == Class: tftp_server
#
class tftp_server inherits tftp_server::params
{
    
  include ::os
  include ::stdlib
  include ::tftp_server::install
  include ::tftp_server::service
}

