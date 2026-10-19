local function screenshot()
    return function()
        hl.dispatch(hl.dsp.exec_cmd([[sh -c '
            DIR="$HOME/Pictures/Screenshots"
            mkdir -p "$DIR"

            AREA=$(slurp) || exit 0
            FILE="$DIR/$(date +%Y-%m-%d_%H-%M-%S-%N).png"

            grim -g "$AREA" "$FILE" &&
            wl-copy --type image/png < "$FILE"
        ']]))
    end
end

return screenshot
