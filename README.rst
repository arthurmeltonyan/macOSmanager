macOSmanager
============

``macOSmanager`` script allows data scientists on macOS oversimplify the installation of macOS applications and packages.


Installation
------------

The recommended way to install ``macOSmanager`` scripts is to simply use Terminal application:

.. code:: sh

    chsh -s /usr/local/bin/fish
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fish_add_path /opt/homebrew/bin

    git config --global core.excludesfile ~/.gitignore_global
    git config --global init.defaultBranch main
    git config --global user.name "Arthur Meltonyan"
    git config --global user.email arthur.meltonyan@gmail.com

    brew install --cask font-fira-code-nerd-font
    brew install --formula starship
    echo "starship init fish | source" >> ~/.config/fish/config.fish
    touch ~/.hushlogin
    set -U fish_greeting

    brew install --formula jq xsv lsd zoxide ripgrep httpie tor
    brew install --cask tor-browser transmission
    brew install --cask zoom discord telegram slack signal
    brew install --cask applite swiftbar maccy pastepal 
    brew install --cask applite alfred raycast superwhisper
    brew install --cask cleanmymac little-snitch
    brew install --cask whisky crossover 
    brew install --cask the-unarchiver pdf-expert wpsoffice 
    brew install --cask notion notion-calendar
    brew install --cask iina cleanshot clop
    brew install --cask pycharm dataspell rustrover texifier mactex-no-gui
    brew install --cask ghostty rapidapi tableplus transmit fork docker
    brew install --formula podman docker minikube helm
    brew install --formula pyenv rustup
    brew install --formula gh mas

    mas lucky "Pages"
    mas lucky "Keynote"
    mas lucky "Numbers"
    mas lucky "Pixelmator Pro"
    mas lucky "Photomator"
    mas lucky "Shazam"
    mas lucky "iMovie"
    mas lucky "Xcode"
    mas lucky "SnippetsLab"
    mas lucky "KeyKey Touch Typing Tutor"
    mas lucky "Things 3"
    mas lucky "rcmd"

    pyenv install 3.12.7
    pyenv global 3.12.7
    curl -sSL https://install.python-poetry.org | python3 -

``macOSmanager`` officially supports only macOS Seqoia.
