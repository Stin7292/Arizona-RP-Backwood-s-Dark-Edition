local sampev = require('lib.samp.events')
function sampev.onShowTextDraw(id, data)
    if data.style == 3 and data.text:find('%d+:%d+:%d+') then
        return false
    end
end