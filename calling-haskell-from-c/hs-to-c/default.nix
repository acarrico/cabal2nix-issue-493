{ mkDerivation, stdenv }:

mkDerivation rec {
  pname = "hs-to-c";
  version = "0";
  src = ./.;
  isLibrary = false;
  isExecutable = false;
  license = stdenv.lib.licenses.publicDomain;
}
