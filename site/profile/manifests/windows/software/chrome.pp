# Installs Chrome using Chocolatey
#
# NOTE: There is a bug in the Chocolatey module that p;roduces -version instead of --version
#
# @author Dan
class profile::windows::software::chrome (
  $version = '56.0.2924.76'
)
{

  package { 'googlechrome':
    #ensure          => $version,
    install_options => ["--version",$version,'--ignore-checksums'],
    provider        => 'chocolatey',
  }
}
