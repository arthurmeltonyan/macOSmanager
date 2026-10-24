#!/opt/homebrew/bin/nu --no-config-file
# Git tooling -> nushell: identity, global gitignore, gh (GitHub CLI), GitButler (`but`) on PATH,
# and the Fork git client.
# gh matters more with AI agents, not less: Claude Code and friends use it for PRs, issues and CI.
# Writes: vendor/autoload/05-git.nu
# One failure never stops the rest; exits 1 with the list at the end.

const BREW = "/opt/homebrew/bin/brew"

def --wrapped attempt [...cmd: string]: nothing -> bool {
    try { run-external ...$cmd; true } catch { false }
}

^git config --global core.excludesfile ~/.gitignore_global
^git config --global init.defaultBranch master
^git config --global user.name "Arthur Meltonyan"
^git config --global user.email arthur.meltonyan@gmail.com

let gi = ($env.HOME | path join .gitignore_global)
if not ($gi | path exists) {
    [.DS_Store "._*" .AppleDouble .LSOverride "*.swp"] | str join (char nl) | $in + (char nl) | save $gi
}

let auto = ($nu.default-config-dir | path join vendor autoload)
mkdir $auto

r##'# managed by 05-git.nu -- rewritten on every run
# GitButler's installer drops `but` in ~/.local/bin (gh lives in /opt/homebrew/bin, already on PATH)
$env.PATH = ($env.PATH | prepend ($env.HOME | path join .local bin) | uniq)
'## | save --force ($auto | path join 05-git.nu)

mut failed = []

if not (attempt $BREW install --formula gh) { $failed ++= ["gh"] }
if not (attempt $BREW install --cask fork) { $failed ++= ["fork"] }

if not ($env.HOME | path join .local bin but | path exists) {
    if not (attempt sh -c "curl -fsSL https://gitbutler.com/install.sh | sh") { $failed ++= ["gitbutler"] }
}

if ($failed | is-not-empty) {
    print $"(ansi yellow)failed:(ansi reset) ($failed | str join ', ')"
    exit 1
}
