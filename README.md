# tic80_export.sh

A bash script that should help you with TIC-80 exports. This is intended for .lua carts only available on the Pro version of TIC-80.

TIC-80 currently won't flatten your lua includes, so this does the job for you. I came across [the instructions on the TIC-80 wiki](https://github.com/nesbox/TIC-80/wiki/Splitting-a-TIC-80-project-into-multiple-files#combining-files-back-to-one), but this process looks annoying and bug-prone for larger projects. So, I've tried to provide a general-purpose script that'll handle this nicely (until a time comes where TIC-80 can support this better). 

## Installation

1. Install [luarocks](https://luarocks.org/)
2. Download the script and put it in your TIC-80 working directory (or anywhere, really, put it in your PATH if you want).
3. Ensure the script is executable (`chmod +x tic80_export.sh`).

## Assumptions

For this script to work, these assumptions about your environment must be met:

* All your project files are inside the default TIC-80 working directory.
* Your game-specific libraries are inside a directory named without the .lua extextension (e.g. `pacman.lua` would have those includes inside `pacman`). 
* Your generic libraries are in a directory called `lib`.

## Usage

1. Set your working directory to the TIC-80 working directory.
2. Run the script as `./tic80_export.sh file` where `file` is the name of your .lua project without the extension.
3. Project will be exported to game_export.lua.
