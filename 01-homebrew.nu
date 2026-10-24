#!/opt/homebrew/bin/nu --no-config-file
# Homebrew -> nushell. (bootstrap.sh installed brew itself.)
# Nushell never runs `brew shellenv`, so this puts brew on PATH and sets its variables.
# Writes: vendor/autoload/01-homebrew.nu

const BREW = "/opt/homebrew/bin/brew"

if not ($BREW | path exists) { error make {msg: "Homebrew missing -- run bootstrap.sh"} }

let auto = ($nu.default-config-dir | path join vendor autoload)
mkdir $auto

r##'# managed by 01-homebrew.nu -- rewritten on every run
load-env {
    HOMEBREW_PREFIX: "/opt/homebrew"
    HOMEBREW_CELLAR: "/opt/homebrew/Cellar"
    HOMEBREW_REPOSITORY: "/opt/homebrew"
}
$env.PATH = ($env.PATH | prepend ["/opt/homebrew/bin" "/opt/homebrew/sbin"] | uniq)
'## | save --force ($auto | path join 01-homebrew.nu)
