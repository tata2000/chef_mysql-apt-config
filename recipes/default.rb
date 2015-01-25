#
# Cookbook Name:: mysql-apt-config
# Recipe:: default
#
# Copyright 2014, Wix.com
#
# All rights reserved - Do Not Redistribute
#

file_name = node['mysql-apt-confing']['download_url'].split('/').last

local_file_name="#{Chef::Config[:file_cache_path]}/#{file_name}"

remote_file local_file_name do
  source node['mysql-apt-confing']['download_url']
end.run_action(:create_if_missing)

md5 = Digest::MD5.file(local_file_name).hexdigest 

if node['mysql-apt-confing']['download_md5']==md5
  dpkg_package local_file_name do
    action :nothing
  end.run_action(:install)
else
  raise "MD5 does not match. The MD5 of downloaded file is #{md5} and not #{node['mysql-apt-confing']['download_md5']}"
end



