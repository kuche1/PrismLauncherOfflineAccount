# PrismLauncherOfflineAccount

Applies a patch to the prism launcher that enables the use of offline accounts.

# Dependencies

## Debian Based Systems

`sudo apt install qt6-base-dev qtchooser qt6-base-dev-tools libqt6core6 libqt6core5compat6-dev libqt6network6 qt6-networkauth-dev` \
`sudo apt install cmake ninja-build extra-cmake-modules zlib1g-dev openjdk-17-jdk libgl1-mesa-dev scdoc`

## Arch Based Systems

You can check them here https://aur.archlinux.org/packages/prismlauncher-git \
`sudo pacman -S cmark gcc-libs glibc hicolor-icon-theme` \
`sudo pacman -S jdk17-openjdk` \
`sudo pacman -S libgl` \
`sudo pacman -S qt6-5compat qt6-base qt6-imageformats qt6-networkauth qt6-svg quazip-qt6 tomlplusplus` \
`sudo pacman -S zlib` \
`sudo pacman -S cmake extra-cmake-modules gamemode ghc-filesystem git scdoc` \
`sudo pacman -S glfw openal visualvm`

# Build

Just run `./build.sh`

# Credits

Based on https://github.com/PrismLauncher/PrismLauncher/compare/develop...Diegiwg:PrismLauncher-Cracked:develop
