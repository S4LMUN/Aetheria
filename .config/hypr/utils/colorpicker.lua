local function colorpicker(format)
    return function()
        hl.dispatch(hl.dsp.exec_cmd(
            "hyprpicker -a -n -f " .. (format or "hex")
        ))
    end
end

return colorpicker
