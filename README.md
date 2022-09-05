# tic80_export.sh

A bash script that should help you with TIC-80 exports. This is intended for .lua carts only available on the Pro version of TIC-80.

TIC-80 currently won't flatten your lua includes. This means if you try to export your project, it won't include your imported modules. This script aims to provide a general-purpose solution that 

## Rationale

You may have came across [the instructions on the TIC-80 wiki](https://github.com/nesbox/TIC-80/wiki/Splitting-a-TIC-80-project-into-multiple-files#combining-files-back-to-one), but this process looks annoying and bug-prone for larger projects. So, I've tried to provide a general-purpose script that'll handle this nicely (until a time comes where TIC-80 can support this better). 

## Installation

1. Install [luarocks](https://luarocks.org/)
2. Download the script and put it in your TIC-80 working directory (or anywhere, really, put it in your PATH if you want).
3. Ensure the script is executable (`chmod +x tic80_export.sh`).

## Assumptions

For this script to work, these assumptions about your environment must be met:

* All your project files are inside the default TIC-80 working directory.
* Your game-specific libraries are inside a directory named without the .lua extension (e.g. `pacman.lua` would have those includes inside `pacman`). 
* Your generic libraries are in a directory called `lib`.

If the head of your project looks something like this:

```lua
-- desc:    Thing
-- site:    https://fisk.cc
-- license: MIT License
-- version: 0.1
-- script:  lua

package.path = package.path..";/path/to/TIC-80/?.lua"

require("lib/a")
require("lib/b")
```

You should be good to go.

## Usage

1. Set your working directory to the TIC-80 working directory.
2. Run the script as `./tic80_export.sh file` where `file` is the name of your .lua project without the extension.
3. Project will be exported to game_export.lua.

## Caveats

This will include EVERY library under the two directories configured. I probably won't change this, because:
* You might be programatically including files for whatever reason.
* TIC-80's code limits are so large, optimising for character count is largely irrevelant (unlike in Pico-8).
