Exec {
  path => '/usr/bin:/bin:/usr/sbin:/sbin'
}
exec {'apt-get update': } -> Package<||>

include vertx

file { '/tmp/Server.java':
  ensure => file,
  source => "puppet:///modules/vertx/Server.java",
} ->

vertx::verticle { "adserver":
  run     => "Server.java",
  jarfile => "/tmp",
}
