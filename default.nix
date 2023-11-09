self: super:
{
  haskellPackages = super.haskellPackages.override (oldArgs: {
    overrides = self.lib.composeExtensions (oldArgs.overrides or (_: _: {}))
      (hself: hsuper: {
        #ghc = hsuper.ghc // { withPackages = hsuper.ghc.withHoogle; };
        #ghcWithPackages = hself.ghc.withHoogle;
        hs-to-c = hself.callPackage calling-haskell-from-c/hs-to-c/default.nix {};
      });
  });
  ghc-from-c = self.callPackage ghc-from-c/default.nix {};
  hs-to-c-export = self.callPackage calling-haskell-from-c/hs-to-c/export.nix {
    package = self.haskellPackages.hs-to-c;
    ghc= self.haskellPackages.ghc;
  };
  hs-to-c = self.haskellPackages.hs-to-c;
  hs-from-c = self.callPackage calling-haskell-from-c/hs-from-c/default.nix {};
}
