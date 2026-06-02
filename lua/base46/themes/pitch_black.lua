-- Pitch Black
-- A faithful port of the VSCode "Pitch Black" theme by Viktor Qvarfordt
-- https://github.com/ViktorQvarfordt/vscode-pitch-black-theme
--
-- Pitch Black = VSCode Dark+ (dark_plus.json) syntax on a pure-black (#000000) UI.
-- Syntax colors below are the Dark+ palette; the background ramp is collapsed to
-- black, with only barely-there near-black elevations for chrome (floats, popups,
-- statusline, current line) so the UI stays legible while reading as pitch black.

local M = {}

M.base_30 = {
  white = "#d4d4d4",
  darker_black = "#0a0a0a", -- NormalFloat bg (subtle lift over pure black)
  black = "#000000",        --  nvim bg (pure black — the signature of Pitch Black)
  black2 = "#101010",       -- CursorLine / ColorColumn / Folded
  one_bg = "#141414",       -- Pmenu / popup bg
  one_bg2 = "#1c1c1c",
  one_bg3 = "#242424",
  grey = "#454545", -- LineNr, scrollbar thumb
  grey_fg = "#565656",
  grey_fg2 = "#606060",
  light_grey = "#6e6e6e",
  red = "#D16969",
  baby_pink = "#ea696f",
  pink = "#bb7cb6",
  line = "#1a1a1a", -- vertsplit / WinSeparator (subtle on black)
  green = "#B5CEA8",
  green1 = "#4EC994",
  vibrant_green = "#bfd8b2",
  blue = "#569CD6",
  nord_blue = "#60a6e0",
  yellow = "#D7BA7D",
  sun = "#e1c487",
  purple = "#c68aee",
  dark_purple = "#b77bdf",
  teal = "#4294D6",
  orange = "#d3967d",
  cyan = "#9CDCFE",
  statusline_bg = "#0a0a0a",
  lightbg = "#1a1a1a",
  pmenu_bg = "#60a6e0",
  folder_bg = "#569CD6",
}

M.base_16 = {
  base00 = "#000000", -- editor bg: PURE BLACK
  base01 = "#0d0d0d",
  base02 = "#264f78", -- visual selection (Dark+ selection blue)
  base03 = "#2a2a2a", -- whitespace / nontext (dim on black)
  base04 = "#464646",
  base05 = "#d4d4d4", -- default fg (editor.foreground)
  base06 = "#e9e9e9",
  base07 = "#ffffff",
  base08 = "#D16969",
  base09 = "#B5CEA8",
  base0A = "#D7BA7D",
  base0B = "#CE9178", -- strings (exact Dark+ salmon)
  base0C = "#9CDCFE",
  base0D = "#DCDCAA",
  base0E = "#C586C0",
  base0F = "#D4D4D4", -- punctuation / delimiters (same as fg, like Dark+)
}

-- Dark+ semantic palette (the literal colors VSCode Pitch Black / Dark+ uses)
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
    ["@constructor"] = { fg = p.teal },
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
    Comment = { fg = p.comment },
  },
  syntax = {
    Include = { fg = p.purple },
  },
  lsp = {
    DiagnosticUnnecessary = { fg = "#6e7681" },
  },
}

M.type = "dark"

M = require("base46").override_theme(M, "pitch_black")

return M
