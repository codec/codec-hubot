class hubot::config inherits hubot::params {
  file { $basedir:
    ensure  => directory
  }
}