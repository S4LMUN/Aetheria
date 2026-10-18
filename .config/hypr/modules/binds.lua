local vars       = require("variables")
local toggle_app = require("utils.toggle_app")
local move_all   = require("utils.move_all")
local SUPSM      = vars.SUP .. vars.SM
local SUPCA      = vars.SUP .. vars.CA

hl.bind(vars.SUP .. "T",            hl.dsp.exec_cmd(vars.terminal))
hl.bind(vars.SUP .. "RETURN",       hl.dsp.exec_cmd(vars.terminal))
hl.bind(SUPSM    .. "TAB",          hl.dsp.exec_cmd(vars.taskmanager))
hl.bind(vars.SUP .. "Z",            hl.dsp.exec_cmd(vars.browser))
hl.bind(vars.SUP .. "C",            hl.dsp.exec_cmd(vars.editor))
hl.bind(vars.SUP .. "N",            hl.dsp.exec_cmd(vars.note))

hl.bind(SUPSM    .. "left", hl.dsp.window.swap({ direction = "left" }))
hl.bind(SUPSM    .. "right", hl.dsp.window.swap({ direction = "right" }))
hl.bind(SUPSM    .. "up", hl.dsp.window.swap({ direction = "up" }))
hl.bind(SUPSM    .. "down", hl.dsp.window.swap({ direction = "down" }))

hl.bind(vars.SUP .. "CTRL + left",  hl.dsp.window.resize({ x = -20, y = 0, relative = true }), { repeating = true })
hl.bind(vars.SUP .. "CTRL + right", hl.dsp.window.resize({ x = 20, y = 0, relative = true }), { repeating = true })
hl.bind(vars.SUP .. "CTRL + up",    hl.dsp.window.resize({ x = 0, y = -20, relative = true }), { repeating = true })
hl.bind(vars.SUP .. "CTRL + down",  hl.dsp.window.resize({ x = 0, y = 20, relative = true }), { repeating = true })

for i = 1, 9 do
    hl.bind(SUPCA .. i, move_all(i))
end

hl.bind(SUPCA .. "mouse_down", move_all("e+1"))
hl.bind(SUPCA .. "mouse_up",   move_all("e-1"))

hl.bind(vars.SUP .. "Q",            hl.dsp.window.close())
hl.bind(SUPSM    .. "M",            hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))

hl.bind(vars.SUP .. "F",            hl.dsp.window.fullscreen({ action = "toggle" }))
hl.bind(vars.SUP .. "V",            hl.dsp.window.float({ action = "toggle" }))

hl.bind(vars.SUP .. "P",            hl.dsp.window.pseudo())
hl.bind(vars.SUP .. "J",            hl.dsp.layout("togglesplit"))    -- dwindle only

hl.bind(vars.SUP .. "left",         hl.dsp.focus({ direction = "left" }))
hl.bind(vars.SUP .. "right",        hl.dsp.focus({ direction = "right" }))
hl.bind(vars.SUP .. "up",           hl.dsp.focus({ direction = "up" }))
hl.bind(vars.SUP .. "down",         hl.dsp.focus({ direction = "down" }))

for i = 1, 10 do
    local key = i % 10
    hl.bind(vars.SUP .. key,        hl.dsp.focus({ workspace = i}))
    hl.bind(SUPSM    .. key,        hl.dsp.window.move({ workspace = i }))
end

hl.bind(vars.SUP .. "D", toggle_app("communicate", vars.discord))
hl.bind(vars.SUP .. "O", toggle_app("record", vars.recorder))
hl.bind(vars.SUP .. "M", toggle_app("music", vars.musicplayer))

hl.bind(vars.SUP .. "mouse_down",   hl.dsp.focus({ workspace = "e+1" }))
hl.bind(vars.SUP .. "mouse_up",     hl.dsp.focus({ workspace = "e-1" }))

hl.bind(SUPSM .. "mouse_down",      hl.dsp.window.move({ workspace = "e+1" }))
hl.bind(SUPSM .. "mouse_up",        hl.dsp.window.move({ workspace = "e-1" }))

hl.bind(vars.SUP .. "mouse:272",    hl.dsp.window.drag(),   { mouse = true })
hl.bind(vars.SUP .. "mouse:273",    hl.dsp.window.resize(), { mouse = true })

hl.bind("XF86AudioRaiseVolume",     hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume",     hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",            hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",         hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",      hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",    hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

hl.bind("XF86AudioNext",            hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause",           hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",            hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",            hl.dsp.exec_cmd("playerctl previous"),   { locked = true })
