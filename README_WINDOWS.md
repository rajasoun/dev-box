Installation
============
> (For Windows platform Only)

Prerequisites
-------------
Install the following software on Host Machine
1. [Virtual Box 4.3.16] 
2. [Vagrant 1.6.3]
3. [VirtualBox Guest Additions Plugin]
4. [VirtualBox Hosts Updater Plugin]
5. [JDK 1.7.0_67]
6. [Maven 3.2.3]
7. [Git 2.1.0]
8. [Node.js]
9. [Ruby]
 
Installation
--------------
##### Workspace Setup
Open Windows powershell prompt and run following commands
```sh
sh

gem install nokogiri #Install Nokogiri
npm install -g nvm #Install NVM

cd  $USERPROFILE
mkdir -p Workspace/B2B 
cd Workspace/B2B
echo "export KC_DIR=$USERPROFILE/Workspace/B2B/knowledgecenter" >> ~/.bashrc
```
##### Cloning From  Git Repo
```sh
cd $USERPROFILE\Workspace\B2B
git clone https://github.com/rajasoun/dev-box.git
git clone git@206.80.58.87:b2b/knowledgecenter.git
```
##### Switch to Vagrant Directory
```sh
cd dev-box
```

##### Automatic Addition to /etc/hosts file on Host Machine
```sh
vagrant plugin install vagrant-vbguest
vagrant plugin install vagrant-hostsupdater
```

##### Start the Vagrant
```sh
export KC_DIR=$USERPROFILE/Workspace/B2B/knowledgecenter
./build.sh
vagrant up

```

> ######_Goto [T2 QA](https://t2-qa.xkit.co "T2-QA") to see the Magic_

#Optional steps

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


##### Troubleshooting (In Guest Machine)
To check if the cloned repo is mounted correctly
```sh
vagrant ssh
ls -als /usr/share/nginx/knowledgecenter" 
```

License
-------
Cisco

**Installable Links**
[Virtual Box 4.3.16]:http://download.virtualbox.org/virtualbox/4.3.16/VirtualBox-4.3.16-95972-Win.exe
[Vagrant 1.6.3]:https://dl.bintray.com/mitchellh/vagrant/vagrant_1.6.5.msi
[VirtualBox Guest Additions Plugin]:https://github.com/dotless-de/vagrant-vbguest
[VirtualBox Hosts Updater Plugin]:https://github.com/cogitatio/vagrant-hostsupdater
[JDK 1.7.0_67]:http://www.oracle.com/technetwork/java/javase/downloads/jdk7-downloads-1880260.html
[Maven 3.2.3]:http://mirrors.gigenet.com/apache/maven/maven-3/3.2.3/binaries/apache-maven-3.2.3-bin.zip
[Git 2.1.0]:http://github-windows.s3.amazonaws.com/GitHubSetup.exe
[Node.js]:http://nodejs.org/dist/v0.10.32/x64/node-v0.10.32-x64.msi
[NVM]: https://www.npmjs.org/package/nvm
[Ruby]:https://www.ruby-lang.org/en/downloads/
[Nokogiri gem]:https://rubygems.org/gems/nokogiri


