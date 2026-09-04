{
  perSystem = {pkgs, ...}: {
    packages.rkcommon = pkgs.stdenv.mkDerivation rec {
      pname = "rkcommon";
      version = "1.15.3";

      src = pkgs.fetchurl {
        url = "https://github.com/RenderKit/rkcommon/archive/refs/tags/v${version}.tar.gz";
        sha512 = "1jxqjcfaaf6pl8zvqpca223x43mv8cf6pm4rci83lcif42h3acc73padfjkavsnm4ir1lqwrbxvlj1i7vsgfck5lmgfd793k31md6sy";
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
