class hubot (
  $ensure='present',
) {
  anchor { 'hubot::begin': }

  class { 'hubot::packages':
    ensure  => $ensure,
    notify  => Class['hubot::service']
  }

  class { 'hubot::config':
    require => Class['hubot::packages'],
    notify  => Class['hubot::service']
  }

  class { 'hubot::service':
    ensure  => $ensure ? {
      'absent'  => 'stopped',
       default  => 'running'
    }
  }

  anchor { 'hubot::end':
    require => Class['hubot::service']
  }
}