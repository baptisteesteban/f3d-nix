{
  perSystem = {pkgs, ...}: {
    packages.embree = pkgs.stdenv.mkDerivation rec {
      pname = "embree";
      version = "4.4.1";

      nativeBuildInputs = with pkgs; [
        cmake
        ninja
        ispc
      ];

      buildInputs = with pkgs; [
        onetbb
        glfw3
      ];

      src = pkgs.fetchurl {
        url = "https://github.com/RenderKit/embree/archive/refs/tags/v${version}.tar.gz";
        sha512 = "1x8kmicbhs3vsdg4zcrvlk380wz0r6fwzmh1wkbx8f7k1mdixfkb6666fmy7zliaysfsc7skmv59w0l3s1iqhky106mz7iydghxc02p";
      };

      cmakeFlags = [
        "-DEMBREE_ISPC_SUPPORT=ON"
      ];

      enableParallelBuilding = true;
    };
  };
}