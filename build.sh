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

		git clone --recursive https://github.com/PrismLauncher/PrismLauncher.git

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

