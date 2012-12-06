#
# Cookbook Name:: bash
# Recipe:: default
#

zone = data_bag_item(:zones, node.chef_environment)['name']

package "bash" do
  action :upgrade
end

template "/root/.bashrc" do
  source "bashrc.erb"
  mode 0644
  owner "root"
  group "root"
  variables({
    :zone_name => zone
  })
end

template "/etc/bash.bashrc" do
  source "bash.bashrc.erb"
  mode 0644
  owner "root"
  group "root"
  variables({
    :zone_name => zone
  })
end
