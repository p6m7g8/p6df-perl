p6df::modules::perl::version() { echo "0.0.1" }
p6df::modules::perl::deps()    {
	ModuleDeps=(
	)
}

p6df::modules::perl::external::brew() {
}

p6df::modules::perl::init() {

#  p6df::modules::perl::plenv::init
}

p6df::modules::perl::plenv::init() {
    [ -n "$DISABLE_ENVS" ] && return

    PLENV_ROOT=/Users/pgollucci/.local/share/tokuhirom/plenv

    if [ -x $PLENV_ROOT/bin/plenv ]; then
      export PLENV_ROOT
      export HAS_PLENV=1

      p6dfz::util::path_if $PLENV_ROOT/bin
      eval "$(plenv init - zsh)"
    fi
}

p6df::prompt::perl::line() {

  env_version "pl"
}

p6df::modules::perl::init
