#!/opt/homebrew/bin/nu --no-config-file
# Everything else: the remaining CLI tools (tor, mole) and GUI apps -> nushell: the PATH entries they bring.
# (cmux is in 03, Claude/nativ/Orca in 04, git tools + Fork in 05, OrbStack in 06, games in 09.)
# nushell does not run macOS path_helper, so /etc/paths.d (MacTeX, Little Snitch, ...) is added here.
# Writes: vendor/autoload/10-casks.nu
# One failure never stops the rest; exits 1 with the list at the end.

const BREW = "/opt/homebrew/bin/brew"

def --wrapped attempt [...cmd: string]: nothing -> bool {
    try { run-external ...$cmd; true } catch { false }
}

let auto = ($nu.default-config-dir | path join vendor autoload)
mkdir $auto

r##'# managed by 10-casks.nu -- rewritten on every run
# macOS path_helper equivalent: /etc/paths + /etc/paths.d/*
$env.PATH = (
    $env.PATH
    | append (
        [/etc/paths] ++ (glob /etc/paths.d/*)
        | each {|f| open --raw $f | lines | str trim | where {|l| $l != "" } }
        | flatten
    )
    | uniq
)
'## | save --force ($auto | path join 10-casks.nu)

let formulae = [tor mole]

let casks = [
    tor-browser transmission
    zoom swiftcord telegram slack signal
    taphouse maccy paste raycast superwhisper
    mole-app cleanmymac little-snitch
    keka pdf-expert
    notion notion-calendar notion-mail
    iina cleanshot clop screenkite
    codeedit texifier mactex-no-gui          # mactex-no-gui is ~4 GB
    tableplus dbx
    rapidapi transmit rcmd
]

# pkg installers (little-snitch, mactex) call sudo; keep the ticket alive for the whole run
^sudo -v
job spawn { loop { ^sudo -n true; sleep 50sec } } | ignore

mut failed = []

for f in $formulae {
    if not (attempt $BREW install --formula $f) { $failed ++= [$f] }
}

for c in $casks {
    if not (attempt $BREW install --cask $c) { $failed ++= [$c] }
}

if ($failed | is-not-empty) {
    print $"(ansi yellow)failed:(ansi reset) ($failed | str join ', ')"
    exit 1
}
