{
  perSystem = {
    self',
    pkgs,
    ...
  }: {
    packages.vtk = pkgs.stdenv.mkDerivation {
      pname = "vtk";
      version = "9.7.0";

      src = pkgs.fetchurl {
        url = "https://vtk.org/files/release/9.7/VTK-9.7.0.tar.gz";
        sha512 = "1qym0mgvzdz0si9bby3hkbsrfxj7x8dahcjyv7qf1z1kpkwm6c7z2siahzqgi6mw3388ia3gw80n22x01s7nyz6vwwwccwi8mv0l356";
      };

      nativeBuildInputs = with pkgs; [
        cmake
        ninja
      ];

      buildInputs = with pkgs; [
        onetbb
        libGL
        self'.packages.ospray
      ];

      enableParallelBuilding = true;

      cmakeFlags = [
        "-DVTK_ENABLE_WRAPPING=OFF"
        "-DVTK_SMP_IMPLEMENTATION_TYPE=TBB"
        "-DVTK_ENABLE_REMOTE_MODULES=OFF"
        "-DCMAKE_INSTALL_LIBDIR=lib"
        "-DCMAKE_INSTALL_BINDIR=bin"
        "-DCMAKE_INSTALL_INCLUDEDIR=include"
        "-DCMAKE_INSTALL_DATAROOTDIR=share"
      ];
    };
  };
}
