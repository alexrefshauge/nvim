# Neovim Configuration
My neovim configuration module

## Install
From `~/.config/nvim/` run

`git clone https://github.com/alexrefshauge/nvim.git lua/alexref`

Then make an `init.lua` file with:

`require("alexref")`

The folder structure in `~/.config/nvim/` should now look like this

```
.
├── lua
│   └── alexref
│       ├── lazy
│       │   └── ...
│       └── ...
└── init.lua
```
