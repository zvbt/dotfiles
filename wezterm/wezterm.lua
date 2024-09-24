local wezterm = require 'wezterm'

return {
  default_prog = { "C:\\Program Files\\Git\\bin\\bash.exe", "--login" },
  default_cwd = os.getenv("HOME") or "C:\\Users\\cyadine",

  font = wezterm.font_with_fallback({
    "Maple Mono NF",
    "Mononoki Nerd Font"
  }),
  font_size = 12.0,

  enable_wayland = true,
  term = "xterm-256color",

  color_scheme = "GruvboxDark",
  window_close_confirmation = "NeverPrompt",

  window_padding = {
    left = 5,
    right = 5,
    top = 0,
    bottom = 0,
  },

  enable_tab_bar = true,
  window_decorations = "RESIZE",
  window_background_opacity = 1,
  win32_system_backdrop = 'Disable',
  enable_scroll_bar = false,


  colors = {
    tab_bar = {
      background = "#282828",

      active_tab = {
        bg_color = "#458588",
        fg_color = "#ebdbb2",
        intensity = "Bold",
        italic = false,
        underline = "None",
      },

      inactive_tab = {
        bg_color = "#3c3836",
        fg_color = "#a89984",
      },

      inactive_tab_hover = {
        bg_color = "#504945",
        fg_color = "#ebdbb2",
      },

      new_tab = {
        bg_color = "#3c3836",
        fg_color = "#a89984",
      },

      new_tab_hover = {
        bg_color = "#504945",
        fg_color = "#ebdbb2",
      },
    },
  },

  -- Keybindings
  keys = {

    -- close tab  
    {
      key = "q", -- ctrl+shift+w
      mods = "ALT",
      action = wezterm.action.CloseCurrentTab({ confirm = false }),
    },

    -- Switch to the previous tab (Ctrl + Shift + Left Arrow)
    {
      key = "k",
      mods = "CTRL",
      action = wezterm.action.ActivateTabRelative(-1),
    },

    -- Switch to the next tab (Ctrl + Shift + Right Arrow)
    {
      key = "l",
      mods = "CTRL",
      action = wezterm.action.ActivateTabRelative(1),
    },

    -- ssh config
    {
      key = "!", -- ctrl+shift+1
      mods = "CTRL|SHIFT",
      action = wezterm.action.SpawnCommandInNewTab {
        args = { "ssh", "root@192.168.1.32" },
      },
    },
    {
      key = "@", -- ctrl+shift+2
      mods = "CTRL|SHIFT",
      action = wezterm.action.SpawnCommandInNewTab {
        args = { "ssh", "root@94.156.35.151" },
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

  mouse_bindings = {
    {
      event = { Down = { streak = 1, button = "Right" } },
      mods = "NONE",
      action = wezterm.action.PasteFrom("Clipboard"),
    },
    {
      event = { Down = { streak = 1, button = "Right" } },
      mods = "CTRL",
      action = wezterm.action.CopyTo("ClipboardAndPrimarySelection"),
    },    
  },
}
