{
  perSystem = {
    self',
    pkgs,
    ...
  }: {
    packages.f3d = pkgs.stdenv.mkDerivation rec {
      pname = "f3d";
      version = "3.5.0";
      src = pkgs.fetchurl {
        url = "https://github.com/f3d-app/f3d/archive/refs/tags/v${version}.tar.gz";
        sha512 = "2gdfm56ncj1s7pghlx0l41v3v4p6jzqxb35bib16ams8zcf58dn8f0xy2c97iqi8znaiqnw0k7fpmnv8qpmaf6j69qghji9z2pjnc6s";
      };

      nativeBuildInputs = with pkgs;
        [
          cmake
          ninja
          pkg-config
        ]
        # From here: https://github.com/NixOS/nixpkgs/blob/b35ad39a6a1c37704da808c7e14df7c113c872f5/pkgs/by-name/f3/f3d/package.nix
        ++ lib.optionals pkgs.stdenv.hostPlatform.isElf [
          # https://github.com/f3d-app/f3d/pull/1217
          autoPatchelfHook
        ];

      buildInputs = with pkgs; [
        onetbb # TODO: move in propagatedBuildInputs of vtk
        libx11 # TODO: move in propagatedBuildInputs of vtk
        libGL
        libGLU
        libXcursor
        xcbutil
        libxcb
        self'.packages.vtk
      ];

      enableParallelBuilding = true;

      cmakeFlags = [
        "-DCMAKE_INSTALL_PREFIX=${placeholder "out"}"
        "-DCMAKE_INSTALL_LIBDIR=lib"
        "-DCMAKE_INSTALL_BINDIR=bin"
        "-DCMAKE_INSTALL_INCLUDEDIR=include"
        "-DCMAKE_BUILD_TYPE=Release"
      ];
    };

    apps.f3d = {
      type = "app";
      program = "${self'.packages.f3d}/bin/f3d";
      meta.description = "Fast and minimalist 3D viewer.";
    };
  };
}
