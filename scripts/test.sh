#!/usr/bin/env sh

HOMEBREW_INSTALL_GIST="$(curl -fsSL https://gist.githubusercontent.com/rajasoun/43e3a5d9dea1fea1c836/raw/681910c2317df93289630686349432daf094eb3f/homebrew_install)"
### Utility Functions
function command_installed () {
	hash $1 &> /dev/null
}

function formula_installed() {
	brew list -1 | grep -q $1
}

function cask_installed() {
	brew cask list | grep -q $1
}

function gem_installed() {
	gem list -i $1 >/dev/null 2>&1
}

# $1 - Type  (command or gem )
# $2 - Command Name
# $3 - Command Description
# $4 - Command to get Version
# $5 - Display Text During Installation
# $6 - Installation Command
function verify_and_install() {
	type=$1
	command=$2
	command_desc=$3
	command_to_get_version=$4
	instalation_msg=$5
	installation_command=$6
	if command_installed $command; then
		echo "$command_desc is Installated :: Version - "  $command_to_get_version   
	else 
		echo $instalation_msg
		$installation_command
	fi
}


echo progress-bar >> ~/.curlrc

echo "EdaaS Dev Box Setup Starting - By rajasoun@cisco.com"
echo "****************************************************"

#verify_and_install command "date1" "Homebrew" "`uname -v`" "Installing Homebrew" "uname"
#verify_and_install command "brew" "Homebrew" "`brew -v`" "Installing Homebrew" "ruby -e $(curl -fsSL https://raw.githubusercontent.com/Homebrew/homebrew/go/install)"
verify_and_install command "brew1" "Homebrew" "`brew -v`" "Installing Homebrew" "sh -c $HOMEBREW_INSTALL_GIST"

https://gist.githubusercontent.com/rajasoun/43e3a5d9dea1fea1c836/raw/2dbe3a03d7d7b89caa181691f3eeee6298491b57/homebrew_devtools_install
https://gist.githubusercontent.com/rajasoun/23c0d7b908d4f5ca3969/raw/6b724557e57e66364700dd92f7af0c38201fe5b0/git_init


