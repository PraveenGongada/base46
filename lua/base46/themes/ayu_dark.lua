-- credits to original theme https://github.com/ayu-theme/ayu-vim (dark) and NvChad/base46
-- This is just a modified version of it

local M = {}

M.base_30 = {
  white = "#d3d7df", -- slightly muted white
  darker_black = "#080c11",
  black = "#0E1117", -- nvim bg, reduced vibrance
  black2 = "#181b20",
  one_bg = "#20242a",
  one_bg2 = "#282c31",
  one_bg3 = "#303439",
  grey = "#3a3d42", -- less vibrant grey
  grey_fg = "#43464b",
  grey_fg2 = "#4c4f54",
  light_grey = "#5a5d62",
  red = "#D95C64", -- less vibrant red
  baby_pink = "#f78d94",
  pink = "#e57c83", -- less vibrant pink
  line = "#282c31", -- for lines like vertsplit
  green = "#8fb13d", -- further desaturated green
  vibrant_green = "#9bc74a",
  blue = "#2d88b7", -- further desaturated blue
  nord_blue = "#3a96c1",
  yellow = "#c5a938", -- further desaturated yellow
  sun = "#d3c375",
  purple = "#b58ae7", -- desaturated purple remains the same
  dark_purple = "#9571b4",
  teal = "#69b39d", -- less vibrant teal
  orange = "#e3974e", -- less vibrant orange
  cyan = "#7fc1ac", -- further desaturated cyan
  statusline_bg = "#181b20",
  lightbg = "#282c31",
  pmenu_bg = "#e5863f", -- less vibrant pmenu
  folder_bg = "#88929e",
}

M.base_16 = {
  base00 = "#0E1117", -- reduced vibrance for base00
  base01 = "#20242a",
  base02 = "#282c31",
  base03 = "#303439",
  base04 = "#3a3d42", -- consistent with less vibrant greys
  base05 = "#cbc9c0",
  base06 = "#e8e3d1",
  base07 = "#dbd9d0",
  base08 = "#cbc9c0",
  base09 = "#f8e38e", -- less vibrant yellow
  base0A = "#4690c4", -- further desaturated blue
  base0B = "#8fb13d", -- same desaturated green as base_30
  base0C = "#d89841", -- further desaturated orange
  base0D = "#D95C64", -- same red as base_30
  base0E = "#d89841", -- consistent orange
  base0F = "#b995e7", -- desaturated purple remains the same
}

M.polish_hl = {
  treesitter = {
    luaTSField = { fg = M.base_16.base0D },
    ["@tag.delimiter"] = { fg = M.base_30.cyan },
    ["@function"] = { fg = M.base_30.orange },
    ["@variable.parameter"] = { fg = M.base_16.base0F },
    ["@constructor"] = { fg = M.base_16.base0A },
    ["@tag.attribute"] = { fg = M.base_30.orange },
  },
}

M = require("base46").override_theme(M, "ayu_dark")

M.type = "dark"

return M
