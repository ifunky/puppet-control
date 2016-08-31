node default {

  $role = $::role

  # Always include base classes defined in hiera
  hiera_include('classes')

  # Optionally include role defined on node (typically used in a non ENC environment)
  if (!empty($role)){
    include $role
  }
}