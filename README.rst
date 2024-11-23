macOSmanager
============

``macOSmanager`` script allows data scientists on macOS oversimplify the installation of macOS applications and packages.


Installation
------------

The recommended way to install ``macOSmanager`` scripts is to simply use Terminal application:

.. code:: sh

    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fish_add_path /opt/homebrew/bin
    echo "starship init fish | source" >> ~/.config/fish/config.fish
    touch ~/.hushlogin
    set -U fish_greeting
    brew bundle --file=Brewfile
    brew install --formula jq xsv lsd zoxide ripgrep httpie tor
    brew install --cask tor-browser transmission 
    brew install --cask zoom discord telegram slack signal
    brew install --cask swiftbar alfred cakebrew cleanmymac little-snitch
    brew install --cask the-unarchiver pdf-expert notion notion-calendar
    brew install --cask iina cleanshot spotify
    brew install --cask pycharm dataspell rustrover texifier mactex-no-gui
    brew install --cask rapidapi tableplus transmit fork



    curl -O https://raw.githubusercontent.com/arthurmeltonyan/macosmanager/master/install.zsh
    osascript -e 'tell app "Terminal" to do script "source install.zsh"'

``macOSmanager`` officially supports only macOS Somona.
