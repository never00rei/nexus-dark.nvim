local M = {}

M.defaults = {
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
    nvimtree = true,
    telescope = true,
    treesitter = true,
    whichkey = true,
  },
  on_colors = nil,
  on_highlights = nil,
}

M.options = vim.deepcopy(M.defaults)

function M.setup(options)
  M.options = vim.tbl_deep_extend("force", vim.deepcopy(M.defaults), options or {})
end

return M
