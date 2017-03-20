# Install the Windows 7.1 Developer SDK (.Net 4.0 SDK))
# http://www.microsoft.com/en-us/download/details.aspx?id=8442
#
# @author Dan
class profile::windows::software::windows71sdk (
  $tempdir = hiera('base::params::tempdir', 'C:\Windows\Temp'),
  $proxy_server = hiera('base::proxy_server',''))
{

  $destination_path = "$tempdir\\sdk_71"
  $source_zip_file  = "$destination_path\\Windows_7_1_SDK.zip"

  file { $destination_path:
    ensure             => directory,
    source_permissions => ignore
  }

  download_file { 'Download SDK 7.1 Zip' :
    url                    => 'https://s3-eu-west-1.amazonaws.com/puppet-stuff/AppSoftware/Microsoft/SDK/Windows_7_1_SDK.zip',
    destination_directory  => $destination_path,
    proxy_address          => $proxy_server,
    require                => File[$destination_path],
  }

  windows::unzip { $source_zip_file:
    destination => $destination_path,
    creates     => "$destination_path\\setup.exe",
    require     => Download_file['Download SDK 7.1 Zip']
  }

  package { 'Microsoft Windows SDK for Windows 7 (7.1)':
    name            => 'Microsoft Windows SDK for Windows 7 (7.1)',
    ensure          => installed,
    source          => "$destination_path\\setup.exe",
    provider        => windows,
    install_options => ['-q', '-params:ADDLOCAL=ALL'],
    require         => Windows::Unzip[$source_zip_file],
  }
}