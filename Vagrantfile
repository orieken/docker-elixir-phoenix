# -*- mode: ruby -*-
# vi: set ft=ruby :

=begin
unless Vagrant.has_plugin?('vagrant-docker-compose')
  system('vagrant plugin install vagrant-docker-compose')
  puts 'vagrant-docker-compose installed, please try the command again.'
  exit
end

unless Vagrant.has_plugin?('vagrant-vbguest')
  system('vagrant plugin install vagrant-vbguest')
  puts 'vagrant-vbguest installed, please try the command again.'
  exit
end
=end


Vagrant.configure(2) do |config|

  config.vm.box = 'ubuntu/trusty64'

  config.vm.network(:forwarded_port, guest: 3000, host: 46001)

  config.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"

  config.vm.provision :docker
  config.vm.provision :docker_compose, yml: '/vagrant/docker-compose.yml', project_name: 'phoenix_framework', run: 'always', rebuild: true

end
