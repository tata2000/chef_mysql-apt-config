mysql-apt-config Cookbook
=========================
This cookbook install mysql-apt-config
from http://dev.mysql.com/downloads/repo/apt/

Requirements
------------

#### packages
- `dpkg_package` - mysql-apt-config needs dpkg_package to install the package downloaded


Usage
-----
#### mysql-apt-config::default
Just include `mysql-apt-config` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[mysql-apt-config]"
  ]
}
```

License and Authors
-------------------
Authors:  Tatyana Arenburg
