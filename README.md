Installation
============
> (Mac OS Support Only)

Prerequisites
-------------
Install the following software on Host Machine
1. [Virtual Box 4.3.16] 
2. [Vagrant 1.6.3]
3. [VirtualBox Guest Additions Plugin]
4. [VirtualBox Hosts Updater Plugin]
5. [JDK 1.7.0_67]
6. Maven 3.2.3
7. Git CLI Client 2.1.0
8. [Node.js & NVM]
9. [Ruby & Nokogiri gem]
 
Installation
--------------
##### Workspace Setup

```sh
cd  /Users/$USER
mkdir -p Workspace/B2B 
cd Workspace/B2B
echo "export KC_DIR=/Users/$USER/Workspace/B2B/knowledgecenter" >> ~/.bashrc
```
##### Cloning From  Git Repo
```sh
git clone git@206.80.58.87:b2b/knowledgecenter.git
#git clone git@206.80.58.87:b2b/ui-vagrant.git
git clone https://github.com/rajasoun/dev-box.git
```
##### Switch to Vagrant Directory
```sh
cd ui-vagrant
```

##### Automatic Addition to /etc/hosts file on Host Machine
```sh
vagrant plugin install vagrant-vbguest
vagrant plugin install vagrant-hostsupdater
```

##### Start the Vagrant
```sh
export KC_DIR=/Users/$USER/Workspace/B2B/knowledgecenter
vagrant up
```

> ######_Goto [T2 QA](t2-qa.xkit.co "T2-QA") to see the Magic_

##### Bash Auto Complete Setup for Vagrant
```sh
brew tap homebrew/completions
brew install vagrant-completion
```

Then add the following lines to your ~/.bashrc

if [ -f `brew --prefix`/etc/bash_completion.d/vagrant ]; then
    source `brew --prefix`/etc/bash_completion.d/vagrant
fi

##### Troubleshooting (In Host Machine)
From Host Machine. 
```sh
ping t2-qa.xkit.co 
```
From Host Machine. - run the Command to clear the Cache 
```sh
dscacheutil -flushcache
```
If Ping timeouts, possible Issue with Private IP or /etc/hosts

From Host Machine, Ensure Mac OS X version 10.9.X

##### Troubleshooting (In Guest Machine)
To check if the cloned repo is mounted correctly
```sh
vagrant ssh
ls -als /usr/share/nginx/knowledgecenter" 
```

License
-------
CCL

**Installable Links**
[Virtual Box 4.3.16]:https://www.virtualbox.org/wiki/Downloads 
[Vagrant 1.6.3]:https://dl.bintray.com/mitchellh/vagrant/vagrant_1.6.3.dmg
[VirtualBox Guest Additions Plugin]:https://github.com/dotless-de/vagrant-vbguest
[VirtualBox Hosts Updater Plugin]:https://github.com/cogitatio/vagrant-hostsupdater
[JDK 1.7.0_67]:http://www.oracle.com/technetwork/java/javase/downloads/jdk7-downloads-1880260.html
[Maven 3.2.3]:
[Git CLI Client 2.1.0]:
8. [Node.js & NVM]: 
9. [Ruby & Nokogiri gem]:


