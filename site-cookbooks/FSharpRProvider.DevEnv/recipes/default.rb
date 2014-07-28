include_recipe "apt"
include_recipe "build-essential"
include_recipe "mono"

["r-base","r-base-dev","pkg-config","autoconf","libtool","automake"].each do |pkg|
  package pkg do
    action :install
  end
end

bash "Set the R_HOME variable so R libs are discoverable" do
  user "root"
  code <<-EOH
  echo "export R_HOME=/usr/lib/R" > /etc/profile.d/r_home.sh
  EOH
end

# This will make sure that mono libs are resolveable
bash "Make sure ldconfig was run" do
  user "root"
  code <<-EOH
  ldconfig
  EOH
end

fsharp_installation_dir = "/usr/local/src/fsharp"

git fsharp_installation_dir do
  repository "https://github.com/fsharp/fsharp"
  reference "master"
  action :sync
  notifies :run, "bash[build_fsharp]"
end

bash "build_fsharp" do
  user "root"
  cwd fsharp_installation_dir
  code <<-EOH
  ./autogen.sh --prefix /usr/local
  make
  make install
  ldconfig
  EOH
end

bash "update certificates for NuGet" do
  user "root"
  code <<-EOH
  mozroots --import --machine --sync
  yes | certmgr -ssl -m https://go.microsoft.com
  yes | certmgr -ssl -m https://nugetgallery.blob.core.windows.net
  yes | certmgr -ssl -m https://nuget.org
  EOH
end
