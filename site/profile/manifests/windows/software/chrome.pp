# Installs Chrome using Chocolatey
#
# @author Dan
class profile::windows::software::chrome (
  $version = '58.0.3029.110'
)
{

  package { 'googlechrome':
    ensure          => $version,
    provider        => 'chocolatey',
  }
}
