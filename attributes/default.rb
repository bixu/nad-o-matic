default['nad']['install_path']                 = '/opt/circonus'
default['nad']['bin_path']                     = node['nad']['install_path'] + '/embedded/bin'
default['nad']['node_path']                    = node['nad']['install_path'] + '/lib/node_modules'
default['nad']['registration']['authtoken']    = '8c7a057e-18f8-4fe8-8549-63cc965f6dc0'

if node['privateaddress']
  default['nad']['registration']['target']     = node['privateaddress']
else
  default['nad']['registration']['target']     = node['ipaddress']
end

default['nad']['registration']['hostname']     = `hostname`.strip
default['nad']['registration']['brokerid']     = 335
default['nad']['registration']['configfile']   = '/etc/nad.conf'
