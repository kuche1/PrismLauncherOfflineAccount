#! /usr/bin/env bash

{
	set -euo pipefail

	ME=$(realpath -- "$BASH_SOURCE")
	HERE=$(dirname -- "$ME")

	BUILD_DIR="$HERE/build"

	function main(){
		rm -rf "$BUILD_DIR"
		mkdir "$BUILD_DIR"

		cd "$BUILD_DIR"

		{
			# latest development branch
			# last tested 2025.04.08: commit 734db2bedcb9ebd12667031e423d16fd1118a39f
			#git clone --recursive https://github.com/PrismLauncher/PrismLauncher.git

			# 9.x
			# last tested 2025.04.11: commit 385bb500b9195765a6e6fb5c81855b24eb48bf91
			git clone --recursive -b release-9.x https://github.com/PrismLauncher/PrismLauncher.git
		}

		cd PrismLauncher

		git apply "$HERE"/patches/*

		cmake -S . -B build -G Ninja -DCMAKE_INSTALL_PREFIX=install
		cmake --build build
		cmake --install build
		cmake --install build --component portable

		echo
		echo "Portable launcher located at: $(pwd)/install"
		echo 'Feel free to rename and move the folder; all data will be contained within'
	}

	main
}

