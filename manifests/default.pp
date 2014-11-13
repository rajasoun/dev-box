exec { "update-apt-repo":
	command => "/usr/bin/apt-get update"
}
package { "nginx":
	ensure => present
}
package { "ruby":
	ensure => present
}
package { "ruby-dev":
	ensure => present
}
package { "apache2":
	ensure => absent
}
file {'/etc/nginx/conf.d/b2b.conf': 
	ensure => link, 
	target => "/vagrant/nginx/b2b.conf"
}
package { "openjdk-7-jdk":
	ensure => present
}
package { "maven":
	ensure => present
}
package { "nodejs":
	ensure => present
}
package { "npm":
	ensure => present
}
file {'/etc/localtime': 
	ensure => link, 
	target => "/usr/share/zoneinfo/Asia/Kolkata"
}
file {'/usr/share/nginx/knowledgecenter': 
	ensure => link, 
	target => "/apps/knowledgecenter/kc-web/src/main/webapp"
}