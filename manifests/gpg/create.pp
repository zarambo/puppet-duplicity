
define duplicity::gpg::create (
  $passphrase,
  $email = "backup_${name}@local",
) {
  include 'duplicity::gpg'

  file { "${duplicity::duply_key_dir}/gpg_create.conf":
    ensure => 'file',
    content => template('duplicity/gpg/create.conf.erb'),
  }
  ->
  exec { "create_${name}":
    command => "/usr/bin/gpg --batch --gen-key ${duplicity::duply_key_dir}/gpg_create.conf",
  }
}