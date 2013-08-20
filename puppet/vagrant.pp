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
   
   file { "/etc/nginx/conf.d/default1.conf":
	ensure => present,
	content => "server {\nlisten 0.0.0.0:8080;\nserver_name localhost;\nlocation / {\nroot /var/www/;\nindex  index.html index.htm;\n}}"
   }
}

service { 'nginx':
        ensure     => running,
        enable     => true,
        hasrestart => true
}

package { "lynx": ensure => installed}