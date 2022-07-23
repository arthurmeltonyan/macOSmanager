macosmanager
============

``macosmanager`` scripts allow data scientists on macOS oversimplify the installation of macOS applications and packages.


Installation
------------

The recommended way to install ``macosmanager`` scripts is to simply use Terminal application:

.. code:: sh

    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    touch ~/.zshenv ~/.zprofile ~/.zshrc ~/.zlogin ~/.zlogout
    echo "export PATH="/opt/homebrew/bin:$PATH"" >> ~/.zshenv
    brew tap homebrew/cask-fonts
    brew install --cask font-fira-code-nerd-font
    brew install starship
    echo "eval "$(starship init zsh)"" >> ~/.zshrc
    touch ~/.hushlogin


    curl -O https://raw.githubusercontent.com/arthurmeltonyan/macosmanager/master/install.zsh
    osascript -e 'tell app "Terminal" to do script "source install.zsh"'

``macosmanager`` officially supports only macOS Monterey.

