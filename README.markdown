# EPuck 2 dev virtual machine

Installing this VM requires :

1. A working internet connection.
2. `vagrant`
3. `virtualbox`
4. `vagrant-vbguest`. This can be installed using `vagrant plugin install vagrant-vbguest`.

## Usage
Simply run `vagrant up` from this folder and vagrant will download the base image and configure it.
This can take some time (up to an hour if internet connection is slow), so you might want to prepare some cofee.

When you are done with the VM, simply run `vm halt` to shutdown it.
Next time you want to use it, `vagrant up` will be much faster because it will just boot the already-configured VM.

## Initial config
Sadly there is still a few things to do by hand :

1. Enable non free drivers for Virtualbox by going to `Settings Manager -> Additional Drivers` and choosing "Continue using a manually installed driver". You should now have a much better resolution available when going to `Settings Manager -> Display`.
2. Configure your keyboard layout in `Settings Manager -> Input Manager -> Input Method -> Add` and add a swiss keyboard.

## Updating the VM
If you want to update the configuration of the VM simply do :

```sh
vagrant halt # Ensures machine is stopped
git pull # Update config files
vagrant up --provision # Boot and tell Vagrant to apply the new config
```

## De-installing
Running `vagrant destroy` will remove every file Vagrant used for this box.

## Building for distribution

This repository also includes a [Packer](https://www.packer.io/) build script.
Using the Packer build creates the VM from an Ubuntu install CD and setups it for development.
The machine is then exported as a VirtualBox file (compressed as `.zip`), which can easily be distributed without requiring additional setup.
The build can be run by running `packer build packer.json`.

The resulting image should be treated as "frozen";
do not modify it by hand (e.g., by adding packages): instead change the configuration, then rebuild it from scratch.
This also implies that users of the image must re-download it completely.
