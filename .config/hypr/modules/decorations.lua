hl.config({
    decoration = {
        rounding       = 20,
        rounding_power = 2,

        -- Change transparency of focused and unfocused windows
        active_opacity   = 1.0,
        inactive_opacity = 1.0,

        shadow = {
            enabled      = true,
            range        = 20,
            render_power = 3,
            color        = 0xee121212,
        },

        blur = {
            enabled   = true,
            size      = 10,
            passes    = 4,
            vibrancy  = 0.1696,
        },
    },
})