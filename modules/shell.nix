{
  perSystem = {pkgs, ...}: {
    devShells.default = pkgs.mkShell {
      packages = with pkgs; [
        cmake
        pkg-config
        vtk_9_6
        libxcb.dev
        libxcursor
      ];
    };
  };
}
