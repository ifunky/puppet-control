# Installs the gem bundler
#
# @author Dan
class profile::windows::software::bundler ()
{

  windows::gem { 'bundler':
    ensure => installed
  }
}
