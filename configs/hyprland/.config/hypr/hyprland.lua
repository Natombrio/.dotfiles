-- Refer to the wiki for more config information.
-- https://wiki.hypr.land/Configuring/Start/

-- Please note not all available settings / options are set here.
-- For a full list, see the wiki

-- You can (and should!!) split this configuration into multiple files
-- Create your files separately and then require them like this:
-- require("myColors")


------------------
---- MONITORS ----
------------------

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
hl.monitor({
    output   = "DP-5",
    mode     = "3840x2160@240",
    position = "0x0",
    scale    = "auto",
})

hl.monitor({
    output   = "HDMI-A-5",
    mode     = "1920x1080@60",
    position = "3840x800",
    scale    = "auto",
})

hl.monitor({
    output   = "",
    mode     = "preferred",
    position = "auto",
    scale    = "auto",
})


---------------------
---- MY PROGRAMS ----
---------------------

-- Set programs that you use
local terminal    = "ghostty"
local fileManager = "thunar"


-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:
--
hl.on("hyprland.start", function ()
  hl.exec_cmd("dunst")
  hl.exec_cmd("xrandr --output DP-5 --primary")
  hl.exec_cmd("fcitx5")
  hl.exec_cmd("protonmail-bridge -n")
  hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
  hl.exec_cmd("hyprctl dispatch workspace 1")
  hl.exec_cmd("hyprctl dispatch focusmonitor 1")
  hl.exec_cmd("wl-paste --watch cliphist store")
end)


-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/

hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("MOZ_ENABLE_WAYLAND", "1")
hl.env("NVD_BACKEND", "direct")
hl.env("XCURSOR_SIZE", "30")
hl.env("HYPRCURSOR_SIZE", "30")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")


-----------------------
----- PERMISSIONS -----
-----------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Permissions/
-- Please note permission changes here require a Hyprland restart and are not applied on-the-fly
-- for security reasons

hl.config({
  ecosystem = {
    enforce_permissions = true,
  },
})

hl.permission("/usr/(bin|local/bin)/grim", "screencopy", "allow")
hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")
-- hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")


-----------------------
---- LOOK AND FEEL ----
-----------------------

-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/
hl.config({
    general = {
        gaps_in  = 0,
        gaps_out = 0,

        border_size = 2,

        col = {
            -- active_border   = { colors = {"rgba(33ccffee)", "rgba(00ff99ee)"}, angle = 45 },
            active_border   = { colors = {"rgba(000fffff)"}, angle = 45 },
            inactive_border = "rgba(000000ff)",
        },

        -- Set to true to enable resizing windows by clicking and dragging on borders and gaps
        resize_on_border = true,

        -- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
        allow_tearing = true,

        layout = "dwindle",
    },

    decoration = {
        rounding       = 3,
        -- rounding_power = 2,

        -- Change transparency of focused and unfocused windows
        -- active_opacity   = 1.0,
        -- inactive_opacity = 1.0,

        shadow = {
            enabled      = true,
            range        = 4,
            render_power = 3,
            color        = 0xee1a1a1a,
        },

        blur = {
            enabled   = true,
            size      = 3,
            passes    = 1,
            vibrancy  = 0.1696,
        },
    },

    animations = {
        enabled = true,
        hl.curve( "myBezier", { type = "bezier", points = { {0.05, 0.9}, {0.1, 1.05} } } ),
        hl.animation({ leaf = "windows", enabled = true, speed = 3, bezier = "myBezier" }),
        hl.animation({ leaf = "windowsOut", enabled = true, speed = 2, bezier = "default", style = "popin 50%" }),
        hl.animation({ leaf = "windowsMove", enabled = true, speed = 0.1, bezier = "default" }),
        hl.animation({ leaf = "border", enabled = true, speed = 10, bezier = "default" }),
        hl.animation({ leaf = "borderangle", enabled = true, speed = 8, bezier = "default" }),
        hl.animation({ leaf = "fade", enabled = true, speed = 0.3, bezier = "default" }),
        hl.animation({ leaf = "workspaces", enabled = false }),

    },

    dwindle = {
        preserve_split = true, -- You probably want this
    },
})

-- -- Default curves and animations, see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
-- hl.curve("easeOutQuint",   { type = "bezier", points = { {0.23, 1},    {0.32, 1}    } })
-- hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1}    } })
-- hl.curve("linear",         { type = "bezier", points = { {0, 0},       {1, 1}       } })
-- hl.curve("almostLinear",   { type = "bezier", points = { {0.5, 0.5},   {0.75, 1}    } })
-- hl.curve("quick",          { type = "bezier", points = { {0.15, 0},    {0.1, 1}     } })
--
-- -- Default springs
-- hl.curve("easy",           { type = "spring", mass = 1, stiffness = 71.2633, dampening = 15.8273644 })
--
-- hl.animation({ leaf = "global",        enabled = true,  speed = 10,   bezier = "default" })
-- hl.animation({ leaf = "border",        enabled = true,  speed = 5.39, bezier = "easeOutQuint" })
-- hl.animation({ leaf = "windows",       enabled = true,  speed = 4.79, spring = "easy" })
-- hl.animation({ leaf = "windowsIn",     enabled = true,  speed = 4.1,  spring = "easy",         style = "popin 87%" })
-- hl.animation({ leaf = "windowsOut",    enabled = true,  speed = 1.49, bezier = "linear",       style = "popin 87%" })
-- hl.animation({ leaf = "fadeIn",        enabled = true,  speed = 1.73, bezier = "almostLinear" })
-- hl.animation({ leaf = "fadeOut",       enabled = true,  speed = 1.46, bezier = "almostLinear" })
-- hl.animation({ leaf = "fade",          enabled = true,  speed = 3.03, bezier = "quick" })
-- hl.animation({ leaf = "layers",        enabled = true,  speed = 3.81, bezier = "easeOutQuint" })
-- hl.animation({ leaf = "layersIn",      enabled = true,  speed = 4,    bezier = "easeOutQuint", style = "fade" })
-- hl.animation({ leaf = "layersOut",     enabled = true,  speed = 1.5,  bezier = "linear",       style = "fade" })
-- hl.animation({ leaf = "fadeLayersIn",  enabled = true,  speed = 1.79, bezier = "almostLinear" })
-- hl.animation({ leaf = "fadeLayersOut", enabled = true,  speed = 1.39, bezier = "almostLinear" })
-- hl.animation({ leaf = "workspaces",    enabled = true,  speed = 1.94, bezier = "almostLinear", style = "fade" })
-- hl.animation({ leaf = "workspacesIn",  enabled = true,  speed = 1.21, bezier = "almostLinear", style = "fade" })
-- hl.animation({ leaf = "workspacesOut", enabled = true,  speed = 1.94, bezier = "almostLinear", style = "fade" })
-- hl.animation({ leaf = "zoomFactor",    enabled = true,  speed = 7,    bezier = "quick" })
--
-- Ref https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/
-- "Smart gaps" / "No gaps when only"
-- uncomment all if you wish to use that.
-- hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
-- hl.workspace_rule({ workspace = "f[1]",   gaps_out = 0, gaps_in = 0 })
-- hl.window_rule({
--     name  = "no-gaps-wtv1",
--     match = { float = false, workspace = "w[tv1]" },
--     border_size = 0,
--     rounding    = 0,
-- })
-- hl.window_rule({
--     name  = "no-gaps-f1",
--     match = { float = false, workspace = "f[1]" },
--     border_size = 0,
--     rounding    = 0,
-- })

-- See https://wiki.hypr.land/Configuring/Layouts/Scrolling-Layout/ for more
hl.config({
    scrolling = {
        fullscreen_on_one_column = true,
    },
})

----------------
----  MISC  ----
----------------

hl.config({
    misc = {
        force_default_wallpaper = 0,    -- Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo   = true, -- If true disables the random hyprland logo / anime girl background. :(
        disable_splash_rendering = true,
        mouse_move_focuses_monitor = false,
        enable_swallow = false,
        middle_click_paste = false
    },
})


---------------
---- INPUT ----
---------------

hl.config({
    input = {
        kb_layout  = "fi",
        kb_variant = "nodeadkeys",
        kb_model   = "",
        kb_options = "fkeys:basic_13-24, ctrl:nocaps",
        kb_rules   = "",

        follow_mouse = 2,
        force_no_accel = false,
        sensitivity = -0.5,

        numlock_by_default = true,
        scroll_method = "2fg",
        scroll_button = 274,

        touchpad = {
            natural_scroll = true,
            scroll_factor = 0.5,
            clickfinger_behavior = true,
        },
    },

    gestures = {
        workspace_swipe_invert = false,
    },

    cursor = {
        default_monitor = "DP-5",
        no_warps = true,
        no_hardware_cursors = 2,
    },
})


-- Example per-device config
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Devices/ for more
hl.device({
    name = "slimblade-pro",
    enabled = true,
    sensitivity = 0.75,
})

--
--

---------------------
---- KEYBINDINGS ----
---------------------

-- See https://wiki.hypr.land/Configuring/Basics/Binds/ for more
local mainMod = "SUPER" -- Sets "Windows" key as main modifier

-- OBS
hl.bind("mouse:276", hl.dsp.pass({window = "class:^(TeamSpeak 3)$"}))
hl.bind("SUPER + F15", hl.dsp.send_shortcut({ mods = "SUPER", key = "F1", window = "class:^(com\\.obsproject\\.Studio)$" }))
hl.bind("SUPER + F16", hl.dsp.send_shortcut({ mods = "SUPER", key = "F2", window = "class:^(com\\.obsproject\\.Studio)$" }))

-- wl-paste
hl.bind("SUPER + z", hl.dsp.exec_cmd("cliphist list | rofi -dmenu | cliphist decode | wl-copy"))

-- screenshots
hl.bind("Print", hl.dsp.exec_cmd('grim -g "$(slurp)" - | wl-copy'))

-- audio
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 2.5%-"))
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ 2.5%+"))
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"))

-- L mod
hl.bind("SUPER + L", hl.dsp.focus({ workspace = "99" }))
hl.bind("SUPER + SHIFT + L", hl.dsp.window.move({ workspace = "99" }))

-- U mod
hl.bind("SUPER + U", hl.dsp.focus({ workspace = "999" }))
hl.bind("SUPER + SHIFT + U", hl.dsp.window.move({ workspace = "999" }))

-- Move windows
hl.bind("SUPER + ALT + left", hl.dsp.window.move({ direction = "left" }))
hl.bind("SUPER + ALT + right", hl.dsp.window.move({ direction = "right" }))
-- alternative
-- bind = $mainMod ALT, left, movewindow, mon:1
-- bind = $mainMod ALT, right, movewindow, mon:0

-- Move focus
hl.bind("SUPER + left",  hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + right", hl.dsp.focus({ direction = "right" }))
hl.bind("SUPER + up",    hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + down",  hl.dsp.focus({ direction = "down" }))

-- Apps
hl.bind("ALT + L", hl.dsp.exec_cmd(terminal))
hl.bind("ALT + E", hl.dsp.exec_cmd(fileManager))
hl.bind("SUPER + N", hl.dsp.exec_cmd("rofi -show drun"))
hl.bind("SUPER + E", hl.dsp.exec_cmd("rofi -show window"))

-- Misc
hl.bind("ALT + Escape", hl.dsp.window.kill("activewindow"))
hl.bind("SUPER + F", function()
    hl.dispatch(hl.dsp.window.float({ action = "toggle" }))
    hl.dispatch(hl.dsp.window.center())
end)
hl.bind("SUPER + P", hl.dsp.window.fullscreen())
hl.bind("ALT + TAB", hl.dsp.focus({ last = true }))
hl.bind("SUPER + SHIFT + n", hl.dsp.window.swap({ direction = "left" }))
hl.bind("SUPER + SHIFT + o", hl.dsp.window.swap({ direction = "right" }))

-- Switch workspaces with mainMod + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i}))
    hl.bind(mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
end

hl.bind("SUPER + U", hl.dsp.focus({ workspace = "999"}))
hl.bind("ALT + U", function()
    hl.dispatch(hl.dsp.focus({ workspace = "999"}))
    hl.dispatch(hl.dsp.exec_cmd("vesktop --single-instance --ozone-platform-hint=auto --enable-blink-features=MiddleClickAutoscroll"))
end)

hl.bind("SUPER + F10", hl.dsp.focus({ workspace = "logs"}))
hl.bind("SUPER + SHIFT + F10", hl.dsp.window.move({ workspace = "logs"}))

hl.bind("SUPER + 0", hl.dsp.focus({ workspace = "monitoring"}))
hl.bind("SUPER + SHIFT + 0", hl.dsp.window.move({ workspace = "monitoring"}))

-- -- Example special workspace (scratchpad)
-- hl.bind(mainMod .. " + S",         hl.dsp.workspace.toggle_special("magic"))
-- hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))


-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- -- Requires playerctl
-- hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
-- hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
-- hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
-- hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })


--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

-- Example window rules that are useful

local suppressMaximizeRule = hl.window_rule({
    -- Ignore maximize requests from all apps. You'll probably like this.
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)

hl.window_rule({
    -- Fix some dragging issues with XWayland
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

-- Layer rules also return a handle.
-- local overlayLayerRule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
-- overlayLayerRule:set_enabled(false)

-- Hyprland-run windowrule
hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },
    move  = "20 monitor_h-120",
    float = true,
})

hl.config({
    hl.window_rule({
        name  = "discord",
        match = { class = "^(vesktop)$" },
        workspace = "discord",
    }),
    hl.workspace_rule({
        workspace = "1",
        monitor = "DP-5",
        default = true,
        persistent = true,
    }),
    hl.workspace_rule({
        workspace = "2",
        monitor = "DP-5",
        persistent = false,
    }),
    hl.workspace_rule({
        workspace = "3",
        monitor = "DP-5",
        persistent = false,
    }),
    hl.workspace_rule({
        workspace = "4",
        monitor = "DP-5",
        persistent = false,
    }),
    hl.workspace_rule({
        workspace = "5",
        monitor = "DP-5",
        persistent = false,
    }),
    hl.workspace_rule({
        workspace = "99",
        monitor = "HDMI-A-5",
        persistent = true,
        default = true,
    }),
    hl.workspace_rule({
        workspace = "10",
        monitor = "HDMI-A-5",
        persistent = true,
        default_name = "monitoring"
    }),
    hl.workspace_rule({
        workspace = "998",
        monitor = "HDMI-A-5",
        persistent = true,
        default_name = "logs"
    }),
    hl.workspace_rule({
        workspace = "999",
        monitor = "HDMI-A-5",
        persistent = true,
        default_name = "discord"
    }),
})

-- Optionally load device-specific configuration
local s, _ = pcall(require, "device_specific")
if s then print("loaded device_specific") else print("device_specific not found, skipping") end

