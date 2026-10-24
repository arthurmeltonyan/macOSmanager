#!/opt/homebrew/bin/nu --no-config-file
# Containers -> nushell: docker CLI, docker-agent (Docker's agent builder/runtime), minikube, OrbStack (the engine/VM), and OrbStack's bin dir on PATH.
# OrbStack's cask links orb/orbctl into /opt/homebrew/bin; it sets up its own docker context
# the first time you open the app.
# Writes: vendor/autoload/06-docker.nu
# One failure never stops the rest; exits 1 with the list at the end.

const BREW = "/opt/homebrew/bin/brew"

def --wrapped attempt [...cmd: string]: nothing -> bool {
    try { run-external ...$cmd; true } catch { false }
}

let auto = ($nu.default-config-dir | path join vendor autoload)
mkdir $auto

r##'# managed by 06-docker.nu -- rewritten on every run
$env.PATH = ($env.PATH | prepend ($env.HOME | path join .orbstack bin) | uniq)
'## | save --force ($auto | path join 06-docker.nu)

mut failed = []

for f in [docker docker-agent minikube] {
    if not (attempt $BREW install --formula $f) { $failed ++= [$f] }
}
if not (attempt $BREW install --cask orbstack) { $failed ++= ["orbstack"] }

if ($failed | is-not-empty) {
    print $"(ansi yellow)failed:(ansi reset) ($failed | str join ', ')"
    exit 1
}
