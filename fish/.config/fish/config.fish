set -Ux fish_greeting

export GOROOT="/usr/local/go/"
export GOPATH="$HOME/go"
export PATH="$HOME/.tmuxifier/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$PATH:$GOROOT/bin:$GOPATH/bin"
export PATH="$HOME/.local/scripts:$PATH"
export EDITOR='nvim'
export MANPAGER="nvim +Man!"

# pnpm
set -gx PNPM_HOME "/home/leanghok/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end

fish_add_path /home/leanghok/.spicetify

zoxide init fish --cmd cd | source

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
