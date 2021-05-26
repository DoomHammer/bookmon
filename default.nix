{ pkgs ? import (
  builtins.fetchTarball {
    url = "https://github.com/nixos/nixpkgs/archive/release-20.09.tar.gz";
    sha256 = "0p7df7yzi35kblxr5ks0rxxp9cfh269g88xpj60sdhdjvfnn6cp7";
  }
) {} }:

with pkgs;

mkShell {
  buildInputs = [
    chromium
    nodejs
  ];
  shellHook = ''
    ln -sf $(which chromium) node_modules/puppeteer/.local-chromium/linux-*/chrome-linux/chrome
  '';
}
