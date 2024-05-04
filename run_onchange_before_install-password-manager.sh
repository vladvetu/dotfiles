#! /usr/bin/env bash
# Variables
BW_VERSION="2024.3.1"

# Check if the script is being run as root
if [ "$EUID" -eq 0 ]; then
  echo "BOOTSTRAP[ERROR]: Please don't run as root"
  exit
fi
# This script will install the Bitwarden CLI

install_bitwarden() {
  local version=$1
  echo "BOOTSTRAP[BITWARDEN][INFO]: Installing version $version"
  curl -sSL https://github.com/bitwarden/clients/releases/download/cli-v$version/bw-linux-$version.zip -o /tmp/bw-linux-$version.zip
  unzip /tmp/bw-linux-$version.zip -d $HOME/.local/bin/
  rm /tmp/bw-linux-$version.zip
}

echo "BOOTSTRAP[BITWARDEN][INFO]: Checking if Bitwarden CLI is installed"
if [ -f $HOME/.local/bin/bw ]; then
  bw_version_this=$(bw --version)
  echo "BOOTSTRAP[BITWARDEN][INFO]: Bitwarden CLI is already installed"
  echo "BOOTSTRAP[BITWARDEN][INFO]: Checking if Bitwarden CLI needs to be updated"
  if [ "$bw_version_this" != "$BW_VERSION" ]; then
    echo "BOOTSTRAP[BITWARDEN][INFO]: Updating Bitwarden CLI"
    install_bitwarden "$BW_VERSION"
  else
    echo "BOOTSTRAP[BITWARDEN][INFO]: Bitwarden CLI has the desired version: $BW_VERSION"
  fi
else
  echo "BOOTSTRAP[BITWARDEN][INFO]: Bitwarden CLI is not installed."
  install_bitwarden "$BW_VERSION"
fi
