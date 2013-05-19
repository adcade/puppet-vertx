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

vertx::verticle { "adserver":
  run     => "Server.java",
  jarfile => "/tmp",
}
