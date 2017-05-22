# Install .Net 3.5
  #
  # @author Dan
  class profile::windows::software::dotnet35 (
    $tempdir = hiera('base::tempdir', 'C:\Windows\Temp'),
    $proxy_server = hiera('base::proxy_server',''))
  {

    $iso_source_folder  = "$tempdir\isosource"
    $iso_source_zipfile =  "$iso_source_folder\isosource_2012_sxs.zip"

    file { $iso_source_folder:
      ensure             => directory,
      path               => $iso_source_folder,
      source_permissions => ignore,
    }

    download_file { "ISO Source 2012" :
      url => 'https://s3-eu-west-1.amazonaws.com/rbi.property.software/Microsoft/ISOSource_2012/isosource_2012_sxs.zip',
      destination_directory => $iso_source_folder,
      proxy_address         => $proxy_server,
      require               => File[$iso_source_folder],
      notify                => Windows::Unzip[$iso_source_zipfile],
    }

    windows::unzip { $iso_source_zipfile:
      destination => $iso_source_folder,
      creates     => "$iso_source_folder\x86_wpf-winfxtargets_31bf3856ad364e35_6.3.9600.16384_none_5dd75921bd7cccb3\\microsoft.winfx.targets",
      require     => Download_file['ISO Source 2012']
    }

    windowsfeature { [ 'NET-Framework-Core', ] :
      ensure  => present,
      source  => $iso_source_folder,
      require => [ Windows::Unzip[$iso_source_zipfile] ]
    }

}