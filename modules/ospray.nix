{
  perSystem = {self', pkgs, ...}: {
    packages.ospray = pkgs.stdenv.mkDerivation rec {
      name = "OSPRay";
      version = "3.2.0";

      src = pkgs.fetchurl {
        url = "https://github.com/RenderKit/ospray/archive/refs/tags/v${version}.tar.gz";
        sha512 = "15317ivhjwv70w2j3hxhzzwh1jn2r21k8mvjqr2y3714sd50sb7kk15b2wnxbkx8k70iz742ylfcw30wvq4i6qdx6rd7aai8f4gypfg";
      };

      nativeBuildInputs = with pkgs; [
        cmake
        ninja
        ispc
      ];

      buildInputs = with pkgs; [
        onetbb
        openimagedenoise
        self'.packages.rkcommon_1_14_0
        self'.packages.embree
        self'.packages.openvkl
      ];

      enableParallelBuilding = true;

      cmakeFlags = [
        "-DBUILD_TBB_FROM_SOURCE=OFF"
        "-DBUILD_EMBREE_FROM_SOURCE=OFF"
        "-DOSPRAY_ENABLE_APPS=OFF"
      ];
    };
  };
}
