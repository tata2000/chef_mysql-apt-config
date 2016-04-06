module MysqlAptConfig
  def self.select(node)
    platform = node['platform']
    platform_version = node['platform_version']
    package_platform_version =
      if platform == 'ubuntu' && Chef::Version.new(platform_version) >= Chef::Version.new('14.10')
        14.10
      else
        platform_version.split('.').first
      end

    download_url = node['mysql-apt-config']['download_url'] ||
      node['mysql-apt-config']['base_url'] + node['mysql-apt-config']['file_name'][platform][package_platform_version]

    download_md5 = node['mysql-apt-config']['download_md5'] ||
      node['mysql-apt-config']['md5'][platform][package_platform_version]

    [download_url, download_md5]
  end
end
