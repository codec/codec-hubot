class hubot::service ($ensure='running') {
  service { 'redis-server':
    ensure  => $ensure
  }

  Service <| tag == 'hubot' |> {
    ensure  => $ensure
  }
}