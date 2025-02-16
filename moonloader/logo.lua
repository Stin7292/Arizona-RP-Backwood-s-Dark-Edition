script_name("extendo")

local sampev = require('lib.samp.events')
local inicfg = require("inicfg")

local ConfigPath = thisScript().name .. ".ini"
local ServerName = nil

local Servers = {
    {name = "phoenix",    ip = "185.169.134.3"},
    {name = "tucson",     ip = "185.169.134.4"},
    {name = "scottdale",  ip = "185.169.134.43"},
    {name = "chandler",   ip = "185.169.134.44"},
    {name = "brainburg",  ip = "185.169.134.45"},
    {name = "saintrose",  ip = "185.169.134.5"},
    {name = "mesa",       ip = "185.169.134.59"},
    {name = "redrock",    ip = "185.169.134.61"},
    {name = "yuma",       ip = "185.169.134.107"},
    {name = "surprise",   ip = "185.169.134.109"},
    {name = "prescott",   ip = "185.169.134.166"},
    {name = "glendale",   ip = "185.169.134.171"},
    {name = "kingman",    ip = "185.169.134.172"},
    {name = "winslow",    ip = "185.169.134.173"},
    {name = "payson",     ip = "185.169.134.174"},
    {name = "gilbert",    ip = "80.66.82.191"},
    {name = "showlow",    ip = "80.66.82.190"},
    {name = "casagrande", ip = "80.66.82.188"},
    {name = "page",       ip = "80.66.82.168"},
    {name = "suncity",    ip = "80.66.82.159"},
    {name = "queencreek", ip = "80.66.82.200"},
    {name = "sedona",     ip = "80.66.82.144"},
    {name = "holiday",    ip = "80.66.82.132"},
    {name = "wednesday",  ip = "80.66.82.128"},
    {name = "yava",       ip = "80.66.82.113"},
    {name = "faraway",    ip = "80.66.82.82"},
    {name = "bumblebee",  ip = "80.66.82.87"},
    {name = "christmas",  ip = "80.66.82.54"},
    {name = "mirage",     ip = "80.66.82.39"},
    {name = "love",       ip = "80.66.82.33"}
}

local ini = inicfg.load({
    main = {
        phoenix         = 1,
        tucson          = 1,
        scottdale       = 1,
        chandler        = 1,
        brainburg       = 1,
        saintrose       = 1,
        mesa            = 1,
        redrock         = 1,
        yuma            = 1,
        surprise        = 1,
        prescott        = 1,
        glendale        = 1,
        kingman         = 1,
        winslow         = 1,
        payson          = 1,
        gilbert         = 1,
        showlow         = 1,
        casagrande      = 1,
        page            = 1,
        suncity         = 1,
        queencreek      = 1,
        sedona          = 1,
        holiday         = 1,
        wednesday       = 1,
        yava            = 1,
        faraway         = 1,
        bumblebee       = 1,
        christmas       = 1,
        mirage          = 1,
        love            = 1
    }
}, ConfigPath)

function save()
    inicfg.save(ini, ConfigPath)
end

function msg(text)
    sampAddChatMessage("{808080}[" .. thisScript().name .. "]:{FFFFFF} " .. text, -1)
end

function CheckServer() -- Проверка на сервер
    local ip, port = sampGetCurrentServerAddress()
    for _, server in ipairs(Servers) do
        if server.ip == ip then
            ServerName = server.name
            msg("Скрипт успешно запущен!")
            return true
        end
    end
    msg("Скрипт работает только на серверах аризоны.")
    thisScript():unload()
end

function main()
    if not isSampfuncsLoaded() or not isSampLoaded() then return end
    while not isSampAvailable() do wait(100) end
    save()

    wait(1000)

    while sampGetCurrentServerName() == "SA-MP" do wait(0) end
    CheckServer()

    sampRegisterChatCommand('logo',function(param)
        if ServerName then
            sprite = loadSprite(tonumber(param))
            ini.main[ServerName] = (tonumber(param))
            save()
            msg("Дизайн логотипа для сервера " .. ServerName .. " обновлён!")
        end
    end)

    loadTextureDictionary(ServerName)
    sprite = loadSprite(ini.main[ServerName])

    while true do
        wait(0)
        if sprite ~= nil then
            drawSprite(sprite, 589, 20, 76, 38, 255, 255, 255, 255)
        end
    end
end

function sampev.onShowTextDraw(id, data)
	if data.position.x > 530 and data.position.y < 26 then
		return false
	end
    
    if data.position.y >= 1 and data.position.y < 50 and data.position.x < 603 and data.position.x > 500 then  
        return false
    end
end