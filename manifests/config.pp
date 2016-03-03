#
# == Class: tftp_server::config
#
class tftp_server::config (

  $server_args,
  $user,
  $group,

) inherits tftp_server::params {
  
  # convention: modulename-filename
  file { 'tftp_server_tftp':
    ensure  => present,
    name    => $::tftp_server::params::config_name,
    content => template('tftp_server/tftp.erb'),
    owner   => $::tftp_server::params::user,
    group   => $::tftp_server::params::group,
    mode    => '0660',
  }
  
  group { 'tftp_server-group':
    ensure => present,
    name   => $::tftp_server::params::group,
  }
  
  user { 'tftp_server-user':
    ensure  => present,
    name    => $::tftp_server::params::user,
    gid     => $::tftp_server::params::group,
    shell   =>  '/bin/false',
    home    => $::tftp_server::params::root_dir,
    require => Group['tftp_server-group'],
  }
  
  # convention: modulename-filename
  file { 'tftp_server-root':
    ensure => directory,
    name   => $::tftp_server::params::root_dir,
    owner  => $::tftp_server::params::user,
    group  => $::tftp_server::params::group,
    mode   => '0660',
  }
}


