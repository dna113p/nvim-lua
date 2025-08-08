{
  description = "DJ's Neovim Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
  };

  outputs = { self, nixpkgs, neovim-nightly-overlay, ... }:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      overlays = [ neovim-nightly-overlay.overlays.default ];
    };
  in
  {
    homeManagerModules.default = { config, lib, inputs, ... }: {
      # This will symlink your neovim config to ~/.config/nvim
      # so you can edit it directly from your git checkout.
      xdg.configFile."nvim" = {
        source = self;
        recursive = true;
      };

      # This assumes your main flake passes 'inputs' to home-manager.
      programs.neovim = {
        enable = true;
        withNodeJs = true;
        withPython3 = true;
        package = neovim-nightly-overlay.packages.${system}.default;
      };

      # Packages for LSPs, formatters, and linters used in your config.
      home.packages = with pkgs; [
        cmake
        gcc

        # LSPs from lua/lsp.lua
        lua-language-server # luals
        typescript-language-server # vtsls
        gopls # gopls
        vscode-langservers-extracted # cssls
        ruff
        tailwindcss-language-server # tailwind-css
        nixd # nixd

        # Formatters & Linters from your plugins
        stylua
        prettier
        prettierd
        eslint
        eslint_d 
        go
      ];
    };
  };
}
