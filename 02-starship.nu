#!/opt/homebrew/bin/nu --no-config-file
# Starship -> nushell: install starship + the Nerd Font, generate the prompt init.
# Writes: vendor/autoload/02-starship.nu   (re-run this script after a nushell/starship upgrade)

const BREW = "/opt/homebrew/bin/brew"
const STARSHIP = "/opt/homebrew/bin/starship"

^$BREW install --formula starship          # critical: aborts on failure
try { ^$BREW install --cask font-fira-code-nerd-font } catch { print "warning: Nerd Font install failed" }

let auto = ($nu.default-config-dir | path join vendor autoload)
mkdir $auto

# the old one-liner setup wrote the same init to starship.nu; two inits would load twice
rm --force ($auto | path join starship.nu)

^$STARSHIP init nu | save --force ($auto | path join 02-starship.nu)
