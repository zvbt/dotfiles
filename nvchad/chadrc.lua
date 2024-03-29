---@type ChadrcConfig
local M = {}

M.ui = { 
    theme = 'gruvbox',
    transparency = true,

    statusline = {
    theme = "vscode_colored",
    separator_style = "default",
    overriden_modules = nil,
    },

    nvdash = {
    load_on_startup = true,

    header = {
      "           시아딘           ",
    },

    buttons = {
      { "  Find File", "Spc f f", "Telescope find_files" },
      { "󰈚  Recent Files", "Spc f o", "Telescope oldfiles" },
      { "󰈭  Find Word", "Spc f w", "Telescope live_grep" },
      { "  Bookmarks", "Spc m a", "Telescope marks" },
      { "  Themes", "Spc t h", "Telescope themes" },
      { "  Mappings", "Spc c h", "NvCheatsheet" },
    },
  },
 }

return M