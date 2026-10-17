local function move_all(workspace)
    return function()
        local current = hl.get_active_workspace()
        if not current then return end

        local target = workspace

        if workspace == "e+1" then
            target = current.id + 1
        elseif workspace == "e-1" then
            target = current.id - 1
        end

        if target < 1 or target == current.id then return end

        local windows = hl.get_windows({ workspace = current })

        for _, window in ipairs(windows) do
            hl.dispatch(hl.dsp.window.move({
                window = window,
                workspace = target,
                follow = true,
            }))
        end
    end
end

return move_all
