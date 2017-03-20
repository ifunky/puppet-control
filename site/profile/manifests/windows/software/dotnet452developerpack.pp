# .NET Framework 4.5.2 Developer Pack installs the multi-targeting pack for .NET Framework 4.5.2.
# Developers can build applications targeting the .NET Framework 4.5.2 using either Visual Studio 2013, Visual Studio 2012 or third party IDEs.
# You need to download the web installer instead of this package if you intend to redistribute .NET Framework 4.5.2.
#
# @author Dan
class profile::windows::software::dotnet452developerpack ()
{

  package { 'netfx-4.5.2-devpack':
    ensure          => 'latest',
    provider        => 'chocolatey',
  }
}
