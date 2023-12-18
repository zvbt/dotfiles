local wezterm = require("wezterm")
local act = wezterm.action

local config = {}
if wezterm.config_builder then config = wezterm.config_builder() end
config.default_prog = { 'C:/Program Files/Git/bin/sh', '-l' }

config.color_scheme = "Catppuccin Frappe"
config.font = wezterm.font_with_fallback({
  { family = "Cascadia Mono",  scale = 1.2 }
})
config.window_background_opacity = 0.9
config.window_decorations = "RESIZE"
config.window_close_confirmation = "AlwaysPrompt"
config.scrollback_lines = 3000
config.default_workspace = "home"
config.inactive_pane_hsb = {
  saturation = 0.24,
  brightness = 0.5
}

config.keys = {
  
  { key = 'q', mods = 'CTRL', action = wezterm.action.CloseCurrentPane {confirm = false} },
  
}
config.mouse_bindings = {

{ event = { Down = { streak = 1, button = 'Right' } }, mods = 'NONE', action = act.PasteFrom 'Clipboard',}

}

config.use_fancy_tab_bar = false
config.status_update_interval = 1000
wezterm.on("update-right-status", function(window, pane)

  local stat = window:active_workspace()
  if window:active_key_table() then stat = window:active_key_table() end
  if window:leader_is_active() then stat = "LDR" end


  local basename = function(s)
    return string.gsub(s, "(.*[/\\])(.*)", "%2")
  end
  local cwd = basename(pane:get_current_working_dir())
  local cmd = basename(pane:get_foreground_process_name())
  local time = wezterm.strftime("%H:%M")
    
  window:set_right_status(wezterm.format({
    { Text = wezterm.nerdfonts.oct_table .. "  " .. stat },
    { Text = " | " },
    { Text = wezterm.nerdfonts.md_folder .. "  " .. cwd },
    { Text = " | " },
    { Foreground = { Color = "FFB86C" } },
    { Text = wezterm.nerdfonts.fa_code .. "  " .. cmd },
    "ResetAttributes",
    { Text = " | " },
    { Text = wezterm.nerdfonts.md_clock .. "  " .. time },
    { Text = " |" },
  }))
end)

return config
