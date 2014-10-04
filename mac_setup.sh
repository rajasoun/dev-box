#!/usr/bin/env sh

### Utility Functions
function command_exists () {
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

# Configuration
###############

# Run a noop command as sudo, so that the rest of the script runs during
# the sudo grace period
echo "Getting sudo privileges. Enter your account password if prompted"
sudo /bin/date > /dev/null 2>&1

sudo chown -R `whoami` /usr/local

# Configure curl to always show progress bars
echo progress-bar >> ~/.curlrc

echo "EdaaS Dev Box Setup Starting - By rajasoun@cisco.com"

# Verify XCode Installation
if ! command_exists "clang"; then
	echo "\n"
	echo "Installing Clang"

	echo "Installing the XCode command line tools"; xcode-select --install
fi


# Homebrew
##########
if ! command_exists "brew"; then
	echo "\n"
	echo "Installing Homebrew"

	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/homebrew/go/install)"
fi

if ! command_exists "brew"; then
	echo "Put Homebrew location earlier in PATH ..."
  	echo "\n# UI Vagrant Settup: By mac_setup.sh " >> ~/.bashrc
  	echo "export PATH='/usr/local/bin:$PATH'\n" >> ~/.bashrc
  	source ~/.bashrc
fi

if ! command_exists "brew"; then
	echo >&2 "I can't seem to find the brew command. If you've just installed it, try opening a new terminal window and running the script again; otherwise, check your \$PATH."
	exit 1
fi

echo "Installing Homebrew Versions..."
brew tap homebrew/versions

for formula in git readline openssl coreutils moreutils wget curl ssh-copy-id keychain vim ; do
	if ! formula_installed $formula; then
		brew install $formula
	fi
done
brew link --force openssl
brew link --force readline

# Homebrew Casks
################

# Allow the use of Homebrew Casks
formula_installed brew-cask || brew install caskroom/cask/brew-cask
#export HOMEBREW_CASK_OPTS="--appdir=/Applications"
#VBoxManage -v & vagrant -v
for cask in virtualbox vagrant iterm2 maven onepassword the-unarchiver; do
	if ! cask_installed $cask; then
		brew cask install $cask
	fi
done
brew update
brew upgrade

# Git setup
###########

if [[ ! -e ~/.gitconfig ]]; then
	echo "\n"
	echo "Fetching a base .gitconfig file"

	# A sensible default git config, minus personal data
	curl https://raw.githubusercontent.com/robmiller/dotfiles/master/gitconfig | tail -n+4 >> ~/.gitconfig
fi

if ! grep -q email ~/.gitconfig; then
	echo "\n"
	echo "Configuring personal information for Git"

	# Prompt the user for their personal information, to use in the
	# .gitconfig file
	fullname=
	email=
	vared -p "What's your Name? " fullname
	vared -p "What's your Email address? " email

	echo "Setting git config to use $fullname <$email>."
	git config --global user.name "$fullname"
	git config --global user.email "$email"
	if ! [ -e "$HOME/.ssh/id_rsa.pub" ]
	then
  		echo "Generating ssh key..."
  		ssh-keygen -t rsa -C "$email"
	fi
fi


# RVM, Ruby, and Gems
#####################

if ! command_exists "rvm"; then
	echo "\n"
	echo "Installing RVM, the Ruby Version Manager & Ruby"
	curl -L https://get.rvm.io | bash -s stable  --autolibs=enable # type rvm | head -1 & ruby -v
	rvm use default --default
	### Update RVM
	rvm get stable --autolibs=enable
fi

if ! command_exists "rvm"; then
	echo >&2 "I can't find RVM. Try opening a new terminal window and running this script again."
	exit 1
fi

if ! ruby --version | grep -q 2.1.3; then
	[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
	rvm autolibs homebrew
	echo "Installing Ruby..."
	rvm install 2.1.3
	rvm use 2.1.3 --default
	rvm cleanup all
fi

# Disable the installation of documentation along with Ruby gems, since
# it slows things down
[[ -f ~/.gemrc ]] || echo "gem: --no-document" > ~/.gemrc
gem update --system


xcode-select -switch /Library/Developer/CommandLineTools
gem_installed "bundler"    || gem install bundler
gem_installed "nokogiri"   || gem install nokogiri -- --with-xml2-include=/usr/local/include/libxml2 --with-xml2-lib=/usr/local/lib

# NVM, Node.js, and NPMS
########################
if ! command_exists "nvm"; then
	echo "\n"
	echo "Installing NVM, the Node Version Manager"
	echo "Installing NVM..."
	curl https://raw.githubusercontent.com/creationix/nvm/v0.17.1/install.sh | bash
fi

if ! command_exists "nvm"; then
	echo >&2 "I can't find NVM. Try opening a new terminal window and running this script again."
	exit 1
fi

if ! command_exists "node"; then
	echo "Installing Node.js..."
	nvm install v0.10.32 ### Install Node.js 
	npm install -g grunt-cli
fi


