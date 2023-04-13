local wezterm = require 'wezterm'

local config = {}
local wsl_domains = wezterm.default_wsl_domains()
for idx, dom in ipairs(wsl_domains) do
  if dom.name == 'WSL:Arch' then
	dom.username = 'pakke'
	dom.default_cwd = "/home/pakke"
  end
end

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.default_domain = 'WSL:Arch'
config.wsl_domains = wsl_domains
config.enable_tab_bar = false
config.audible_bell = "Disabled"

config.font = wezterm.font 'RobotoMono NF'
config.color_scheme = 'tokyonight_storm'
config.exit_behavior = 'Close'
config.window_decorations = 'RESIZE'
config.window_close_confirmation = 'NeverPrompt'
config.window_background_image = 'bg.jpg'
config.window_background_opacity = 1
config.window_background_image_hsb = {
  brightness = 0.005,

  -- You can adjust the hue by scaling its value.
  -- a multiplier of 1.0 leaves the value unchanged.
  hue = 1.0,

  -- You can adjust the saturation also.
  saturation = 1.0,

}
config.keys = {
	{
		key = "Backspace",
		mods = "CTRL",
		action = wezterm.action.SendKey {
			key = "Backspace", mods = "ALT"
		},
	},
}
config.treat_left_ctrlalt_as_altgr = true
return config

