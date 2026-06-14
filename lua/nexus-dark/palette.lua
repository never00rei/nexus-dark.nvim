local M = {}

M.variants = {
  galaxy = {
    none = "NONE",

    bg = "#03050a",
    bg_dark = "#010207",
    bg_float = "#080c14",
    bg_highlight = "#101827",
    bg_visual = "#1d3152",
    bg_search = "#263f6a",

    fg = "#f2f7ff",
    fg_dim = "#a8b3c7",
    fg_muted = "#75839b",
    comment = "#6d7890",

    border = "#22304a",
    selection = "#274b7d",
    line = "#0b1120",

    red = "#ff4d6d",
    orange = "#ff9f43",
    yellow = "#ffe66d",
    green = "#4dff88",
    cyan = "#32f7f7",
    blue = "#4dabff",
    purple = "#b86bff",
    magenta = "#ff5fd7",

    red_dim = "#c93555",
    orange_dim = "#c9792f",
    yellow_dim = "#cbb94c",
    green_dim = "#35bd69",
    cyan_dim = "#28bbbb",
    blue_dim = "#377fc7",
    purple_dim = "#8950c8",
    magenta_dim = "#c947a9",

    diff_add = "#12351f",
    diff_change = "#153154",
    diff_delete = "#3a1320",
    diff_text = "#234c7f",

    git_add = "#4dff88",
    git_change = "#4dabff",
    git_delete = "#ff4d6d",

    black = "#03050a",
    white = "#f2f7ff",
  },
}

function M.get(variant)
  variant = variant or "galaxy"
  local colors = M.variants[variant]

  if not colors then
    error(('nexus-dark: unknown palette variant "%s"'):format(variant))
  end

  return vim.deepcopy(colors)
end

return M
