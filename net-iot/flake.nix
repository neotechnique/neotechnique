{
  description = "OpenWrt and LibreMesh networking/IoT workshop";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    openwrt = {
      url = "github:openwrt/openwrt/v24.10.0";
      flake = false;
    };
    libremesh = {
      url = "github:libremesh/lime-packages";
      flake = false;
    };
  };

  outputs =
    { nixpkgs, openwrt, libremesh, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        packages = with pkgs; [
          bash
          binutils
          bzip2
          ccache
          diffutils
          file
          findutils
          flex
          gawk
          gcc
          gettext
          git
          gnumake
          gnutar
          gzip
          ncurses
          patch
          perl
          pkg-config
          python3
          rsync
          unzip
          wget
          which
          zlib
        ];

        OPENWRT_SRC = openwrt;
        LIBREMESH_SRC = libremesh;

        shellHook = ''
          echo "OpenWrt source: $OPENWRT_SRC"
          echo "LibreMesh packages: $LIBREMESH_SRC"
          echo "Copy sources to a writable directory before building."
        '';
      };
    };
}
