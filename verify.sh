#!/usr/bin/env sh

OUT_FILE="dev_box_verification.out"

### Utility Functions
function command_installed () {
	hash $1 &> /dev/null
}

function gem_installed() {
	gem list -i $1 >/dev/null 2>&1
}

# $1 - Command Name
# $2 - Command Description
# $3 - Command to get Version
# $4 - Type  (command or gem )
function verify() {
	if $4_installed $1; then
		echo "$2 is Installated :: Version - "  $3   >> $OUT_FILE
	else 
		echo "$2 Not Installated "  >> $OUT_FILE	
	fi
}

########## EdaaS Dev Box Verifier ##################
echo "EdaaS Dev Box Pre-requisite Verifier" > $OUT_FILE
echo "************************************" >> $OUT_FILE
echo "Developer Profile of " `whoami` >> $OUT_FILE

verify "brew"  "Homebrew "  "`brew -v`"  command
verify "git"  "Git "  "`git --version`"  command
verify "java"  "Java"  "`java -version 2>&1 | awk '/version/{print $NF}' `"  command
verify "VBoxManage" "Virtual Box" "`VBoxManage -v`" command
verify "vagrant"  "Vagrant"  "`vagrant -v`" command
verify "ruby"  "Ruby"  "`ruby -v`" command
verify "mvn"  "Maven"  "`mvn -v | head -1 `" command
verify "node"  "Node"  "`node -v `" command
verify "grunt"  "Grunt"  "`grunt  -v | head -1 `" command
verify "nokogiri"  "Nokogiri"  "`nokogiri -v | head -1 `"  gem

# gem install nokogiri -- --with-xml2-include=/usr/local/include/libxml2 --with-xml2-lib=/usr/local/lib
	
 