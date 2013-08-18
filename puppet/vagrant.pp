file { "/var/www":
    ensure => "directory",
}

file {'index.html':
      path    => '/var/www/index.html',
      ensure  => present,
      mode    => 0755,
      content => "Vy Radionov home work.",
}

node default {
   include base
   include foo
}

class base {
   yumrepo { "nginx":
      baseurl => "http://nginx.org/packages/centos/6/\$basearch/",
      descr => "nginx repo",
      enabled => 1,
      gpgcheck => 0
   }
}

class foo {
   package { "nginx": ensure => installed, require => Yumrepo["nginx"] }
}

file { "nginx.conf":
	path => "/etc/nginx/nginx.conf",
	ensure => present,
	content => "server {\n listen 0.0.0.0:8080;\n root /var/www/;\n index index.html\n}"
}

service { "nginx":
  enable => true,
}