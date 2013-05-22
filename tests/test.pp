Exec {
  path => '/usr/bin:/bin:/usr/sbin:/sbin'
}
exec {'apt-get update': } -> Package<||>

Class['java7'] -> Class['vertx']
include java7
include vertx

file { '/tmp/Server.java':
  ensure => file,
  source => "puppet:///modules/vertx/Server.java",
} ->

vertx::verticle { "vserver":
  run       => "Server.java",
  classpath => ["/tmp", "/usr/local/lib/vertx-1.3.1.final/lib/*"],
}

file { '/tmp/Worker.java':
  ensure => file,
  source => "puppet:///modules/vertx/Worker.java",
} ->

vertx::verticle { "vworker":
  run       => "Worker.java",
  classpath => ["/tmp", "/usr/local/lib/vertx-1.3.1.final/lib/*"],
}

