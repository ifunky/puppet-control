# Install AWS CLI tools using Chocolatey
#
# @author Dan
class profile::windows::software::awscli (
  $default_region = 'eu-west-1'
)
{

  package { 'awscli':
    provider        => 'chocolatey',
  }

  windows_env { 'AWS_DEFAULT_REGION':
    ensure    => 'present',
    value     => $default_region,
    mergemode => clobber,
  }
}
