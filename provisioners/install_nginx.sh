install_nginx() {
	yum -y install nginx
	if [ "$?" != "0" ]; then
		echo "Error installing nginx"
	fi
}

if [ `yum list nginx|grep nginx|wc -l` != 1 ]; then
  wget http://nginx.org/packages/centos/6/noarch/RPMS/nginx-release-centos-6-0.el6.ngx.noarch.rpm && rpm -ivh nginx-release-centos-6-0.el6.ngx.noarch.rpm

  if [ "$?" = "0" ]; then
	install_nginx
  else
	echo "Error setting up nginx repository!" 1>&2
	exit 1
  fi
else
	install_nginx
fi