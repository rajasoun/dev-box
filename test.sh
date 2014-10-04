#!/usr/bin/env sh

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

verify_and_install command "brew" "Homebrew" "`brew -v`" "Installing Homebrew" "ruby -e $(curl -fsSL https://raw.githubusercontent.com/Homebrew/homebrew/go/install)"