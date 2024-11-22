brew install gcc
brew install cmake
brew install libomp
brew install open-mpi
brew install openblas
brew install lapack
brew install zlib
brew install bzip2
brew install node

git config --global core.excludesfile ~/.gitignore_global
git config --global init.defaultBranch main
git config --global user.name "Arthur Meltonyan"
git config --global user.email arthur.meltonyan@gmail.com


brew install neovim
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.3/neovim-0.9/utils/installer/install.sh
pyenv install 3.10
pyenv global 3.10
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(pyenv init -)"' >> ~/.zshrc


pip3 install --user --upgrade pip
curl -sSL https://install.python-poetry.org | python3 -
