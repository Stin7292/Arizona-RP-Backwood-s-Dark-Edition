script_name("patrones")
script_authors("extendo")
local ffi = require "ffi"
local getBonePosition = ffi.cast("int (__thiscall*)(void*, float*, int, bool)", 0x5E4280)
local memory = require 'memory'
local keys = require "vkeys"
local vector3d = require('vector3d')
local inicfg = require 'inicfg'
local directIni = 'patrones.ini'
local ptstyle = false
local ini = inicfg.load(inicfg.load({
    settings = {
        pt = true,
		ptstyle = 3,
        ptpos = true,
        ptkey = true
    },
}, directIni))
inicfg.save(ini, directIni)

local colorCode = 'FF0000'

local maxAmmo = 0

local WEAPON_IDS =
{
	
    {83}, -- Scorpion
    {79}, -- M249 Graffit
    {78}, -- AK Gold
    {77}, -- AK Roses
    {82}, -- M249 Standart
    {31}, --M4
	{26}, --Sawnoff Shotgun
	{28}, --Micro SMG/Uzi
	{32}, --Tec-9
    {29}, --MP5
    {22}, --Pistols 9mm
}
local fontsize = 18
function main()
    while not isSampAvailable() do wait(0) end
    local font = renderCreateFont("Arial", 18, 5)
    local font2 = renderCreateFont("Segoe UI", 12, 5) -- НЕ МЕНЯТЬ ФЛАГ И РАЗМЕР ШРИФТА, ИНАЧЕ ВСЕ ПОЙДЕТ ПО ПИЗДЕ!!!!!!!!!!!!!!!!!
    sampRegisterChatCommand("ptset", show_menu)
	wait(1000)
	sampAddChatMessage('patrones by {90ee90}extendo {ffffff}| loaded.', 0xFFffffff)
    while true do
        wait(0)
        local currentWeapon = getCurrentCharWeapon(playerPed)
        local camMode = getActiveCamMode()
        local camAiming = (camMode == 53 or camMode == 7 or camMode == 8 or camMode == 51)
        local gun = getCurrentCharWeapon(playerPed)
        local ammo = getAmmoInCharWeapon(playerPed, gun)
        dialog()
        inputdialog()
        updateAmmoDisplay(font, font2)
            if not ini.settings.ptkey and sampTextdrawIsExists(505) and not camAiming and not (getCameraTransitionState() ~= 1) then
                sampTextdrawDelete(505)
            end
                if ammo == 0 then
            sampTextdrawDelete(505)
        end
    end
end


function onWeaponChange()
    maxAmmo = 0
end

function updateAmmoDisplay(font, font2)
    local ammoinclip, maxAmmoInClip = getpatrones()
    local scrx, scry = getScreenResolution()
    local gun = getCurrentCharWeapon(playerPed)
    local ammo = getAmmoInCharWeapon(playerPed, gun)
    local ammoin = tostring(ammo - ammoinclip.." / "..ammoinclip)
    local ammoinT = tostring(ammo - ammoinclip.."-"..ammoinclip)
    local length = renderGetFontDrawTextLength(font, ammo - ammoinclip.."/"..ammoinclip)
    local height = renderGetFontDrawHeight(font)
    local x, y, z = getNameTagPos()
    local sx, sy = convert3DCoordsToScreen(x, y, z + 0.4)
    local pp, uu = convertWindowScreenCoordsToGameScreenCoords(sx + 9, sy)
    local camMode = getActiveCamMode()
    local camAiming = (camMode == 53 or camMode == 7 or camMode == 8 or camMode == 51)
    if maxAmmoInClip > 10 then
        ammohui = maxAmmoInClip / 3
        else
        ammohui = maxAmmoInClip / 2
        end
        for k, v in ipairs(WEAPON_IDS) do
            if ((camAiming and (getCameraTransitionState() ~= 1) and isKeyDown(2)) or ini.settings.ptkey) then
                if not isCharInAnyCar(PLAYER_PED) then
        if gun == v[1] and ammo > 0 and ini.settings.pt and ini.settings.ptstyle == 1 then
            local XX = ini.settings.ptpos and sx--[[  - length / 2 ]] - 45 or scrx / 2 + 2
            local YY = ini.settings.ptpos and sy or scry / 2 - 180
            drawBar(XX, YY, 110, 17, ammoinclip > ammohui and 0x4700FF00 or 0xBFFF0000, font2, ammoinclip, --[[ v[2] ]]maxAmmoInClip)


        elseif ammo > 0 and ini.settings.ptstyle == 3 and ini.settings.pt and gun == v[1] then
                local color = ammoinclip > ammohui and 0xFFFFFFFF or tonumber("0xFF" .. colorCode)
                    local XXX = ini.settings.ptpos and pp or 339.0
                    local YYY = ini.settings.ptpos and uu or 145.0
                    sampTextdrawCreate(505, "_", 582.0, 69.0)
                    sampTextdrawSetLetterSizeAndColor(505, 0.2, 0.85, color)
                    sampTextdrawSetPos(505, XXX, YYY)
                    sampTextdrawSetStyle(505, 1)
                    sampTextdrawSetAlign(505, 2)
                    sampTextdrawSetOutlineColor(505, 1, 0x70000000)
                    sampTextdrawSetString(505, ammoinT..'')


                elseif ammo > 0 and ini.settings.ptstyle == 2 and ini.settings.pt and gun == v[1] then
                    local color = ammoinclip > ammohui and 0xFFFFFFFF or 0xFFFF0000
                    local XY = ini.settings.ptpos and sx - length / 2 or scrx / 2 + length / 2 + 9
                    local YX = ini.settings.ptpos and sy or scry / 2 - 190
                    renderFontDrawText(font, ammoin, XY, YX, color)
                    end
                end
            end
        end
    if gun ~= currentWeapon then
        onWeaponChange()
        currentWeapon = gun
    end
    return currentWeapon
end

function getpatrones()
    local pointer = getCharPointer(playerPed)
    local weapon = getCurrentCharWeapon(playerPed)
    local slot = getWeapontypeSlot(weapon)
    local cweapon = pointer + 0x5A0
    local current_cweapon = cweapon + slot * 0x1C
    local ammoInClip = memory.getuint32(current_cweapon + 0x8)

    if ammoInClip > maxAmmo then
        maxAmmo = ammoInClip
    end

    return ammoInClip, maxAmmo
end


local FixTwitchingNumbers =
{
{3, 16, 2},
{2, 14, 2},
{1, 17, 3},
}


function drawBar(x, y, w, h, mcolor, font, value, maxValue)
    local ammoInClip, _ = getpatrones()
    local barWidth = math.min(w * value / maxValue - 2 * 3, w - 2 * 3)

    renderDrawBoxWithBorder(x, y, w, h, darkenColor(mcolor, 0.5), 2, 0xFF000000)
    renderDrawBox(x + 2, y + 2, barWidth + 3, h - 2 * 3 + 2, mcolor)
    if ammoInClip > 1 then
        renderDrawBox(barWidth + 4 + x, y + 1, 2, h - 3, 0xAF000000)
    elseif ammoInClip == 1 then
        renderDrawBox(barWidth + 5 + x, y + 1, 2, h - 3, 0xAF000000)
    end
    local textWidth = renderGetFontDrawTextLength(font, tostring(value))
   height = renderGetFontDrawHeight(font)
   length = renderGetFontDrawTextLength(font, tostring(value))
   for k, v in ipairs(FixTwitchingNumbers) do
    if string.len(tostring(value)) == v[1] then
        local posy = ini.settings.ptpos and 14 or 15
        renderFontDrawText(font, tostring(value), (x + v[2] - length / 2) + height / v[3] + 30, y + height / 2 - posy, 0xFFFFFFFF) --0xFFFFFFFF)
        end
    end
end

function darkenColor(color, factor)
    local r = math.floor((bit.rshift(bit.band(color, 0xFF0000), 16) * factor))
    local g = math.floor((bit.rshift(bit.band(color, 0x00FF00), 8) * factor))
    local b = math.floor((bit.band(color, 0x0000FF) * factor))
    return (bit.bor(bit.band(color, 0xFF000000), bit.lshift(r, 16), bit.lshift(g, 8), b))
end

function getBodyPartCoordinates(id, handle)
    local pedptr = getCharPointer(handle)
    local vec = ffi.new("float[3]")
    getBonePosition(ffi.cast("void*", pedptr), vec, id, true)
    return vec[0], vec[1], vec[2]
end

function getNameTagPos(ped)
    local pPlayerPos = vector3d(getBodyPartCoordinates(8, playerPed))
    return pPlayerPos.x, pPlayerPos.y, pPlayerPos.z
end

function getCamera()
	return 0x00B6F028
end

function getCameraTransitionState()
	return memory.getint8(getCamera() + 0x58)
end

function getActiveCamMode()
	local activeCamId = memory.getint8(getCamera() + 0x59)
	return getCamMode(activeCamId)
end

function getCamMode(id)
	local cams = getCamera() + 0x174
	local cam = cams + id * 0x238
	return memory.getint16(cam + 0x0C)
end


function show_menu()
	sampShowDialog(101, 'patrones by {90ee90}Extendo {ffffff}',
string.format([[
patrones: %s
Стиль отображения: {90ee90}%s {777777}(Нажмите чтобы поменять!)
Позиция отображения: %s
Работа только в прицеле: %s
]],
	ini.settings.pt and '{90ee90}работает' or '{90ee90}не работает',
	ini.settings.ptstyle,
	ini.settings.ptpos and '{90ee90}над головой' or '{90ee90}над прицелом',
	ini.settings.ptkey and '{90ee90}выключено' or '{90ee90}включено'
),
'Выбрать', 'Закрыть', 2)
end

function dialog()
    local result, button, list, _ = sampHasDialogRespond(101)
    if result and button == 1 then
        if list == 0 then
            ini.settings.pt = not ini.settings.pt
            sampTextdrawDelete(505)
            show_menu()
            inicfg.save(ini)
            elseif list == 1 then
                sampShowDialog(98, "Установка стиля", "{ffffff}Введите число от 1 до 3.", "Выбрать", "Вернуться", 1)
                --show_menu()
            elseif list == 2 then
            ini.settings.ptpos = not ini.settings.ptpos
            sampTextdrawDelete(505)
            inicfg.save(ini)
            show_menu()
            elseif list == 3 then
            ini.settings.ptkey = not ini.settings.ptkey
            sampTextdrawDelete(505)
            inicfg.save(ini)
            show_menu()
        end
    end
end


function inputdialog()
    local result, button, list, input = sampHasDialogRespond(98)

    if result then
        if button == 1 then
            local newPtStyle = tonumber(input)
            if newPtStyle and newPtStyle >= 1 and newPtStyle <= 3 then
                sampTextdrawDelete(505)
                ini.settings.ptstyle = newPtStyle
                inicfg.save(ini)
                show_menu()
            else
                sampShowDialog(98, "Установка стиля", "{ffffff}Введите число от 1 до 3.", "Выбрать", "Вернуться", 1)
                sampAddChatMessage("patrones by {90ee90}extendo {ffffff}| Вы ввели неверное значение. Пожалуйста, введите число от 1 до 3.", -1)
            end
                else
            show_menu()
        end
    end
end