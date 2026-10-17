local function toggle_app(workspace, app)
    return function()
        local target = "special:" .. workspace

        for _, window in ipairs(hl.get_windows()) do
            if window.workspace and window.workspace.name == target then
                hl.dispatch(hl.dsp.workspace.toggle_special(workspace))
                return
            end
        end

        hl.dispatch(hl.dsp.exec_cmd(app))
    end
end

return toggle_app
