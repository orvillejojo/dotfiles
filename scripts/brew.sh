# Install Homebrew

# Ask for the administrator password upfront.
# sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew tap homebrew/versions
brew tap caskroom/fonts
brew cask upgrade
brew update
brew upgrade --all

# Install packages
apps=(
    wget
    jq
    zsh-completions
    golang
    gzip
    zsh
    hub
    rbenv
    pyenv
    tmux
    reattach-to-user-namespace
)

caskapps=(
    appcleaner
    adobe-acrobat-reader
    karabiner-elements
    visual-studio-code
#    google-chrome
    google-japanese-ime
    iterm2
    docker
    slack
    vagrant
    postman
    coteditor
)


brew install "${apps[@]}"
brew cask install "${caskapps[@]}"
brew cleanup
