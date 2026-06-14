# nexus-dark

A collection of very dark Neovim colorschemes with bright, colorful syntax.

The original palette is now named `nexus-dark-galaxy`.

## Install

From this local checkout:

```sh
./install.sh
```

With [lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
{
  "never00rei/nexus-dark",
  lazy = false,
  priority = 1000,
  config = function()
    require("nexus-dark").setup()
    vim.cmd.colorscheme("nexus-dark-galaxy")
  end,
}
```

With LazyVim, add or update a plugin spec such as `lua/plugins/colorscheme.lua`:

```lua
return {
  {
    "never00rei/nexus-dark",
    lazy = false,
    priority = 1000,
    opts = {
      variant = "galaxy",
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "nexus-dark-galaxy",
    },
  },
}
```

For Bloodmoon, use `variant = "bloodmoon"` and `colorscheme = "nexus-dark-bloodmoon"` in the same spec.

With Neovim packages:

```sh
git clone https://github.com/never00rei/nexus-dark \
  ~/.local/share/nvim/site/pack/themes/start/nexus-dark
```

Then in `init.lua`:

```lua
vim.cmd.colorscheme("nexus-dark-galaxy")
```

Use `nexus-dark-bloodmoon` for the red Bloodmoon variant.

## Options

```lua
require("nexus-dark").setup({
  variant = "galaxy",
  transparent = false,
  terminal_colors = true,
  styles = {
    comments = { italic = true },
    keywords = { bold = true },
    functions = {},
    variables = {},
  },
  integrations = {
    cmp = true,
    gitsigns = true,
    lazy = true,
    lsp = true,
    neotree = true,
    noice = true,
    nvimtree = true,
    telescope = true,
    treesitter = true,
    whichkey = true,
  },
})

vim.cmd.colorscheme("nexus-dark-galaxy")
```

`nexus-dark` is kept as a compatibility alias for `nexus-dark-galaxy`.

## Customize Colors

Use `on_colors` to adjust the palette before highlights are generated:

```lua
require("nexus-dark").setup({
  on_colors = function(colors)
    colors.bg = "#000000"
    colors.cyan = "#00ffff"
  end,
})
```

Use `on_highlights` to override specific groups:

```lua
require("nexus-dark").setup({
  on_highlights = function(highlights, colors)
    highlights.Comment = { fg = colors.fg_muted, italic = false }
    highlights.CursorLine = { bg = "#080808" }
  end,
})
```

## Themes

### nexus-dark-galaxy

The galaxy background is near black, with bright accents for readable contrast:

| Role | Color |
| --- | --- |
| Background | `#03050a` |
| Foreground | `#f2f7ff` |
| Red | `#ff4d6d` |
| Orange | `#ff9f43` |
| Yellow | `#ffe66d` |
| Green | `#4dff88` |
| Cyan | `#32f7f7` |
| Blue | `#4dabff` |
| Purple | `#b86bff` |
| Magenta | `#ff5fd7` |

### nexus-dark-bloodmoon

Bloodmoon uses red-black surfaces and crimson-forward accents while keeping semantic status colors conventional:

| Role | Color |
| --- | --- |
| Background | `#0b0202` |
| Foreground | `#fff0ec` |
| Red | `#ff2d35` |
| Orange | `#ff3f35` |
| Yellow | `#b94a32` |
| Green | `#4dff88` |
| Cyan | `#e24a36` |
| Blue | `#6aa7ff` |
| Purple | `#9d3335` |
| Magenta | `#c93636` |

Bloodmoon uses a red syntax ramp for declarations: function keywords are bright red, function names are muted crimson, and parameters are darker rust red.

## Supported Highlights

- Core Vim and Neovim editor groups
- Diagnostics and LSP semantic tokens
- Treesitter captures
- Telescope
- nvim-cmp
- GitSigns
- WhichKey
- NvimTree
- Neo-tree
- lazy.nvim
