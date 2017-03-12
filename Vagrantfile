Vagrant.configure(2) do |config|
  # Ubuntu 14.04
  config.vm.box = "ubuntu/trusty64"

  # config.vm.synced_folder ".", "/vagrant", {:mount_options => ['dmode=777','fmode=777']}
  #  config.vbguest.auto_update = false
  #  config.vbguest.no_remote = true

  config.vm.network "forwarded_port", guest: 4000, host: 8040

  config.vm.provider "virtualbox" do |vb|
    # Display the VirtualBox GUI when booting the machine
    vb.gui = true
  end

  # Install xfce and virtualbox additions
  config.vm.provision "shell", inline: "sudo apt-get -y update"
  config.vm.provision "shell", inline: "sudo apt-get -y install git"
  
  config.vm.provision "shell", path: "setup-ruby.sh"

  config.vm.provision "shell", inline: "gem install jekyll bundler"
  config.vm.provision "shell", inline: "which ruby"
  config.vm.provision "shell", inline: "sudo usermod -a -G rvm vagrant"
  config.vm.provision "shell", inline: "jekyll new /tmp/jekyll-web-test --force"


end