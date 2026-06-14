local M = {}

local function enabled(opts, name)
  return opts.integrations[name] ~= false
end

function M.get(c, opts)
  local groups = {}

  if enabled(opts, "treesitter") then
    groups["@annotation"] = { fg = c.yellow }
    groups["@attribute"] = { fg = c.cyan }
    groups["@boolean"] = { fg = c.orange, bold = true }
    groups["@character"] = { fg = c.string }
    groups["@character.special"] = { fg = c.cyan }
    groups["@comment"] = { link = "Comment" }
    groups["@conditional"] = { link = "Conditional" }
    groups["@constant"] = { fg = c.orange }
    groups["@constant.builtin"] = { fg = c.orange, bold = true }
    groups["@constant.macro"] = { fg = c.purple }
    groups["@constructor"] = { fg = c.yellow }
    groups["@diff.plus"] = { fg = c.green }
    groups["@diff.minus"] = { fg = c.red }
    groups["@diff.delta"] = { fg = c.blue }
    groups["@function"] = { link = "Function" }
    groups["@function.builtin"] = { fg = c.cyan }
    groups["@function.call"] = { fg = c.function_name }
    groups["@function.macro"] = { fg = c.purple }
    groups["@keyword"] = { link = "Keyword" }
    groups["@keyword.conditional"] = { link = "Conditional" }
    groups["@keyword.coroutine"] = { fg = c.magenta, italic = true }
    groups["@keyword.exception"] = { fg = c.red, bold = true }
    groups["@keyword.function"] = { fg = c.function_keyword, bold = true }
    groups["@keyword.import"] = { fg = c.cyan }
    groups["@keyword.operator"] = { fg = c.magenta }
    groups["@keyword.repeat"] = { link = "Repeat" }
    groups["@label"] = { fg = c.magenta }
    groups["@markup.heading"] = { fg = c.magenta, bold = true }
    groups["@markup.italic"] = { italic = true }
    groups["@markup.link"] = { fg = c.blue, underline = true }
    groups["@markup.link.label"] = { fg = c.cyan }
    groups["@markup.link.url"] = { fg = c.green, underline = true }
    groups["@markup.list"] = { fg = c.magenta }
    groups["@markup.quote"] = { fg = c.comment, italic = true }
    groups["@markup.raw"] = { fg = c.green }
    groups["@markup.strikethrough"] = { strikethrough = true }
    groups["@markup.strong"] = { bold = true }
    groups["@module"] = { fg = c.yellow }
    groups["@number"] = { link = "Number" }
    groups["@number.float"] = { link = "Float" }
    groups["@operator"] = { link = "Operator" }
    groups["@property"] = { fg = c.cyan }
    groups["@punctuation.bracket"] = { fg = c.fg_dim }
    groups["@punctuation.delimiter"] = { fg = c.fg_dim }
    groups["@punctuation.special"] = { fg = c.cyan }
    groups["@repeat"] = { link = "Repeat" }
    groups["@string"] = { link = "String" }
    groups["@string.escape"] = { fg = c.cyan }
    groups["@string.regexp"] = { fg = c.string }
    groups["@string.special"] = { fg = c.cyan }
    groups["@string.special.path"] = { fg = c.string }
    groups["@string.special.symbol"] = { fg = c.purple }
    groups["@tag"] = { fg = c.magenta }
    groups["@tag.attribute"] = { fg = c.cyan }
    groups["@tag.delimiter"] = { fg = c.fg_dim }
    groups["@type"] = { link = "Type" }
    groups["@type.builtin"] = { fg = c.type, bold = true }
    groups["@variable"] = { fg = c.fg }
    groups["@variable.builtin"] = { fg = c.red, italic = true }
    groups["@variable.member"] = { fg = c.cyan }
    groups["@variable.parameter"] = { fg = c.parameter }
  end

  if enabled(opts, "lsp") then
    groups["@lsp.type.class"] = { fg = c.type }
    groups["@lsp.type.decorator"] = { fg = c.magenta }
    groups["@lsp.type.enum"] = { fg = c.type }
    groups["@lsp.type.enumMember"] = { fg = c.parameter }
    groups["@lsp.type.function"] = { fg = c.function_name }
    groups["@lsp.type.interface"] = { fg = c.type }
    groups["@lsp.type.keyword"] = { fg = c.function_keyword, bold = true }
    groups["@lsp.type.keyword.go"] = { fg = c.function_keyword, bold = true }
    groups["@lsp.type.macro"] = { fg = c.purple }
    groups["@lsp.type.method"] = { fg = c.function_name }
    groups["@lsp.type.namespace"] = { fg = c.type }
    groups["@lsp.type.parameter"] = { fg = c.parameter }
    groups["@lsp.type.property"] = { fg = c.cyan }
    groups["@lsp.type.struct"] = { fg = c.type }
    groups["@lsp.type.type"] = { fg = c.type }
    groups["@lsp.type.variable"] = { fg = c.fg }
  end

  if enabled(opts, "telescope") then
    groups.TelescopeBorder = { fg = c.border, bg = c.bg_float }
    groups.TelescopeNormal = { fg = c.fg, bg = c.bg_float }
    groups.TelescopePromptBorder = { fg = c.prompt, bg = c.bg_float }
    groups.TelescopePromptNormal = { fg = c.fg, bg = c.bg_float }
    groups.TelescopePromptPrefix = { fg = c.prompt_alt }
    groups.TelescopePromptTitle = { fg = c.bg, bg = c.prompt, bold = true }
    groups.TelescopePreviewTitle = { fg = c.bg, bg = c.green, bold = true }
    groups.TelescopeResultsTitle = { fg = c.bg, bg = c.blue, bold = true }
    groups.TelescopeSelection = { fg = c.fg, bg = c.bg_highlight, bold = true }
    groups.TelescopeSelectionCaret = { fg = c.magenta }
    groups.TelescopeMatching = { fg = c.yellow, bold = true }
  end

  if enabled(opts, "cmp") then
    groups.CmpItemAbbr = { fg = c.fg }
    groups.CmpItemAbbrDeprecated = { fg = c.fg_muted, strikethrough = true }
    groups.CmpItemAbbrMatch = { fg = c.cyan, bold = true }
    groups.CmpItemAbbrMatchFuzzy = { fg = c.cyan, bold = true }
    groups.CmpItemKind = { fg = c.magenta }
    groups.CmpItemKindClass = { fg = c.type }
    groups.CmpItemKindColor = { fg = c.string }
    groups.CmpItemKindConstructor = { fg = c.type }
    groups.CmpItemKindEnum = { fg = c.type }
    groups.CmpItemKindField = { fg = c.cyan }
    groups.CmpItemKindFile = { fg = c.green }
    groups.CmpItemKindFolder = { fg = c.green }
    groups.CmpItemKindFunction = { fg = c.function_name }
    groups.CmpItemKindInterface = { fg = c.type }
    groups.CmpItemKindKeyword = { fg = c.purple }
    groups.CmpItemKindMethod = { fg = c.function_name }
    groups.CmpItemKindModule = { fg = c.type }
    groups.CmpItemKindProperty = { fg = c.cyan }
    groups.CmpItemKindSnippet = { fg = c.magenta }
    groups.CmpItemKindText = { fg = c.fg }
    groups.CmpItemKindUnit = { fg = c.parameter }
    groups.CmpItemKindValue = { fg = c.parameter }
    groups.CmpItemKindVariable = { fg = c.fg }
  end

  if enabled(opts, "whichkey") then
    groups.WhichKey = { fg = c.cyan }
    groups.WhichKeyDesc = { fg = c.fg }
    groups.WhichKeyGroup = { fg = c.magenta }
    groups.WhichKeySeparator = { fg = c.fg_muted }
    groups.WhichKeyValue = { fg = c.fg_muted }
    groups.WhichKeyFloat = { bg = c.bg_float }
    groups.WhichKeyBorder = { fg = c.border, bg = c.bg_float }
  end

  if enabled(opts, "noice") then
    groups.NoiceCmdline = { fg = c.fg, bg = c.bg_float }
    groups.NoiceCmdlineIcon = { fg = c.prompt }
    groups.NoiceCmdlineIconSearch = { fg = c.yellow }
    groups.NoiceCmdlinePopup = { fg = c.fg, bg = c.bg_float }
    groups.NoiceCmdlinePopupBorder = { fg = c.prompt, bg = c.bg_float }
    groups.NoiceCmdlinePopupBorderSearch = { fg = c.yellow, bg = c.bg_float }
    groups.NoiceCmdlinePopupTitle = { fg = c.prompt, bg = c.bg_float, bold = true }
    groups.NoiceCursor = { fg = c.bg, bg = c.prompt }
    groups.NoicePopup = { fg = c.fg, bg = c.bg_float }
    groups.NoicePopupBorder = { fg = c.border, bg = c.bg_float }
  end

  if enabled(opts, "gitsigns") then
    groups.GitSignsAdd = { fg = c.git_add }
    groups.GitSignsChange = { fg = c.git_change }
    groups.GitSignsDelete = { fg = c.git_delete }
    groups.GitSignsAddNr = { fg = c.git_add }
    groups.GitSignsChangeNr = { fg = c.git_change }
    groups.GitSignsDeleteNr = { fg = c.git_delete }
  end

  if enabled(opts, "nvimtree") then
    groups.NvimTreeNormal = { fg = c.fg, bg = c.bg }
    groups.NvimTreeNormalNC = { fg = c.fg_dim, bg = c.bg }
    groups.NvimTreeRootFolder = { fg = c.directory_root, bold = true }
    groups.NvimTreeFolderIcon = { fg = c.directory }
    groups.NvimTreeFolderName = { fg = c.directory }
    groups.NvimTreeOpenedFolderName = { fg = c.directory_open, bold = true }
    groups.NvimTreeGitDirty = { fg = c.yellow }
    groups.NvimTreeGitNew = { fg = c.green }
    groups.NvimTreeGitDeleted = { fg = c.red }
    groups.NvimTreeIndentMarker = { fg = c.border }
  end

  if enabled(opts, "neotree") then
    groups.NeoTreeNormal = { fg = c.fg, bg = c.bg }
    groups.NeoTreeNormalNC = { fg = c.fg_dim, bg = c.bg }
    groups.NeoTreeDirectoryIcon = { fg = c.directory }
    groups.NeoTreeDirectoryName = { fg = c.directory }
    groups.NeoTreeFileNameOpened = { fg = c.directory_open, bold = true }
    groups.NeoTreeGitAdded = { fg = c.green }
    groups.NeoTreeGitDeleted = { fg = c.red }
    groups.NeoTreeGitModified = { fg = c.yellow }
    groups.NeoTreeIndentMarker = { fg = c.border }
    groups.NeoTreeRootName = { fg = c.directory_root, bold = true }
  end

  if enabled(opts, "lazy") then
    groups.LazyNormal = { fg = c.fg, bg = c.bg_float }
    groups.LazyButton = { fg = c.fg, bg = c.bg_highlight }
    groups.LazyButtonActive = { fg = c.bg, bg = c.cyan, bold = true }
    groups.LazyH1 = { fg = c.bg, bg = c.magenta, bold = true }
    groups.LazyH2 = { fg = c.magenta, bold = true }
    groups.LazyProgressDone = { fg = c.green }
    groups.LazyProgressTodo = { fg = c.fg_muted }
    groups.LazySpecial = { fg = c.cyan }
  end

  return groups
end

return M
