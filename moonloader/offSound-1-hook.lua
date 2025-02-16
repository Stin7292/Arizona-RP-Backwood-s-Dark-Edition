local ev = require 'lib.samp.events'

function ev.onPlaySound(id, pos)
	if id == 17802 then
		return false
	end
end