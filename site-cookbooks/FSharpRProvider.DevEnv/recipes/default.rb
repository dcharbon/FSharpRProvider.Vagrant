include_recipe "apt"
include_recipe "build-essential"
include_recipe "mono"

["r-base","r-base-dev"].each do |pkg|
  package pkg do
    action :install
  end
end
