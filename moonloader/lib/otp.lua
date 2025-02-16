
-- please point these to proper location
local basexx = require("basexx")
local sha1 = require("sha1")
local util = require("util")
local bit32 = require("bit32")

local otp = {
	util = util
}

--[[
	{...} contains:
		otp.type == totp
			> Number interval
			
		otp.type == hotp
			> nil
			
		otp.type == otp
			> nil
--]]
otp.new = function(secret, digits, digest, ...)
	local this = {}
	this.secret = secret
	this.digits = digits or 6
	this.digest = digest or "sha1"
	
	local args = {...}
	this.interval = args[1]
--	if(string.lower(otp.type) == "totp")then
--		this.interval = args[1]
--	elseif(string.lower(otp.type) == "hotp")then
--		
--	end
	
	return this
end



otp.generate_otp = function(instance, input)
	local hash = sha1.hmac_binary(otp.byte_secret(instance), otp.int_to_bytestring(input))
	local offset = bit32.band(string.byte(hash:sub(-1, -1)), 0xF) + 1
	
	local bhash = util.str_to_byte(hash)
	
	local code = bit32.bor(
		bit32.lshift(bit32.band(bhash[offset], 0x7F), 24),
		bit32.lshift(bit32.band(bhash[offset + 1], 0xFF), 16),
		bit32.lshift(bit32.band(bhash[offset + 2], 0xFF), 8),
		bit32.lshift(bit32.band(bhash[offset + 3], 0xFF), 0)
	)
	
	local str_code = tostring(math.floor(code % (10 ^ instance.digits)))
	while #str_code < instance.digits do
		str_code = '0' .. str_code
	end
	
	return str_code
end

otp.byte_secret = function(instance)
	local missing_padding = #(instance.secret) % 8
	if (missing_padding ~= 0) then
		instance.secret = instance.secret .. string.rep('=', (8 - missing_padding))
	end
	return basexx.from_base32(instance.secret)
end

otp.int_to_bytestring = function(i, padding)
	local bytes = {}
	while (i ~= 0) do
		table.insert(bytes, bit32.band(i, 0xFF))
		i = bit32.rshift(i, 8)
	end
	return string.rep('\0', math.max(0, (padding or 8) - #bytes)) .. util.byte_arr_tostring(util.arr_reverse(bytes))
end

otp.random_base32 = function(length, chars)
	length = length or 16
	chars = chars or util.default_chars
	local out = ""
	for i=1, length do
		out = out .. chars[math.random(1, #chars)]
	end
	return out
end

return otp
