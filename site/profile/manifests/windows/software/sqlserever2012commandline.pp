# Install SQL Server 2012 Command Line Utilities
# http://www.microsoft.com/en-us/download/details.aspx?id=29065
#
# @author Dan
class profile::windows::software::sqlserever2012commandline (
  $tempdir = hiera('base::params::tempdir', 'C:\\Windows\\Temp'),
  $proxy_server = hiera('base::proxy_server',''))
{

  package { 'sql2012.nativeclient':
    ensure          => '2011.110.3000.1',
    provider        => 'chocolatey',
  }

  download_file { 'Download Microsoft SQL Server 2012 Command Line Utilites' :
    url                   => 'https://s3-eu-west-1.amazonaws.com/puppet-stuff/AppSoftware/Microsoft/SQLServer2012/SqlCmdLnUtils.msi',
    destination_directory => $tempdir,
    proxy_address         => $proxy_server,
    require               => Package['sql2012.nativeclient']
  }

  package { 'Microsoft SQL Server 2012 Command Line Utilities':
    name            => 'Microsoft SQL Server 2012 Command Line Utilities',
    ensure          => installed,
    source          => "$tempdir\\SqlCmdLnUtils.msi",
    provider        => windows,
    install_options => ['/passive'],
    require         => Download_file['Download Microsoft SQL Server 2012 Command Line Utilites'],
  }

  windows_env { "Update system path with SQL 2012 command utilties" :
    ensure    => present,
    mergemode => insert,
    variable  => 'path',
    value     => 'C:\Program Files\Microsoft SQL Server\110\Tools\Binn',
    require   => Package['Microsoft SQL Server 2012 Command Line Utilities']
  }

}