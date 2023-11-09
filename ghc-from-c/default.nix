{ stdenv, haskellPackages, lib }:

let ghc = haskellPackages.ghc; in

stdenv.mkDerivation {
  pname = "ghc-from-c";
  version = "0";
  src = ./.;
  installPhase = ''
    mkdir -p $out
    ln -s ${ghc}/lib/ghc-${ghc.version}/include $out/include
    ln -s ${ghc}/lib/ghc-${ghc.version}/rts/ $out/lib
'';

  meta = {
    description = "Support for compiling and linking C code which calls Haskell Code";
    longDescription = ''
      When compiling and linking C code which calls Haskell code, it
      is necessary to access C includes from the ghc package
      (HsFFI.h). When linking, it may also be necessary to access
      ghc's rts libraries (although this can be avoided by arranging
      for C code linked by ghc to call hs_init and hs_exit). This
      derivation adds support. To access these resources simply
      include this in the C code's stdenv derivation.

      In particular, this derivation causes the cc-wrapper setup-hook to
      notice ghc's include directory, adding it to NIX_CFLAGS_COMPILE, and
      the bintools-wrapper setup-hook to notice ghc's rts library
      directory, adding it to NIX_LDFLAGS.

      See nixpkgs/pkgs/build-support/bintools-wrapper/setup-hook.sh and
      nixpkgs/pkgs/build-support/cc-wrapper/setup-hook.sh for details on
      the mechanism.
'';
    license = lib.licenses.publicDomain;
    platforms = lib.platforms.all;
  };
}
