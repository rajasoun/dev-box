## This brings up Unbuntu based box

## Prerequites
#### Mandatory:
* [Vagrant](https://dl.bintray.com/mitchellh/vagrant/vagrant_1.6.5.msi)
* [Virtualbox](http://download.virtualbox.org/virtualbox/4.3.16/VirtualBox-4.3.16-95972-Win.exe)
* [Vagrant hostsupdater plugin](https://github.com/cogitatio/vagrant-hostsupdater)
* [Git](https://github.com/msysgit/msysgit/releases/download/Git-1.9.4-preview20140929/Git-1.9.4-preview20140929.exe)

#### Optional:
* [ConEmu](http://code.google.com/p/conemu-maximus5/wiki/Downloads)-Nice substitute to windows command prompt

## Steps:
After prerequistes are installed, run following commands in windows command prompt or ConEmu Terminal
```
%> mkdir c:\workspace
%> cd C:\Workspace
%> git clone <this repository>
%> git clone <knowledgecenter repo>
%> cd dev-box
%> vagrant up
%> vagrant ssh
%> cd /apps/knowledgecenter
%> ./build.sh
```
Go to http://t2-qa.xkit.co

Your vagrant is ready...
