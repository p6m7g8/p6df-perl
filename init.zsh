p6df::modules::perl::version() { echo "0.0.1" }
p6df::modules::perl::deps()    {
	ModuleDeps=(
		p6m7g8/p6perl
		tokuhirom/plenv
		tokuhirom/Perl-Build
	)
}

p6df::modules::perl::home::symlink() {

  mkdir -p $P6_DFZ_SRC_DIR/tokuhirom/plenv/plugins
  ln -fs $P6_DFZ_SRC_DIR/tokuhirom/Perl-Build $P6_DFZ_SRC_DIR/tokuhirom/plenv/plugins/perl-build
}

p6df::modules::perl::langs() {

  plenv install 5.30.2
  plenv global 5.30.2
  plenv rehash

  plenv install-cpanm
  plenv rehash

  cpanm --self-upgrade  

  cpanm --force Template \
        LWP::UserAgent \
        JSON \
        MIME::Lite \
        Text::Replace

  plenv rehash
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

  p6_lang_version "pl"
}
