local font = renderCreateFont('Courier New', 15, 5)
local sampev = require('lib.samp.events')
local time = 0
function main()
    while not isSampAvailable() do wait(0) end
    while true do
        wait(0)
        if time > 0 then
            local text = 'Use: '..time
            local height = renderGetFontDrawHeight(font)
            renderDrawBox(0, 395, (renderGetFontDrawTextLength(font, text))+10, height+10, 0xaa000000)
            renderFontDrawText(font, text, 0, 400, 0xFFFFFFFF)
        end
    end
end
lua_thread.create(function ()
    while true do
        wait(0)
        if time > 0 then
            time = time-1
            wait(1000)
        end
    end
end)
function sampev.onServerMessage(color, text)
    if text:find('Вы надели бронежилет') then
        time = 60
    elseif text:find('Вы автоматически надели бронежилет') then
        time = 30
    end
end