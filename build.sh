#! /usr/bin/env bash

{
	set -euo pipefail

	ME=$(realpath -- "$BASH_SOURCE")
	HERE=$(dirname -- "$ME")

	BUILD_DIR="$HERE/build"

	LOW_PRIORITY='nice -n 19'

	function main(){
		rm -rf "$BUILD_DIR"
		mkdir "$BUILD_DIR"

		cd "$BUILD_DIR"

		{
			# # last tested 2025.04.08: commit 734db2bedcb9ebd12667031e423d16fd1118a39f
			# echo 'Cloning latest development branch'
			# git clone --recursive https://github.com/PrismLauncher/PrismLauncher.git

			# last tested 2025.04.11: commit 385bb500b9195765a6e6fb5c81855b24eb48bf91
			echo 'Cloning 9.x branch...'
			git clone --recursive -b release-9.x https://github.com/PrismLauncher/PrismLauncher.git
		}

		cd PrismLauncher

		echo 'Applying patches...'
		git apply "$HERE"/patches/???-*

		git add .
		# not needed but it makes it easier for me to add new patches

		echo 'Building...'
		$LOW_PRIORITY cmake -S . -B build -G Ninja -DCMAKE_INSTALL_PREFIX=install
		$LOW_PRIORITY cmake --build build
		$LOW_PRIORITY cmake --install build
		$LOW_PRIORITY cmake --install build --component portable

		echo
		echo "Portable launcher located at: $(pwd)/install"
		echo 'Feel free to rename and move the folder; all data will be contained within'
	}

	main
}
