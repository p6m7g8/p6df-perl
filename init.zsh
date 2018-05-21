p6df::modules::perl::version() { echo "0.0.1" }
p6df::modules::perl::deps()    { 
	ModuleDeps=(
	)
}

p6df::modules::perl::external::brew() {
}

p6df::modules::perl::init() {

  p6df::modules::perl::plenv::init
}

p6df::modules::perl::plenv::init() {
    [ -n "$DISABLE_ENVS" ] && return

    export PLENV_ROOT=/Users/pgollucci/.local/share/tokuhirom/plenv
    p6dfz::util::path_if $PLENV_ROOT/bin

    if [ -x $PLENV_ROOT/bin/plenv ]; then
      export HAS_PLENV=1
      eval "$(plenv init - zsh)"
    fi
}

p6df::prompt::perl::line() {

  env_version "pl"
}

p6df::modules::perl::init
