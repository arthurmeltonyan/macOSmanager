brew install gcc
brew install cmake
brew install libomp
brew install open-mpi
brew install openblas
brew install lapack
brew install zlib
brew install bzip2
brew install node


brew install httpie
brew install lsd
brew install lftp
brew install gnu-sed


brew install tor
brew install --cask tor-browser
brew install --cask google-chrome
brew install --cask vivaldi
brew install --cask protonvpn
brew install --cask transmission


brew install --cask zoom
brew install --cask discord
brew install --cask telegram
brew install --cask slack
brew install --cask signal


brew install --cask alfred
brew install --cask cakebrew
brew install --cask cleanmymac
brew install --cask little-snitch


brew install --cask the-unarchiver
brew install --cask pdf-expert
brew install --cask obsidian
brew install --cask notion


brew install --cask iina
brew install --cask spotify


brew install --cask typora
brew install --cask pycharm
brew install --cask dataspell
brew install --cask texifier
brew install --cask mactex-no-gui


brew install --cask rapidapi
brew install --cask tableplus
brew install --cask transmit
brew install --cask fork


brew install --cask docker
brew install docker
brew install minikube
brew install helm


brew install git
brew install hub
git config --global core.excludesfile ~/.gitignore_global
git config --global init.defaultBranch main
git config --global user.name "Arthur Meltonyan"
git config --global user.email arthur.meltonyan@gmail.com


brew install neovim
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.3/neovim-0.9/utils/installer/install.sh


brew install rustup


brew install pyenv
pyenv install 3.10
pyenv global 3.10
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(pyenv init -)"' >> ~/.zshrc


pip3 install --user --upgrade pip
brew install pdm
