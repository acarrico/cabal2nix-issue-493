{ stdenv, ghc, package}:

stdenv.mkDerivation {
  pname = package.pname + "-export";
  version = package.version;
  src = ./.;
  installPhase = ''
    mkdir -p $out
    ln -s $(find ${package} -name include) $out/include
    ln -s ${package}/lib/ghc-${ghc.version} $out/lib
'';
}
