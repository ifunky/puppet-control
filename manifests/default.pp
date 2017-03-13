node default {

  $role = $::role

  # Always include base classes defined in hiera
  lookup('classes', Array[String], 'unique').include

  # Optionally include role defined on node (typically used in a non ENC environment)
  if (!empty($role)){
    include $role
  }
}