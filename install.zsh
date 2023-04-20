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
brew install --cask brave-browser
brew install --cask google-chrome
brew install --cask firefox
brew install --cask opera
brew install --cask transmission
brew install --cask zoom
brew install --cask telegram
brew install --cask slack
brew install --cask signal


brew install --cask alfred
brew install --cask the-unarchiver
brew install --cask cleanmymac
brew install --cask cakebrew
brew install --cask little-snitch
brew install --cask lulu


brew install --cask iina


brew install --cask visual-studio-code
brew install --cask pycharm
brew install --cask dataspell
brew install --cask textifier
brew install --cask mactex-no-gui
brew install --cask paw
brew install --cask tableplus
brew install --cask transmit
brew install --cask fork


brew install --cask docker
brew install docker
brew install minikube
brew install helm


brew install git
git config --global core.excludesfile ~/.gitignore_global
git config --global init.defaultBranch main
git config --global user.name "Arthur Meltonyan"
git config --global user.email arthur.meltonyan@gmail.com


brew install neovim
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
LV_BRANCH='release-1.2/neovim-0.8' 
curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/fc6873809934917b470bff1b072171879899a36b/utils/installer/install.sh





curl --proto "=https" --tlsv1.2 -sSf https://sh.rustup.rs | sh
echo "export PATH=\"$HOME/.cargo/bin:$PATH\"" >> ~/.zshenv


brew install pyenv
pyenv install 3.8.13
pyenv global 3.8.13
echo "export PATH=\"$HOME/.pyenv/bin:$PATH\"" >> ~/.zshenv
echo "eval \"$(pyenv init --path)\"" >> ~/.zlogin
echo "eval \"$(pyenv init -)\"" >> ~/.zlogin


pip3 install --user --upgrade pip
curl -sSL https://raw.githubusercontent.com/pdm-project/pdm/main/install-pdm.py | python3 -
echo "export PATH=\"$HOME/.local/bin:$PATH\"" >> ~/.zshenv
