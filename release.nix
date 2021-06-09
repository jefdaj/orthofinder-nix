let
  sources    = import ./nix/sources.nix {};
  pkgs       = import sources.nixpkgs   {};
  diamond    = pkgs.callPackage sources.diamond {};

  mcl        = pkgs.callPackage sources.mcl        {};
  fastme     = pkgs.callPackage sources.fastme     {};
  ncbi-blast = pkgs.callPackage sources.ncbi-blast {};

in pkgs.callPackage ./default.nix {
  inherit (pkgs.lib) makeBinPath;
  inherit mcl fastme ncbi-blast diamond;
}
