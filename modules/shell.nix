{
  perSystem = {
    self',
    pkgs,
    ...
  }: {
    devShells.default = pkgs.mkShell {
      inputsFrom = [self'.packages.f3d];

      shellHook = with pkgs; ''
        export LD_LIBRARY_PATH=${lib.makeLibraryPath [
          libGL
          libGLU
        ]}:$LD_LIBRARY_PATH
      '';
    };
  };
}
