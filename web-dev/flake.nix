{
  description = "Ruby on Rails web development workshop";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { nixpkgs, ... }:
    let
      systems = [
        "x86_64-linux"
      ];
      forAllSystems = nixpkgs.lib.genAttrs systems;
    in
    {
      devShells = forAllSystems (system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
        in
        {
          default = pkgs.mkShell {
            packages = [pkgs.ruby_3_4 
                        pkgs.openssl_3_5];
            NIX_NO_SELF_RPATH = true;
            shellHook = ''
              sudo gem install neocities
              gem install neocities
              bundle init
              echo "gem 'neocities'" >> Gemfile
              bundle install
              bundle exec neocities
            '';
          };
        });
    };
}
