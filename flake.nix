{
  description = "";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/26.05";
    flake-parts.url = "github:hercules-ci/flake-parts";
    import-tree.url = "github:denful/import-tree";
  };

  outputs = {
    flake-parts,
    import-tree,
    ...
  } @ inputs:
    flake-parts.lib.mkFlake {inherit inputs;} (import-tree ./modules);
}
