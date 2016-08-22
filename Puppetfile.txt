forge "https://forgeapi.puppetlabs.com"

# Using puppet module install doesn't work well - too many issues like permission denied.
# Use git directly instead.
#
#mod "puppetlabs/stdlib", "4.9.0"
#mod "puppetlabs/inifile", "1.4.2"

mod 'stdlib',
  :git => "https://github.com/puppetlabs/puppetlabs-stdlib.git",
  :ref => '4.9.0'

mod 'inifile',
  :git => "https://github.com/puppetlabs/puppetlabs-inifile.git",
  :ref => '1.4.2'


# Other
mod 'windows',
  :git => "https://github.com/ifunky/ifunky-windows.git"
