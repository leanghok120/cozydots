if status is-interactive
  set -Ux fish_greeting

  export GOROOT="/usr/local/go/"
  export GOPATH="$HOME/go"
  export PATH="$HOME/.tmuxifier/bin:$PATH"
  export PATH="$HOME/.cargo/bin:$PATH"
  export PATH="$PATH:$GOROOT/bin:$GOPATH/bin"
  export PATH="$HOME/.local/scripts:$PATH"
  export EDITOR='nvim'
  export MANPAGER="nvim +Man!"
end

# pnpm
set -gx PNPM_HOME "/home/leanghok/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

fish_add_path /home/leanghok/.spicetify
