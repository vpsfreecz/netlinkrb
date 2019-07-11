let
  pkgs = import <nixpkgs> {};
  stdenv = pkgs.stdenv;

in stdenv.mkDerivation rec {  
  name = "netlinkrb";
  
  buildInputs = with pkgs; [
    gcc
    git
    gnumake
    ruby
  ];

  shellHook = ''
    export GEM_HOME="$(pwd)/.gems"
    export PATH="$(ruby -e 'puts Gem.bindir'):$PATH"
    export RUBYLIB="$GEM_HOME"
    gem install --no-ri bundler geminabox md2man rake yard
  '';
}
