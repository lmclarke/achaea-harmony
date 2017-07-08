local barWidth = Harmony.ui.window.width
local xpos = 0

if Harmony.ui.settings.sides.left then
    barWidth = barWidth - Harmony.ui.settings.border.left
    xpos = Harmony.ui.settings.border.left
end

if Harmony.ui.settings.sides.right then
    barWidth = barWidth - Harmony.ui.settings.border.right
end

if barWidth < 0 then barWidth = 0 end

Harmony.ui.side.bottom.container = Harmony.ui.container({
    name = "bottomContainer",
        x = px(xpos), y = px(Harmony.ui.window.height - Harmony.ui.settings.border.bottom),
        width = px(barWidth), height = px(Harmony.ui.settings.border.bottom)
});

Harmony.ui.side.bottom.label = Harmony.ui.label({
    name = "bottomLabel",
        x = px(0), y = px(0),
        width = "100%", height = "100%"
}, Harmony.ui.side.bottom.container);
Harmony.ui.side.bottom.label:setStyleSheet([[
    border-top: 1px solid white;
]])
Harmony.ui.side.bottom.label:show()

Harmony.ui.side.bottom.console = Harmony.ui.console({
    name = "bottomConsole",
        x = px(0), y = px(5),
        width = "100%", height = "100%"
}, Harmony.ui.side.bottom.label)

raiseWindow("bottomConsole")