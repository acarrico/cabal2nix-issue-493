{ stdenv, hs-to-c, hs-to-c-export, ghc-from-c }:

stdenv.mkDerivation {
  pname = "hs-from-c";
  version = "0";
  src = ./.;
  buildInputs = [ hs-to-c hs-to-c-export ghc-from-c ];
}
