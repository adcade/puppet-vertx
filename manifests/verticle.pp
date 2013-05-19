define vertx::verticle (
  $verticle_name = $title,
  $run,
  $jarfile = "/usr/local/lib/adcade/bin/adserver.jar",
  $user    = "vertx",
  $group   = "vertx",
  $logdir  = "/tmp/vertx",
  $XMS     = '256M',
  $XMX     = '1G',
  $XSS     = '2048K',
) {
  file { "/etc/${verticle_name}.conf":
    ensure  => file,
    content => template("${module_name}/vertx.conf.erb"),
    before  => Service[$verticle_name],
  }

  file { "/etc/init/${verticle_name}.conf":
    ensure  => file,
    content => template("${module_name}/vertx.init.erb"),
    before  => Service[$verticle_name],
  }

  user { $user:
    ensure => present,
    before => Service[$verticle_name],
  }

  group { $group:
    ensure => present,
    before => Service[$verticle_name],
  }

  file { $logdir:
    ensure => directory,
    owner  => $user,
    group  => $group,
    mode   => 666,
    before => Service[$verticle_name],
  }

  service { $verticle_name:
    ensure  => running,
  }
}
