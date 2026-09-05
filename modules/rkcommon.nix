{
  perSystem = {pkgs, ...}: {
    packages.rkcommon = pkgs.stdenv.mkDerivation rec {
      pname = "rkcommon";
      version = "1.14.0";

      src = pkgs.fetchurl {
        url = "https://github.com/RenderKit/rkcommon/archive/refs/tags/v${version}.tar.gz";
        sha512 = "1hfajb3bhvx742x4w3zbawwcyf5a3i6m07ys9smy1znd1smvbx346yiz7fa08rwlplz74mp9pca9hmkswcmfa9740nh8f9sk7v1zq4r";
      };

      nativeBuildInputs = with pkgs; [
        cmake
        ninja
      ];

      buildInputs = with pkgs; [
        onetbb
      ];

      enableParallelBuilding = true;

      cmakeFlags = [
        "-DCMAKE_INSTALL_PREFIX=${placeholder "out"}"
      ];
    };
  };
}
