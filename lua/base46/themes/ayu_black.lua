-- Ayu Black (hybrid)
-- UI/chrome from `ayu_dark`, in-buffer code colors from `pitch_black` (VSCode Dark+).
--
--   base_30                -> ayu_dark    (UI chrome + accent colors)
--   base_16 base00..base04 -> ayu_dark    (editor bg, selection, line-nr, borders)
--   base_16 base05..base0F -> pitch_black (default fg + syntax accent palette)
--   polish_hl              -> pitch_black (recolors treesitter/LSP groups to Dark+)

local M = {}

-- UI / chrome palette: taken verbatim from ayu_dark.
M.base_30 = {
  white = "#d3d7df", -- slightly muted white
  darker_black = "#05080e",
  black = "#080c11", -- nvim bg, reduced vibrance
  black2 = "#181b20",
  one_bg = "#20242a",
  one_bg2 = "#282c31",
  one_bg3 = "#303439",
  grey = "#3a3d42", -- less vibrant grey
  grey_fg = "#43464b",
  grey_fg2 = "#4c4f54",
  light_grey = "#5a5d62",
  red = "#D95C64",    -- less vibrant red
  baby_pink = "#f78d94",
  pink = "#e57c83",   -- less vibrant pink
  line = "#282c31",   -- for lines like vertsplit
  green = "#8fb13d",  -- further desaturated green
  vibrant_green = "#9bc74a",
  blue = "#2d88b7",   -- further desaturated blue
  nord_blue = "#3a96c1",
  yellow = "#c5a938", -- further desaturated yellow
  sun = "#d3c375",
  purple = "#b58ae7", -- desaturated purple remains the same
  dark_purple = "#9571b4",
  teal = "#69b39d",   -- less vibrant teal
  orange = "#e3974e", -- less vibrant orange
  cyan = "#7fc1ac",   -- further desaturated cyan
  statusline_bg = "#181b20",
  lightbg = "#282c31",
  pmenu_bg = "#e5863f", -- less vibrant pmenu
  folder_bg = "#88929e",
}

-- base00..base04 from ayu_dark; base05..base0F from pitch_black (see header).
M.base_16 = {
  base00 = "#080c11", -- editor bg
  base01 = "#20242a",
  base02 = "#282c31", -- selection bg
  base03 = "#303439",
  base04 = "#3a3d42", -- dim fg / status
  base05 = "#d4d4d4", -- default fg (editor.foreground)
  base06 = "#e9e9e9",
  base07 = "#ffffff",
  base08 = "#D16969",
  base09 = "#B5CEA8",
  base0A = "#D7BA7D",
  base0B = "#CE9178", -- strings (exact Dark+ salmon)
  base0C = "#9CDCFE",
  base0D = "#DCDCAA", -- functions
  base0E = "#C586C0", -- keywords
  base0F = "#D4D4D4", -- punctuation / delimiters (same as fg, like Dark+)
}

-- Dark+ semantic palette (the literal colors Dark+ uses)
local p = {
  blue = "#569CD6",        -- keywords, storage, this/super, html tags
  light_blue = "#9CDCFE",  -- variables, parameters, properties, jsx attributes
  bright_blue = "#4FC1FF", -- named constants, enum members
  teal = "#4EC9B0",        -- types, classes, interfaces, enums, namespaces
  yellow = "#DCDCAA",      -- functions, methods, decorators
  purple = "#C586C0",      -- control-flow keywords (if/return/import/await ...)
  comment = "#6A9955",     -- comments
  fg = "#D4D4D4",          -- punctuation / operators
  punct = "#808080",       -- jsx tag delimiters < > /
}

local ad = {
  bg = "#080c11",     -- base00 (unchanged across both themes)
  dark = "#20242a",   -- base01 search fg (unchanged across both themes)
  fg08 = "#cbc9c0",   -- base08 error / warning / wildmenu fg
  yellow = "#f8e38e", -- base09 incsearch bg
  blue = "#4690c4",   -- base0A search / substitute / wildmenu bg
  green = "#8fb13d",  -- base0B mode messages
  red = "#D95C64",    -- base0D directory / title / question
}

-- Syntax overrides: taken verbatim from pitch_black so code reads as Dark+.
M.polish_hl = {
  treesitter = {
    -- variables / parameters / properties -> Dark+ light blue
    ["@variable"] = { fg = p.light_blue },
    ["@variable.parameter"] = { fg = p.light_blue },
    ["@variable.member"] = { fg = p.light_blue },
    ["@variable.member.key"] = { fg = p.light_blue },
    ["@property"] = { fg = p.light_blue },
    ["@variable.builtin"] = { fg = p.blue }, -- this / super

    -- types / classes / interfaces / enums / namespaces -> teal
    ["@type"] = { fg = p.teal },
    ["@type.builtin"] = { fg = p.teal },
    ["@type.definition"] = { fg = p.teal },
    ["@constructor"] = { fg = p.teal }, -- incl. capitalized JSX components
    ["@module"] = { fg = p.teal },

    -- functions / methods -> yellow
    ["@function"] = { fg = p.yellow },
    ["@function.call"] = { fg = p.yellow },
    ["@function.method"] = { fg = p.yellow },
    ["@function.method.call"] = { fg = p.yellow },
    ["@function.builtin"] = { fg = p.yellow },

    -- named constants -> bright blue
    ["@constant"] = { fg = p.bright_blue },

    -- keywords: storage/modifiers = blue, control-flow = purple
    ["@keyword"] = { fg = p.blue },
    ["@keyword.function"] = { fg = p.blue },
    ["@keyword.storage"] = { fg = p.blue },
    ["@keyword.coroutine"] = { fg = p.purple },
    ["@keyword.return"] = { fg = p.purple },
    ["@keyword.conditional"] = { fg = p.purple },
    ["@keyword.conditional.ternary"] = { fg = p.purple },
    ["@keyword.repeat"] = { fg = p.purple },
    ["@keyword.exception"] = { fg = p.purple },
    ["@keyword.import"] = { fg = p.purple },
    ["@keyword.operator"] = { fg = p.purple }, -- new / typeof / instanceof / in / of

    ["@tag"] = { fg = p.teal },
    ["@tag.builtin"] = { fg = p.teal },
    ["@tag.attribute"] = { fg = p.teal },
    ["@tag.delimiter"] = { fg = p.punct },

    -- comments, operators, punctuation
    ["@comment"] = { fg = p.comment },
    ["@operator"] = { fg = p.fg },
    ["@punctuation.bracket"] = { fg = p.fg },
    ["@punctuation.delimiter"] = { fg = p.fg },

    ["@lsp.type.class"] = { fg = p.teal },
    ["@lsp.type.interface"] = { fg = p.teal },
    ["@lsp.type.struct"] = { fg = p.teal },
    ["@lsp.type.enum"] = { fg = p.teal },
    ["@lsp.type.type"] = { fg = p.teal },
    ["@lsp.type.typeParameter"] = { fg = p.teal },
    ["@lsp.type.namespace"] = { fg = p.teal },
    ["@lsp.type.function"] = { fg = p.yellow },
    ["@lsp.type.method"] = { fg = p.yellow },
    ["@lsp.type.decorator"] = { fg = p.yellow },
    ["@lsp.type.property"] = { fg = p.light_blue },
    ["@lsp.type.parameter"] = { fg = p.light_blue },
    ["@lsp.type.variable"] = { fg = p.light_blue },
    ["@lsp.type.enumMember"] = { fg = p.bright_blue },
  },
  defaults = {
    Comment = { fg = p.comment }, -- Dark+ green comments

    IncSearch = { fg = ad.dark, bg = ad.yellow },
    Search = { fg = ad.dark, bg = ad.blue },
    Substitute = { fg = ad.dark, bg = ad.blue },
    WildMenu = { fg = ad.fg08, bg = ad.blue },
    ModeMsg = { fg = ad.green },
    MoreMsg = { fg = ad.green },
    Directory = { fg = ad.red },
    Title = { fg = ad.red },
    Question = { fg = ad.red },
    Error = { fg = ad.bg, bg = ad.fg08 },
    ErrorMsg = { fg = ad.fg08, bg = ad.bg },
    WarningMsg = { fg = ad.fg08 },
    Exception = { fg = ad.fg08 },
    Macro = { fg = ad.fg08 },
    Debug = { fg = ad.fg08 },
    TooLong = { fg = ad.fg08 },
    VisualNOS = { fg = ad.fg08 },
  },
  syntax = {
    Include = { fg = p.purple },
  },
  lsp = {
    DiagnosticUnnecessary = { fg = "#6e7681" },
  },
  nvimtree = {
    NvimTreeGitFileStagedHL = { fg = "#e1c08d" },
    NvimTreeGitFolderStagedHL = { fg = "#e1c08d" },
  },
}

M.type = "dark"

M = require("base46").override_theme(M, "ayu_pitch_black")

return M
