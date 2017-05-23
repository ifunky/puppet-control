# Installs Microsoft Build Tools 2013
#
# NOTE: We can't use Chocolatey because MSBuildTools 2013/2015 have the same package name - so we use the msi instead
#
# @author Dan
class profile::windows::software::buildtools2013 (
  $tempdir = hiera('base::params::tempdir', 'C:\Windows\Temp'),
  $proxy_server = hiera('base::proxy_server',''))
{

  download_file { "Microsoft Build Tools 2013" :
    url                   => 'https://s3-eu-west-1.amazonaws.com/rbi.property.software/Microsoft/BuildTools2013/BuildTools_Full.exe',
    destination_directory => $tempdir,
    proxy_address         => $proxy_server,
  }

  package { "Microsoft Build Tools 2013":
    name            => 'Microsoft Build Tools 2013',
    ensure          => installed,
    source          => "$tempdir\\BuildTools_Full.exe",
    provider        => windows,
    install_options => ['/q', '/norestart'],
  }
}
