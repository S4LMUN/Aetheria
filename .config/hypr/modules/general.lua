hl.config({
    general = {
        gaps_in  = 5,
        gaps_out = 20,

        border_size = 1,

        col = {
            active_border   = { colors = {"#262626"}},
            inactive_border = "#262626",
        },

        -- Set to true to enable resizing windows by clicking and dragging on borders and gaps
        resize_on_border = false,

        -- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
        allow_tearing = false,

    },
})