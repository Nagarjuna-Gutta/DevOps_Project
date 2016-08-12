#
# Cookbook Name:: learn_chef_httpd
# Recipe:: default

#
# Copyright (C) 2014
#
#


package 'httpd'


yum_package 'mod_ssl'

yum_package 'openssl'


directory '/etc/ssl/certs' do
  owner 'root'
  group 'root'
  mode '0755'
  
action :create

end


template '/etc/ssl/certs/test.crt' do
 
 source 'test.crt.erb'

end


template '/etc/ssl/certs/test.key' do
 
 source 'test.key.erb'

end


template '/var/www/html/index.html' do

  source 'index.html.erb'

end

template '/etc/httpd/conf/httpd.conf' do
 
 source 'httpd.conf.erb'

end



service 'iptables' do
  
action :stop

end


service 'httpd' do
  
action [:enable, :start]

end