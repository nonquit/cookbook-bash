#
# Cookbook Name:: bash
# Recipe:: default
#

zone = node["fqdn"].split(".")[2]

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

template "/etc/skel/.bashrc" do
  source "bashrc.erb"
  mode 0644
  owner "root"
  group "root"
  variables({
    :zone_name => zone
  })
end

