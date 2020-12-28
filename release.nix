let
  sources    = import ./nix/sources.nix {};
  pkgs       = import sources.nixpkgs   {};
  diamond    = pkgs.callPackage sources.diamond {};

  mcl        = pkgs.callPackage ../mcl-nix        {}; # TODO upload repo and import via niv
  fastme     = pkgs.callPackage ../fastme-nix     {}; # TODO upload repo and import via niv
  ncbi-blast = pkgs.callPackage ../ncbi-blast-nix {}; # TODO upload repo and import via niv

in pkgs.callPackage ./default.nix {
  inherit (pkgs.lib) makeBinPath;
  inherit mcl fastme ncbi-blast diamond;
}
