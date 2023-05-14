local wezterm = require 'wezterm'

local config = {}
local unix_domain_name = 'WSL:Arch'
local unix_username = 'pakke'
local custom_font_name = 'RobotoMono NF'


local wsl_domains = wezterm.default_wsl_domains()
for idx, dom in ipairs(wsl_domains) do
  if dom.name == unix_domain_name then
	dom.username = unix_username
	dom.default_cwd = "/home/pakke"
  end
end

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.default_domain = unix_domain_name
config.default_prog = {'powershell.exe'}
config.wsl_domains = wsl_domains

config.enable_tab_bar = false
config.audible_bell = "Disabled"

config.font = wezterm.font(custom_font_name)
config.color_scheme = 'tokyonight_storm'
config.exit_behavior = 'Close'
config.window_decorations = 'RESIZE'
config.window_close_confirmation = 'NeverPrompt'
config.window_background_image = 'bg.jpg'
config.window_background_opacity = 1
config.window_background_image_hsb = {
  brightness = 0.015,

  -- You can adjust the hue by scaling its value.
  -- a multiplier of 1.0 leaves the value unchanged.
  hue = 1.0,

  -- You can adjust the saturation also.
  saturation = 1.0,

}

local function delete_word(window, pane)
	if pane:get_domain_name() == "local" then
		window:perform_action(wezterm.action.SendKey {
			key = "Backspace", mods = "CTRL"
		}, pane)
	end
	if pane:get_domain_name() == unix_domain_name then
		window:perform_action(wezterm.action.SendKey {
			key = "Backspace", mods = "ALT"
		}, pane)
	end
end

config.keys = {
	{
		key = "Backspace",
		mods = "CTRL",
		action = wezterm.action_callback(delete_word)
	},
	{
		key = '1',
		mods = 'ALT',
		action = wezterm.action.SpawnTab {DomainName = 'local'}
	},
	{
		key = '2',
		mods = 'ALT',
		action = wezterm.action.SpawnTab {DomainName = unix_domain_name}
	},

}

config.treat_left_ctrlalt_as_altgr = true
return config
