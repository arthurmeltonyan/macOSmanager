git config --global core.excludesfile ~/.gitignore_global
git config --global init.defaultBranch main
git config --global user.name "Arthur Meltonyan"
git config --global user.email arthur.meltonyan@gmail.com


pyenv install 3.10
pyenv global 3.10
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(pyenv init -)"' >> ~/.zshrc


pip3 install --user --upgrade pip
curl -sSL https://install.python-poetry.org | python3 -
