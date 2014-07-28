# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64_vmware.box"

  config.vm.provider "vmware_fusion" do |v|
      # This much ram is needed to build fsharp, you can drop it down once
      # fsharp is built.
      v.vmx["memsize"] = "8192"
      v.vmx["numvcpus"] = "2"
  end

  config.omnibus.chef_version = :latest

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = ["cookbooks","site-cookbooks"]
    chef.add_recipe "FSharpRProvider.DevEnv"
    chef.json.merge!({
      :mono => {
          :branch => "mono-3.4.0.204",
          :install_method => "sources",
      },
    })
  end
end
