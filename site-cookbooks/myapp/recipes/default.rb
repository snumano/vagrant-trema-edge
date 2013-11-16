#
# Cookbook Name:: myapp
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
%w{gcc make libsqlite3-dev libpcap-dev libssl-dev}.each do |each|
  package "#{each}" do
    action :install
  end
end

git "/home/vagrant/trema-edge" do
  repository "git://github.com/trema/trema-edge.git"
  reference "master"
  action :checkout
  user "vagrant"
  group "vagrant"
end

rvm_shell "install trema-edge" do
  ruby_string 'ruby-2.0.0'
  cwd "/home/vagrant/trema-edge"
  code <<-EOC
    bundle install
    rake
  EOC
end

bash ".bashrc" do
  not_if "which trema"
  code <<-EOC
    echo 'PATH="$HOME/trema-edge/bin:$PATH"' >> /home/vagrant/.bashrc
  EOC
end
