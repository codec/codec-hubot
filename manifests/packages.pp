class hubot::packages ($ensure='present') inherits hubot::params {
  class { 'nodejs': }

  package { $build_packages:
    ensure  => $ensure
  }

  package { $npm_packages:
    ensure    => $ensure,
    provider  => 'npm',
    require   => [
      Class['nodejs'],
      Package[$build_packages]
    ],
    notify    => Package[$packages]
  }

  package { $packages:
    ensure    => $ensure,
    provider  => 'npm',
    require   => Package[$npm_packages]
  }

  package { 'redis-server':
    ensure  => present,
    notify  => Service['redis-server']
  }
}