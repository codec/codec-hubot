class hubot::params {
  if $::osfamily == 'Debian' {
    $basedir = '/srv/hubot'

    $build_packages = [
      'build-essential',
      'libssl-dev',
      'libexpat1-dev',
      'libicu-dev'
    ]

    $npm_packages = [
      'coffee-script',
      'node-stringprep'
    ]

    $packages = [
      'hubot',
      'hubot-xmpp',
      'node-gyp',
      'node-expat'
    ]
  } else {
    fail("${::osfamily}/${::operatingsystem}/${::lsbdistcodename} is not supported :(")
  }
}