{
  perSystem = {pkgs, ...}: let
    mkRkcommon = {version, sha512}: pkgs.stdenv.mkDerivation {
      pname = "rkcommon";
      inherit version;

      src = pkgs.fetchurl {
        url = "https://github.com/RenderKit/rkcommon/archive/refs/tags/v${version}.tar.gz";
        sha512 = sha512;
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
  in
  {
    packages.rkcommon_1_14_0 = mkRkcommon { version = "1.14.0"; sha512 = "1hfajb3bhvx742x4w3zbawwcyf5a3i6m07ys9smy1znd1smvbx346yiz7fa08rwlplz74mp9pca9hmkswcmfa9740nh8f9sk7v1zq4r"; };
    packages.rkcommon_1_15_2 = mkRkcommon { version = "1.15.2"; sha512 = "0lmkii9px8p71kdc7qnwj4vm65rwii7s32db5645imm3saavw2l4raal5zas338dhmhyfxh1x3mvk42bg8fwlm84z2fw0y1rvyr4h4k"; };
  };
}
