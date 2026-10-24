#!/opt/homebrew/bin/nu --no-config-file
# cmux (Ghostty-based terminal) -> nushell: install cmux, then pin nu + the font in the
# ~/.config/ghostty/config it reads, and tell nu to emit the cwd / prompt-mark escape codes
# cmux uses for splits and tabs.
# Writes: ~/.config/ghostty/config (its own marked block only), vendor/autoload/03-cmux.nu

const BREW = "/opt/homebrew/bin/brew"
const NU = "/opt/homebrew/bin/nu"

# a failed install must not skip the config below; it is reported at the end instead
let installed = (try { ^$BREW install --cask cmux; true } catch { false })

let ghostty = ($env.HOME | path join .config ghostty config)
mkdir ($ghostty | path dirname)

let kept = if ($ghostty | path exists) {
    open --raw $ghostty | str replace --regex '(?s)# >>> mac-setup >>>.*?# <<< mac-setup <<<\n?' ''
} else { "" }

$"($kept)# >>> mac-setup >>>\ncommand = ($NU) --login\nfont-family = FiraCode Nerd Font Mono\n# <<< mac-setup <<<\n"
    | save --force $ghostty

let auto = ($nu.default-config-dir | path join vendor autoload)
mkdir $auto

r##'# managed by 03-cmux.nu -- rewritten on every run
# OSC 7 (current directory) and OSC 133 (prompt marks); nushell's defaults, pinned on purpose
$env.config.shell_integration.osc7 = true
$env.config.shell_integration.osc133 = true
'## | save --force ($auto | path join 03-cmux.nu)

if not $installed {
    print $"(ansi yellow)failed:(ansi reset) cmux"
    exit 1
}
