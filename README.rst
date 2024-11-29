macOSmanager
============

``macOSmanager`` script allows data scientists on macOS oversimplify the installation of macOS applications and packages.


Installation
------------

The recommended way to install ``macOSmanager`` scripts is to simply use Terminal application:

.. code:: sh

    git config --global core.excludesfile ~/.gitignore_global
    git config --global init.defaultBranch main
    git config --global user.name "Arthur Meltonyan"
    git config --global user.email arthur.meltonyan@gmail.com

    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fish_add_path /opt/homebrew/bin
    echo "starship init fish | source" >> ~/.config/fish/config.fish
    touch ~/.hushlogin
    set -U fish_greeting

    brew install --formula starship
    brew install --cask font-fira-code-nerd-font

    brew install --formula jq xsv lsd zoxide ripgrep httpie tor
    brew install --cask tor-browser transmission
    brew install --cask zoom discord telegram slack signal
    brew install --cask swiftbar maccy alfred cleanmymac little-snitch
    brew install --cask the-unarchiver pdf-expert notion notion-calendar
    brew install --cask iina cleanshot spotify
    brew install --cask zed pycharm dataspell rustrover texifier mactex-no-gui
    brew install --cask rapidapi tableplus transmit fork docker
    brew install --formula podman docker minikube helm
    brew install --formula pyenv rustup daytona
    brew install --formula gh mas

    mas lucky "Pages"
    mas lucky "Keynote"
    mas lucky "Numbers"
    mas lucky "Microsoft Word"
    mas lucky "Microsoft Excel"
    mas lucky "Microsoft PowerPoint"
    mas lucky "Pixelmator Pro"
    mas lucky "Photomator"
    mas lucky "Shazam"
    mas lucky "iMovie"
    mas lucky "Xcode"
    mas lucky "SnippetsLab"
    mas lucky "KeyKey Touch Typing Tutor"
    mas lucky "Things 3"

    curl -O https://raw.githubusercontent.com/arthurmeltonyan/macosmanager/master/install.zsh
    osascript -e 'tell app "Terminal" to do script "source install.zsh"'

``macOSmanager`` officially supports only macOS Somona.
