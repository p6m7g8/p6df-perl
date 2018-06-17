p6df::modules::perl::version() { echo "0.0.1" }
p6df::modules::perl::deps()    {
	ModuleDeps=(
		p6m7g8/p6perl
	)
}

p6df::modules::perl::external::brew() {
}

p6df::modules::perl::init() {

    p6df::modules::perl::plenv::init "$P6_DFZ_SRC_DIR"
}

p6df::modules::perl::plenv::init() {
    local dir="$1"

    [ -n "$DISABLE_ENVS" ] && return

    PLENV_ROOT=$dir/tokuhirom/plenv

    if [ -x $PLENV_ROOT/bin/plenv ]; then
      export PLENV_ROOT
      export HAS_PLENV=1

      p6df::util::path_if $PLENV_ROOT/bin
      eval "$(plenv init - zsh)"
    fi
}

p6df::prompt::perl::line() {

  env_version "pl"
}
