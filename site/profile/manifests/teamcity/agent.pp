# Profile to install a TeamCity agent (Windows or Linux)
#
class profile::teamcity::agent (
  $server_url = undef,
) {

  class { 'teamcity::agent':
    server_url => $server_url
  }

}
