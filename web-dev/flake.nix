{
  description = "Ruby on Rails web development workshop";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs =
    { nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        packages = with pkgs; [
          ruby
          rubyPackages.rails
          bundler
          openssl
          pkg-config
          gcc
          gnumake
          git
        ];

        OPENSSL_DIR = pkgs.openssl.dev;

        shellHook = ''
          echo "Ruby $(ruby --version)"
          echo "Use: bundle install && bin/rails server"
        '';
      };
    };
}
