if status is-interactive
    # Commands to run in interactive sessions can go here
end
fish_add_path /opt/homebrew/bin
fish_add_path /opt/homebrew/opt/mysql@5.7/bin

set -gx LDFLAGS "-L/opt/homebrew/opt/mysql@5.7/lib"
set -gx CPPFLAGS "-I/opt/homebrew/opt/mysql@5.7/include"
set -gx PKG_CONFIG_PATH "/opt/homebrew/opt/mysql@5.7/lib/pkgconfig"

rbenv init - | source
zoxide init fish | source