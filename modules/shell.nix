{
  perSystem = {pkgs, ...}: {
    devShells.default = pkgs.mkShell {
      nativeBuildInputs = with pkgs; [
        cmake
        pkg-config
      ];

      buildInputs = with pkgs; [
        vtk

        libGL
        libGLU
        libXcursor
        xcbutil
        libxcb

        ninja
        git
      ];

      shellHook = with pkgs; ''
        export LD_LIBRARY_PATH=${lib.makeLibraryPath [
          libGL
          libGLU
        ]}:$LD_LIBRARY_PATH
      '';
    };
  };
}
