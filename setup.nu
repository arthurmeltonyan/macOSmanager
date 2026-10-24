#!/opt/homebrew/bin/nu --no-config-file
# Started by bootstrap.sh. Sets up nushell itself, runs the numbered tool scripts, then verifies.
#
#   1. nushell: config.nu (written once), quiet login, nu as the login shell for every terminal app
#   2. 01..10: one script per tool; each installs its tool AND wires it into nushell by
#      writing its own  <nushell config dir>/vendor/autoload/NN-tool.nu
#   3. a login nu must see everything
#
# 01-02 are the shell stack: a failure there stops the run. 03+ are recorded and the run continues.
# Every numbered script also works alone:  ./10-casks.nu

const NU = "/opt/homebrew/bin/nu"

def say [msg: string] { print $"\n(ansi blue)==>(ansi reset) (ansi attr_bold)($msg)(ansi reset)" }

# ── 1. nushell itself ────────────────────────────────────────────────────────────────────
say "nushell"
let cfg = $nu.default-config-dir
mkdir $cfg
touch ($env.HOME | path join .hushlogin)   # silence "Last login"

let config_nu = ($cfg | path join config.nu)
let owned = ($config_nu | path exists) and (open --raw $config_nu | str contains "managed-by: mac-setup")
if not $owned {
    if ($config_nu | path exists) { cp $config_nu $"($config_nu).bak.(date now | format date '%s')" }
    r##'# managed-by: mac-setup (written once; edit freely, it will not be touched again)
$env.config.show_banner = false
$env.config.buffer_editor = "nano"
$env.EDITOR = "nano"
'## | save --force $config_nu
}

# login shell: Terminal.app / iTerm2 / Warp / Ghostty / VS Code / Cursor all follow it
^sudo -v
if not (open /etc/shells | lines | any {|l| $l == $NU }) {
    $"($NU)\n" | ^sudo tee -a /etc/shells | ignore
}
let current = (^dscl . -read $"/Users/($env.USER)" UserShell | str replace "UserShell:" "" | str trim)
if $current != $NU { ^sudo chsh -s $NU $env.USER }

# ── 2. the tool scripts ──────────────────────────────────────────────────────────────────
let scripts = (glob ($env.FILE_PWD | path join "[0-9][0-9]-*.nu") | sort)
mut soft_failed = []

for s in $scripts {
    let name = ($s | path basename)
    say $name
    let ok = (try { ^$nu.current-exe --no-config-file $s; true } catch { false })
    if not $ok {
        if ($name =~ '^0[1-2]-') {
            print $"(ansi red)($name) failed -- stopping(ansi reset)"
            exit 1
        }
        $soft_failed ++= [$name]
    }
}

# ── 3. verify from a login nu ────────────────────────────────────────────────────────────
# Same start as a terminal: login + interactive (-e), because only an interactive nu loads
# vendor/autoload (plain `nu -c` does not). PATH is scrubbed to the macOS default so brew
# can only come from 01-homebrew.nu, exactly like a GUI-launched terminal.
say "verify (login nu)"
let probe = 'let want = [brew starship git gh cmux docker minikube orbctl cargo rustup uv but]
    let found = (which ...$want | get command)
    for w in $want { print $"  (if $w in $found { "ok     " } else { "missing" }) ($w)" }
    print $"  starship prompt loaded: (($env.STARSHIP_SHELL? | default "no") == "nu")"
    let lost = (["brew" "starship"] | where {|m| $m not-in $found })
    exit (if ($lost | is-empty) { 0 } else { 1 })'
with-env {PATH: ["/usr/bin" "/bin" "/usr/sbin" "/sbin"]} { "" | ^$NU --login -e $probe }

say "done"
if ($soft_failed | is-empty) {
    print "everything installed"
} else {
    print $"(ansi yellow)scripts with failures, details above:(ansi reset) ($soft_failed | str join ', ')"
}
print "
Next:
  1. Quit and reopen every terminal (Terminal.app, cmux, ...) -- they start in nu with starship.
  2. Terminal.app font: Settings > Profiles > Text > \"FiraCode Nerd Font Mono\" (cmux gets it from ~/.config/ghostty/config).
  3. gh auth login
  4. Bourbon 26 has no brew cask: buy/download by hand at https://mikethetech.itch.io/bourbon26
  After a nushell or starship upgrade, re-run ./02-starship.nu."
