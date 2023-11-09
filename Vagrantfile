$script = <<-SCRIPT
mysql -G -u root -proot -e "CREATE USER 'root' IDENTIFIED BY 'root';"
mysql -G -u root -proot -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;"
mysql -G -u root -proot -e "FLUSH PRIVILEGES;"
SCRIPT

Vagrant.configure("2") do |config| 
    
    config.vm.box = "ubuntu/trusty64"
    config.vm.hostname = "LAMP"
    config.vm.network "private_network", ip: "192.168.56.5" 
    config.vm.network "forwarded_port", guest: 80, host: 80
    config.vm.network 'forwarded_port', guest: 3306, host: 3306
    config.vm.provision "shell", path: "provision.sh"
    config.vm.provision "shell", inline: $script       
    config.vm.provider "virtualbox" do |v|
        v.memory = 1024
        v.cpus = 2
    end     
    
end



