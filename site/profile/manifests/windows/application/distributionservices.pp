class profile::windows::application::distributionservices {

  windowsfeature { 'MSMQ':
    ensure  => present,
  }


}