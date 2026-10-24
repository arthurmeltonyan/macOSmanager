#!/opt/homebrew/bin/nu --no-config-file
# Windows games on Apple Silicon: Rosetta 2 + the Wine front-ends (Highball, Whisky fork, Sikarugir).
# They are GUI apps, so there is nothing to wire into nushell.
# Bourbon 26 (pyrosoft.pro) has no cask: manual itch.io purchase.
# One failure never stops the rest; exits 1 with the list at the end.

const BREW = "/opt/homebrew/bin/brew"

def --wrapped attempt [...cmd: string]: nothing -> bool {
    try { run-external ...$cmd; true } catch { false }
}

let taps = ["Sikarugir-App/sikarugir" "frankea/whisky"]
let casks = [highball frankea/whisky/whisky Sikarugir-App/sikarugir/sikarugir]

mut failed = []

# Wine runs x86 code: Apple Silicon needs Rosetta 2
^sudo -v
if not (attempt arch -x86_64 /usr/bin/true) {
    print "installing Rosetta 2"
    if not (attempt sudo softwareupdate --install-rosetta --agree-to-license) { $failed ++= ["rosetta"] }
}

for t in $taps {
    if not (attempt $BREW tap $t) { $failed ++= [$"tap ($t)"] }
    # Homebrew 7 refuses third-party taps until trusted
    if not (attempt $BREW trust --tap $t) { $failed ++= [$"trust ($t)"] }
}

for c in $casks {
    if not (attempt $BREW install --cask $c) { $failed ++= [$c] }
}

if ($failed | is-not-empty) {
    print $"(ansi yellow)failed:(ansi reset) ($failed | str join ', ')"
    exit 1
}
