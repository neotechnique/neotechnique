{
  description = "Embedded development workshop";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    esp-idf = {
      url = "github:espressif/esp-idf/v5.5.2";
      flake = false;
    };
  };

  outputs =
    { nixpkgs, esp-idf, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        packages = with pkgs; [
          platformio
          cmake
          ninja
          git
          gnumake
          python3
          flex
          bison
          ccache
        ];

        ESP_IDF_PATH = esp-idf;

        shellHook = ''
          echo "ESP-IDF source: $ESP_IDF_PATH"
          echo "Use: idf.py build, or pio run"
        '';
      };
    };
}
