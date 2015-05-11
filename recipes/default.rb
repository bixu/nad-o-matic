include_recipe 'nad'

template "#{node['nad']['install_path']}/sbin/register_via_nad.sh" do
  source 'register_via_nad.sh.erb'
  mode '0700'
end

template node['nad']['registration']['configfile'] do
  source 'nad.conf.erb'
  notifies :run, "execute[register_via_nad]"
end

execute 'register_via_nad' do
  command "#{node['nad']['install_path']}/sbin/register_via_nad.sh"
  action :nothing
  ignore_failure true
end
