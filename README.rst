macOSmanager
============

``macOSmanager`` script allows data scientists on macOS to simplify the installation of applications and packages.


Installation
------------

The recommended way to install ``macOSmanager`` scripts is to simply use Terminal application:

.. code:: sh

    chsh -s /usr/local/bin/fish
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fish_add_path /opt/homebrew/bin

    git config --global core.excludesfile ~/.gitignore_global
    git config --global init.defaultBranch master
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
    brew install --cask raycast superwhisper
    brew install --cask cleanmymac little-snitch
    brew install --cask whisky crossover 
    brew install --cask keka pdf-expert wpsoffice 
    brew install --cask notion notion-calendar notion-mail
    brew install --cask iina cleanshot clop
    brew install --cask pycharm dataspell rustrover texifier mactex-no-gui
    brew install --cask ghostty rapidapi tableplus transmit fork 
    brew install --cask podman-desktop docker
    brew install --formula podman docker minikube
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

    pyenv install 3.13.2
    pyenv global 3.13.2
    curl -LsSf https://astral.sh/uv/install.sh | sh

``macOSmanager`` officially supports only macOS Seqoia.
