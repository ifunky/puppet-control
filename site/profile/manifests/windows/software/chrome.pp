# Installs Chrome using Chocolatey
#
# @author Dan
class profile::windows::software::chrome (
  $version = '56.0.2924.76'
)
{

  package { 'googlechrome':
    ensure          => $version,
    provider        => 'chocolatey',
  }
}
