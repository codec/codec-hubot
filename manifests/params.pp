class hubot::params {
  if $::lsbdistcodename == 'Precise' {
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
    fail("${::lsbdistcodename} is not supported :(")
  }
}