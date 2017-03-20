# Install .Net 4.5.1 Developer Pack (SDK)
# https://chocolatey.org/packages/netfx-4.5.1-devpack
# http://blogs.msdn.com/b/dotnet/p/dotnet_sdks.aspx
#
# @author Dan
class profile::windows::software::dotnet451developerpack ()
{

  package { 'netfx-4.5.1-devpack':
    ensure   => latest,
    provider => 'chocolatey',
  }
}
