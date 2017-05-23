# Installs Microsoft Build Tools 2015
#
# @author Dan
class profile::windows::software::buildtools2015 (
  $version = '14.0.25420.1'
)
{

  package { 'microsoft-build-tools':
    #ensure          => $version,
    install_options => ["--version",$version,'--ignore-checksums'],
    provider        => 'chocolatey',
  }
}
