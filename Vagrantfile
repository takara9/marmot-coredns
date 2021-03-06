# coding: utf-8
# -*- mode: ruby -*-
# vi: set ft=ruby :

#ENV.store('VAGRANT_EXPERIMENTAL', 'disks') 
linux_os = "ubuntu/bionic64"   # Ubuntu 18.04
#linux_os = "ubuntu/focal64"  # Ubuntu 20.04
bridge_if = "en0: Wi-Fi (Wireless)"

vm_spec = [
  { name: "coredns",
    cpu: 1,
    memory: 512,
    box: linux_os,
    private_ip: "172.16.10.220",
    public_ip: "192.168.1.220",
    storage: [2,2], playbook: "install.yaml",
    comment: "coredns" },
]


Vagrant.configure("2") do |config|
  vm_spec.each do |spec|
    config.vm.define spec[:name] do |v|
      v.vm.box = spec[:box]
      v.vm.hostname = spec[:name]
      v.vm.network :private_network,ip: spec[:private_ip]
      v.vm.network :public_network,ip:  spec[:public_ip], bridge: bridge_if
      #v.vm.disk :disk, size: spec[:disk], primary: true              

      v.vm.provider "virtualbox" do |vbox|
        vbox.gui = false
        vbox.cpus = spec[:cpu]
        vbox.memory = spec[:memory]
        i = 1
        spec[:storage].each do |vol|
          vdisk = "vdisks/sd-" + spec[:name] + "-" + i.to_s + ".vdi"
          if not File.exist?(vdisk) then
            vbox.customize [
              'createmedium', 'disk',
              '--filename', vdisk,
              '--format', 'VDI',
              '--size', vol * 1024 ]
          end
          vbox.customize [
              'storageattach', :id,
              '--storagectl', 'SCSI',
              '--port', 1 + i,
              '--device', 0,
              '--type', 'hdd',
              '--medium', vdisk]
          i = i + 1
        end
      end
      v.vm.synced_folder ".", "/vagrant", owner: "vagrant",
                            group: "vagrant", mount_options: ["dmode=700", "fmode=700"]

      v.vm.provision "ansible_local" do |ansible|
        ansible.playbook       = "playbook/" + spec[:playbook]
        ansible.install_mode   = "pip3"
        #ansible.version        = "2.9.6"    
        ansible.verbose        = false
        ansible.install        = true
        ansible.limit          = spec[:name] 
        ansible.inventory_path = "hosts"
      end
    
      # v.vm.provision "shell", inline: <<-SHELL
      #   apt-get update
      #   apt-get install -y apache2
      # SHELL
    end
  end
end
