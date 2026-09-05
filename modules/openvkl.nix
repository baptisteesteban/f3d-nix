{
  perSystem = {self', pkgs, ...}: {
    packages.openvkl = pkgs.stdenv.mkDerivation rec {
      pname = "openvkl";
      version = "2.0.2";

      src = pkgs.fetchurl {
        url = "https://github.com/RenderKit/openvkl/archive/refs/tags/v${version}.tar.gz";
        sha512 = "1qpjazh6mj7z68bsxm522ri3rgj8cgck7wyx9ikazbm381bj7lb2cxyc4qmd31kiail2v16zxkhj9disqbai61hnbmzkwbz3d8rq1mk";
      };

      nativeBuildInputs = with pkgs; [
        cmake
        ninja
        ispc
      ];

      buildInputs = [
        pkgs.onetbb
        self'.packages.embree
        self'.packages.rkcommon_1_15_2
      ];

      enableParallelBuilding = true;
    };
  };
}