#!/opt/homebrew/bin/nu --no-config-file
# Rust -> nushell: brew's rustup (keg-only), the stable toolchain, and both bin dirs on PATH.
# Writes: vendor/autoload/07-rust.nu

const BREW = "/opt/homebrew/bin/brew"

def --wrapped attempt [...cmd: string]: nothing -> bool {
    try { run-external ...$cmd; true } catch { false }
}

let auto = ($nu.default-config-dir | path join vendor autoload)
mkdir $auto

r##'# managed by 07-rust.nu -- rewritten on every run
# rustup is keg-only: its rustup/rustc/cargo proxies live in the opt dir; installed tools in ~/.cargo/bin
$env.PATH = (
    $env.PATH
    | prepend ["/opt/homebrew/opt/rustup/bin" ($env.HOME | path join .cargo bin)]
    | uniq
)
'## | save --force ($auto | path join 07-rust.nu)

mut failed = []

if not (attempt $BREW install --formula rustup) { $failed ++= ["rustup"] }

let rustup = "/opt/homebrew/opt/rustup/bin/rustup"
if ($rustup | path exists) {
    if not (attempt $rustup show active-toolchain) {
        if not (attempt $rustup default stable) { $failed ++= ["rustup default stable"] }
    }
}

if ($failed | is-not-empty) {
    print $"(ansi yellow)failed:(ansi reset) ($failed | str join ', ')"
    exit 1
}
