#  Profile wrapper for installing an Octopus Deploy tentacle
#
#
class profile::octopus::tentacle {

  class { 'octopus':
    server_url  => 'http://octopus-server.net',
    ensure      => 'present'
  }

}

