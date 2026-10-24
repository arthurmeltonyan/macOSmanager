#!/bin/zsh
# The only zsh in the whole setup: get Homebrew + nushell, then hand over to setup.nu.
#   zsh bootstrap.sh
set -e
BREW=/opt/homebrew/bin/brew

[[ -x $BREW ]] || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
$BREW install --formula nushell

# --no-config-file: setup.nu must not depend on whatever config.nu exists right now
exec /opt/homebrew/bin/nu --no-config-file "${0:A:h}/setup.nu"
