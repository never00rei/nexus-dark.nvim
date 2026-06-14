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
    prompt = "#32f7f7",
    prompt_alt = "#ff5fd7",
    directory = "#4dabff",
    directory_open = "#32f7f7",
    directory_root = "#ff5fd7",
    function_keyword = "#ff5fd7",
    function_name = "#ffe66d",
    parameter = "#ff9f43",
    string = "#ff9f43",
    type = "#ffe66d",

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
  bloodmoon = {
    none = "NONE",

    bg = "#0b0202",
    bg_dark = "#050001",
    bg_float = "#180405",
    bg_highlight = "#2a0708",
    bg_visual = "#4c0d10",
    bg_search = "#6a1518",

    fg = "#fff0ec",
    fg_dim = "#d5a39b",
    fg_muted = "#9a665f",
    comment = "#87564f",

    border = "#481216",
    selection = "#70181b",
    line = "#1b0405",
    prompt = "#e24a36",
    prompt_alt = "#c93636",
    directory = "#d63a3a",
    directory_open = "#ff3f35",
    directory_root = "#e24a36",
    function_keyword = "#ff2d35",
    function_name = "#c93636",
    parameter = "#883726",
    string = "#b52d28",
    type = "#9d3335",

    red = "#ff2d35",
    orange = "#ff3f35",
    yellow = "#b94a32",
    green = "#4dff88",
    cyan = "#e24a36",
    blue = "#6aa7ff",
    purple = "#9d3335",
    magenta = "#c93636",

    red_dim = "#bd2028",
    orange_dim = "#b52d28",
    yellow_dim = "#883726",
    green_dim = "#35bd69",
    cyan_dim = "#a93729",
    blue_dim = "#4d7cc4",
    purple_dim = "#742426",
    magenta_dim = "#932929",

    diff_add = "#12351f",
    diff_change = "#2c1518",
    diff_delete = "#3d0a15",
    diff_text = "#4a1b20",

    git_add = "#4dff88",
    git_change = "#6aa7ff",
    git_delete = "#ff2d35",

    black = "#0b0202",
    white = "#fff0ec",
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
