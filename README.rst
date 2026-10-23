macOSmanager
============

``macOSmanager`` script allows data scientists on macOS to simplify the installation of applications and packages.


Installation
------------

The recommended way to install ``macOSmanager`` scripts is to simply use Terminal application:

.. code:: sh

    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    git config --global core.excludesfile ~/.gitignore_global
    git config --global init.defaultBranch master
    git config --global user.name "Arthur Meltonyan"
    git config --global user.email arthur.meltonyan@gmail.com

    brew install --formula nushell
    which nu | sudo tee -a /etc/shells
    chsh -s $(which nu)
    [
      '$env.config.show_banner = false'
      '$env.config.buffer_editor = "nano"'
      '$env.path = ($env.path | prepend "/opt/homebrew/bin" | prepend "/usr/local/bin")'
    ] | str join (char nl) | save --force ($nu.config-path)

    source ($nu.config-path)
    mkdir ($nu.data-dir | path join "vendor/autoload")
    starship init nu | save --force ($nu.data-dir | path join "vendor/autoload/starship.nu")

    brew install --formula starship
    brew install --cask font-fira-code-nerd-font
    starship init nu
    touch ~/.hushlogin
    brew trust Sikarugir-App/sikarugir

    brew install --formula tor mole
    brew install --cask tor-browser transmission
    brew install --cask zoom discord telegram slack signal
    brew install --cask taphouse maccy paste
    brew install --cask raycast superwhisper
    brew install --cask puremac mole-app cleanmymac little-snitch
    brew install --cask highball frankea/whisky/whisky Sikarugir-App/sikarugir/sikarugir #https://githubusercontent.com
    brew install --cask keka pdf-expert
    brew install --cask notion notion-calendar notion-mail
    brew install --cask iina cleanshot clop screenkite #https://podcenter.app
    brew install --cask nativ claude
    brew install --cask codeedit texifier mactex-no-gui
    brew install --cask tableplus postico medis querious
    brew install --cask rapidapi transmit fork orbstack
    brew install --cask cmux rcmd
    brew install --formula docker minikube
    brew install --formula rustup gh

    curl -fsSL https://gitbutler.com/install.sh | sh
    curl -fsSL https://astral.sh/uv/install.sh | sh
    uv python install 3.13.2

``macOSmanager`` officially supports only macOS Tahoe.
