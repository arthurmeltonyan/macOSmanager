macOSmanager
============

``macOSmanager`` script allows data scientists on macOS oversimplify the installation of macOS applications and packages.


Installation
------------

The recommended way to install ``macOSmanager`` scripts is to simply use Terminal application:

.. code:: sh

    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    touch ~/.zshenv ~/.zprofile ~/.zshrc ~/.zlogin ~/.zlogout
    echo "export PATH="/opt/homebrew/bin:$PATH"" >> ~/.zshenv
    echo "eval "$(starship init zsh)"" >> ~/.zshrc
    touch ~/.hushlogin

    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
    echo "source ~/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc
    git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
    echo "source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc

    curl -O https://raw.githubusercontent.com/arthurmeltonyan/macosmanager/master/install.zsh
    osascript -e 'tell app "Terminal" to do script "source install.zsh"'

``macOSmanager`` officially supports only macOS Somona.
