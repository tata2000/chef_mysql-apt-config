

default['mysql-apt-confing']['base_url']='http://dev.mysql.com/get/'

default['mysql-apt-confing']['file_name']['debian']['7'] = 'mysql-apt-config_0.3.2-1debian7_all.deb' 
default['mysql-apt-confing']['md5']['debian']['7'] = '862000aa0f1719700ec62eea237a0f72'
default['mysql-apt-confing']['file_name']['ubuntu']['12'] = 'mysql-apt-config_0.3.2-1ubuntu12.04_all.deb'
default['mysql-apt-confing']['md5']['ubuntu']['12'] = '01328fce8160cb8f5d44a2fb3f8e2d56'
default['mysql-apt-confing']['file_name']['ubuntu']['14'] = 'mysql-apt-config_0.3.2-1ubuntu14.04_all.deb'
default['mysql-apt-confing']['md5']['ubuntu']['14'] = 'f893b0b1495c6c0458c40320c8f556b0'



default['mysql-apt-confing']['download_url'] = node['mysql-apt-confing']['base_url'] +
      node['mysql-apt-confing']['file_name'][node['platform']][node['platform_version'].split('.')[0]] 
default['mysql-apt-confing']['download_md5'] = node['mysql-apt-confing']['md5'][node['platform']][node['platform_version'].split('.')[0]] 
