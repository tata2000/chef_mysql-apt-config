#
# Cookbook Name:: mysql-apt-config
# Recipe:: default
#
# Copyright 2014, Wix.com
#
# All rights reserved - Do Not Redistribute
#

download_url, download_md5 = MysqlAptConfig.select(node)
file_name = download_url.split('/').last
local_file_name = "#{Chef::Config[:file_cache_path]}/#{file_name}"

remote_file local_file_name do
  source download_url
end.run_action(:create_if_missing)

md5 = Digest::MD5.file(local_file_name).hexdigest

if download_md5 == md5
  dpkg_package local_file_name do
    action :nothing
    notifies :run, 'execute[apt-get update]', :immediately
  end.run_action(:install)
else
  raise "MD5 does not match. The MD5 of downloaded file is #{md5} and not #{download_md5}"
end
