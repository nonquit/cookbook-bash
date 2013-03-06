#
# Cookbook Name:: bash
# Recipe:: default
#
# Copyright 2012-2013, Abel Lopez
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

zone = node["fqdn"].split(".")[2]

package "bash" do
  action :upgrade
end

template "/root/.bashrc" do
  source "bashrc.erb"
  owner  "root"
  group  "root"
  mode   00644

  variables(
    :zone_name => zone
  )
end

template "/etc/bash.bashrc" do
  source "bash.bashrc.erb"
  owner  "root"
  group  "root"
  mode   00644

  variables(
    :zone_name => zone
  )
end

template "/etc/skel/.bashrc" do
  source "bashrc.erb"
  owner  "root"
  group  "root"
  mode   0644

  variables(
    :zone_name => zone
  )
end
