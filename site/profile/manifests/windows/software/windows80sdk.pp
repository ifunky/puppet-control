# Install the Windows 8.0 Developer SDK (.Net 4.5 SDK))
# https://msdn.microsoft.com/en-us/windows/desktop/hh852363.aspx
#
# @author Dan
class profile::windows::software::windows80sdk (
  $tempdir = hiera('base::params::tempdir', 'C:\Windows\Temp'),
  $proxy_server = hiera('base::proxy_server',''))
{

  $destination_path = "$tempdir\\sdk_80"
  $source_zip_file  = "$destination_path\\Windows_8_0_SDK.zip"

  file { $destination_path:
    ensure             => directory,
    source_permissions => ignore
  }

  download_file { 'Download SDK 8.0 Zip' :
    url                   => 'https://s3-eu-west-1.amazonaws.com/puppet-stuff/AppSoftware/Microsoft/SDK/Windows_8_0_SDK.zip',
    destination_directory => $destination_path,
    proxy_address         => $proxy_server,
    require               => File[$destination_path],
  }

  windows::unzip { $source_zip_file:
    destination => $destination_path,
    creates     => "$destination_path\\setup.exe",
    require     => Download_file['Download SDK 8.0 Zip']
  }

  package { 'Microsoft .NET Framework 4.5 SDK':
    name            => 'Microsoft .NET Framework 4.5 SDK',
    ensure          => installed,
    source          => "$destination_path\\sdksetup.exe",
    provider        => windows,
    install_options => ['/q', '/features', '+'],
    require         => Windows::Unzip[$source_zip_file],
  }
}