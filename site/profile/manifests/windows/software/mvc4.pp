# Installs ASP.NET MVC 4
#
# @author Dan
class profile::windows::software::mvc4 ()
{

  package { 'aspnetmvc4.install':
    provider        => 'chocolatey',
  }
}
