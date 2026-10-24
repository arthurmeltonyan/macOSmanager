#!/opt/homebrew/bin/nu --no-config-file
# AI agents & local models: the Claude desktop app, nativ (run AI models locally) and Orca
# (onorca.dev: run Claude Code, Codex & co. in parallel, each in its own git worktree).
# GUI apps, so nothing to wire into nushell. (docker-agent is in 06-docker.nu, gh in 05-git.nu.)
# Orca lives in its own tap, so the tap is added and trusted first.
# One failure never stops the rest; exits 1 with the list at the end.

const BREW = "/opt/homebrew/bin/brew"

def --wrapped attempt [...cmd: string]: nothing -> bool {
    try { run-external ...$cmd; true } catch { false }
}

mut failed = []

if not (attempt $BREW tap stablyai/orca) { $failed ++= ["tap stablyai/orca"] }
# Homebrew 7 refuses third-party taps until trusted
if not (attempt $BREW trust --tap stablyai/orca) { $failed ++= ["trust stablyai/orca"] }

for c in [claude nativ stablyai/orca/orca] {
    if not (attempt $BREW install --cask $c) { $failed ++= [$c] }
}

if ($failed | is-not-empty) {
    print $"(ansi yellow)failed:(ansi reset) ($failed | str join ', ')"
    exit 1
}
