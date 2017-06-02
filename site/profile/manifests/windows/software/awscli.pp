# Install AWS CLI tools using Chocolatey
#
# @author Dan
class profile::windows::software::awscli ()
{

  package { 'awscli':
    provider        => 'chocolatey',
  }
}
