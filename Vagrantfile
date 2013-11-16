# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"
#  config.vm.network :forwarded_port, guest: 80, host: 8080

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = ["./cookbooks", "./site-cookbooks"]
    chef.add_recipe "apt"
    chef.add_recipe "rvm::system"
    chef.add_recipe "rvm::vagrant"
    chef.add_recipe "myapp"

    chef.json = {
      "rvm" => {
        "default_ruby" => "ruby-2.0.0",
        "global_gems" => [
          {"name" => "bundler"},
          {"name" => "rake"}
        ]
      }
    }
  end
end
