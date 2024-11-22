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
    fisher install 'ryoppippi/fish-poetry'
    curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher


    curl -O https://raw.githubusercontent.com/arthurmeltonyan/macosmanager/master/install.zsh
    osascript -e 'tell app "Terminal" to do script "source install.zsh"'

``macOSmanager`` officially supports only macOS Somona.
