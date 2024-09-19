local wezterm = require 'wezterm'

return {
  default_prog = { "C:\\Program Files\\Git\\bin\\bash.exe", "--login" },

  font = wezterm.font_with_fallback({
    "Maple Mono NF",
  }),
  font_size = 12.0,

  enable_wayland = false,
  term = "xterm-256color",

  color_scheme = "Gruvbox dark, pale (base16)",
  window_close_confirmation = "NeverPrompt",


  window_padding = {
    left = 5,
    right = 5,
    top = 0,
    bottom = 0,
  },

  enable_tab_bar = false,
  window_decorations = "TITLE | RESIZE",
  window_background_opacity = 0,
  win32_system_backdrop = 'Mica',
  enable_scroll_bar = false,

  -- Keybindings
  keys = {
    {
      key = "!", -- ctrl+shift+1
      mods = "CTRL|SHIFT",
      action = wezterm.action.SpawnCommandInNewTab {
        args = { "ssh", "root@@*****"" },
      },
    },
    {
      key = "@", -- ctrl+shift+2
      mods = "CTRL|SHIFT",
      action = wezterm.action.SpawnCommandInNewTab {
        args = { "ssh", "root@*****" },
      },
    },
    {
      key = "#", -- ctrl+shift+3
      mods = "CTRL|SHIFT",
      action = wezterm.action.SpawnCommandInNewTab {
        args = { "wsl", "-d", "Arch" },
      },
    },
  },
}
