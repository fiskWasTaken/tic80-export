# tic80-export

A bash executable that will help you with TIC-80 exports. This script will:

* Inline all your external .lua includes.
* Optionally export the project from the CLI edition of TIC-80. 

This is intended for .lua carts which are available on the Pro version of TIC-80.

TIC-80 currently won't flatten your lua includes. This means if you try to export your project, it won't include your imported modules. This script aims to provide a general-purpose solution that should help with the development and release of larger TIC-80 projects.

## Rationale

You may have came across [the instructions on the TIC-80 wiki](https://github.com/nesbox/TIC-80/wiki/Splitting-a-TIC-80-project-into-multiple-files#combining-files-back-to-one), but this process looks annoying and bug-prone for larger projects. So, I've tried to provide a general-purpose script that'll handle this nicely (until a time comes where TIC-80 can support this better). 

## Installation

1. Install [luarocks](https://luarocks.org/)
2. Clone this repository and, preferably, somehow add tic80-export to your PATH.

## Assumptions

For this script to work, these assumptions about your environment must be met:

* Your project and any library subfolders are contained in the same directory.
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

1. Open the working directory for your project.
2. Run the script as `tic80-export file` where `file` is the name of your .lua project without the extension.
3. Project will be exported to game_export.lua.
4. Optionally, provide an export option as the second argument. This will require tic80 to be in your PATH.

## Caveats

This will include EVERY library under the two directories configured. I probably won't change this, because:
* You might be programatically including files for whatever reason.
* TIC-80's code limits are so large, optimising for character count is largely irrelevant (unlike in Pico-8).
