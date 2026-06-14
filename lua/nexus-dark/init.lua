local config = require("nexus-dark.config")
local palette = require("nexus-dark.palette")
local groups = require("nexus-dark.groups")
local plugins = require("nexus-dark.plugins")

local M = {}

function M.setup(options)
  config.setup(options)
end

function M.colors()
  local colors = palette.get(config.options.variant)
  if type(config.options.on_colors) == "function" then
    config.options.on_colors(colors)
  end
  return colors
end

local function apply(groups_to_apply)
  for group, spec in pairs(groups_to_apply) do
    vim.api.nvim_set_hl(0, group, spec)
  end
end

local function terminal_colors(c)
  vim.g.terminal_color_0 = c.black
  vim.g.terminal_color_1 = c.red
  vim.g.terminal_color_2 = c.green
  vim.g.terminal_color_3 = c.yellow
  vim.g.terminal_color_4 = c.blue
  vim.g.terminal_color_5 = c.magenta
  vim.g.terminal_color_6 = c.cyan
  vim.g.terminal_color_7 = c.fg_dim
  vim.g.terminal_color_8 = c.fg_muted
  vim.g.terminal_color_9 = c.red
  vim.g.terminal_color_10 = c.green
  vim.g.terminal_color_11 = c.yellow
  vim.g.terminal_color_12 = c.blue
  vim.g.terminal_color_13 = c.purple
  vim.g.terminal_color_14 = c.cyan
  vim.g.terminal_color_15 = c.white
end

function M.load(options)
  local load_options = options
  if type(options) == "string" then
    load_options = { variant = options }
  end

  if load_options then
    config.options = vim.tbl_deep_extend("force", config.options, load_options)
  end

  if vim.g.colors_name then
    vim.cmd("highlight clear")
  end

  vim.o.termguicolors = true
  vim.g.colors_name = "nexus-dark-" .. config.options.variant

  local c = M.colors()
  local highlights = vim.tbl_deep_extend(
    "force",
    groups.get(c, config.options),
    plugins.get(c, config.options)
  )

  if type(config.options.on_highlights) == "function" then
    config.options.on_highlights(highlights, c)
  end

  apply(highlights)

  if config.options.terminal_colors then
    terminal_colors(c)
  end
end

return M
