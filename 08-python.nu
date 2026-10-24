#!/opt/homebrew/bin/nu --no-config-file
# Python -> nushell: uv, and ~/.local/bin (where uv puts itself and the tools it installs) on PATH.
# Writes: vendor/autoload/08-python.nu

let auto = ($nu.default-config-dir | path join vendor autoload)
mkdir $auto

r##'# managed by 08-python.nu -- rewritten on every run
$env.PATH = ($env.PATH | prepend ($env.HOME | path join .local bin) | uniq)
'## | save --force ($auto | path join 08-python.nu)

# UV_NO_MODIFY_PATH: keep the installer off .zshrc/.profile; the autoload above covers it
if not ($env.HOME | path join .local bin uv | path exists) {
    try {
        with-env {UV_NO_MODIFY_PATH: "1"} { ^sh -c "curl -fsSL https://astral.sh/uv/install.sh | sh" }
    } catch {
        print $"(ansi yellow)failed:(ansi reset) uv"
        exit 1
    }
}
