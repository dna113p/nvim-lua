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
        # LSPs from lua/lsp.lua
        lua-language-server # luals
        nodePackages.typescript-language-server # vtsls
        nodePackages.vscode-json-languageserver # jsonls
        gopls # gopls
        vscode-langservers-extracted # cssls
        # cssvars is likely css-variables-language-server from npm
        nodePackages.css-variables-language-server
        ruff-lsp # ruff
        nodePackages.tailwindcss-language-server # tailwind-css
        nixd # nixd
        # openscad-lsp is not in nixpkgs. You may need to package it yourself.

        # Formatters & Linters from your plugins
        stylua
        nodePackages.prettier
        prettierd
        nodePackages.eslint_d
        go # for gofmt
        # Provides rust-analyzer (for LSP) and rustfmt (for formatting)
        (rust-bin.stable.latest.default.override { extensions = [ "rust-src" ]; })
      ];
    };
  };
}
