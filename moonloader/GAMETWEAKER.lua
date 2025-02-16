

script_author = "Gorskin"
script_name = "[GAMETWEAKER]"
script_version = "F 1.0"
script_properties('work-in-pause')

local success, imgui = pcall(require, "mimgui")
if not success then
    print("����������� ����������: \"mimgui\"")
end

local ffi = require("ffi")

local cast = ffi.cast

local success, lfs = pcall(require, "lfs")
if not success then
    print("����������� ����������: \"lfs\"")
end

local success, mimhot = pcall(require, "mimhot")
if not success then
    print("����������� ����������: \"mimhot\"")
end
imgui.HotKey = mimhot.HotKey 

local success, rkeys = pcall(require, "rkeys")
if not success then
    print("����������� ����������: \"rkeys\"")
end

local success, memory = pcall(require, "memory")
if not success then
    print("����������� ����������: \"memory\"")
end

local encoding = require("encoding")


local wm = require("windows.message")

success, fa = pcall(require, "fAwesome5")
if not success then
    print("����������� ����������: \"fAwesome5\"")
end

encoding.default = "CP1251"
local u8 = encoding.UTF8

local renderWindow, renderWindowTWS, new, str, sizeof = imgui.new.bool(), imgui.new.bool(), imgui.new, ffi.string, ffi.sizeof
local weaponSoundDelay = {[9] = 200, [37] = 900, } -- ugenrl
local soundsDir = "moonloader/GameTweaker/genrl/" -- ugenrl
local sizeX, sizeY = getScreenResolution()

------------------------[ cfg ] -------------------
local inicfg = require("inicfg")
local directIni = "GameTweaker.ini"
local ini = inicfg.load({
    settings = {
        currentLogo = 1,
        nopgamma = false,
        currentpreset = "Default.json",
        openmenukeys = "[18,74]",
        nickdistance = 8,
        noradio = true,
        shownicks = false,
        showhp = false,
        showchat = false,
        showhud = false,
        weather = 1,
        otweather = 0,
        doweather = 10,
        hours = 17,
        min = 0,
        sync_time = false,
        gtatime = false,
        gtaweather = false,
        noRain = false,
        noFog = false,
        noSandstorm = false,
        drawdist = 250.0,
        drawdistair = 1000.0,
        drawdistpara = 500.0,
        fog = 30.0,
        lod = 300.0,
        speedinputsmap = 14.0,
        effects_manager = false,
        blockweather = false,
        blocktime = false,
        givemedist = false,
        targetblip = true,
        renderammo = false,
        nocrosshaireditsize = false,
        antiblockedplayer = false,
        chatt = false,
        unlimitfps = false,
        sensfix = false,
        sounds = true,
        intmusic = true,
        helptext = false,
        beginmenu = false,
        audiostream = true,
        fixblackroads = false,
        ovalityCorrection = false,
        longarmfix = false,
        noshadows = false,
        pedshadows = false,
        maxshadows = false,
        poleshadows = false,
        vehshadows = false,
        givemedistnames = false,
        waterfixquadro = false,
        intrun = false,
        shadowedit = false,
        mapzoom = false,
        mapzoomvalue = 280.0,
        shadowcp = 0,
        shadowlight = 0,
        animmoney = 2,
        fixcrosshair = false,
        crosshairSize = 1.3,
        sunfix = false,
        radarfix = false,
        roundedRadarSize = 1.0,
        roundedRadar = false,
        radarWidth = 94.0,
        radarHeight = 76.0,
        radarPosX = 40.0,
        radarPosY = 104.0,
        radaralpha = 255.0,
        fullmenuheight = 480.0,
        fullmenuwidth = 640.0,
        forceaniso = false,
        mapzoomfixer = false,
        fixloadmap = false,
        dual_monitor_fix = false,
        radar_color_fix = false,
        brightness = 128,
        nolimitmoneyhud = false,
        distobjects_stolb_fonars = 30.0,
        distobjects_musor = 10.0,
        moneyzerofix = false,
        givemedistobj = false,
        fullmenuimage = false,
        smalliconsradar = false,
        vehloddist = 200.0,
        nohealthflick = true,
        treepitching = false,
        fixbloodwood = false,
        aspectratio = 1.33,
        CustomFov = false,
        fov = 70.0,
        fontmoneyborder = 2,
        refreshratefix = false,
        osnov_icon = 7.0,
        quadro_icon_size = 1.4,
        quadro_icon_border = 1.4,
        trianglev_icon_size = 1.4,
        trianglev_icon_border = 1.4,
        trianglen_icon_size = 1.4,
        trianglen_icon_border = 1.4,
        player_icon_size = 8.0,
        arrowmap_size = 10.0,
        recolorerFuncOn = true,
        recolorer = false,
        patchduck = false,
        FixArrowPassMotoBike = false,
        radrarnorth = false,
        arrowicon_menu = false,
        anticrash = false,
        EditPatrons = false,
        posPatronsX = 47.0,
        posPatronsY = 43.0,
        sizePatronsX = 0.3,
        sizePatronsY = 0.7,
        EditHealth = false,
        posHealthX = -141.0,
        posHealthY = 77.0,
        sizeHealthX = 109.0,
        sizeHealthY = 9.0,
        healthborder = true,
        EditMoney = false,
        posMoneyX = -32.0,
        posMoneyY = 89.0,
        sizeMoneyX = 0.550,
        sizeMoneyY = 1.1,
        EditBreath = false,
        posBreathX = -94.0,
        posBreathY = 62.0,
        sizeBreathX = 62.0,
        sizeBreathY = 9.0,
        breathborder = true,
        eternalBreath = false,
        EditArmor = false,
        eternalArmor = false,
        posArmorX = -94.0,
        posArmorY = 48.0,
        sizeArmorX = 62,
        sizeArmorY = 9,
        armorborder = true,
        EditWeapon = false,
        posWeaponX = -32.0,
        posWeaponY = 20.0,
        sizeWeaponX = 47.0,
        sizeWeaponY = 58.0,
        EditWanted = false,
        posWantedX = -29.0,
        posWantedY = 114.0,
        sizeWantedX = 0.60,
        sizeWantedY = 1.21,
        spaceWanted = 18.0,
        eternalwanted = false,
        fontmoneystyle = 3,
        fontammostyle = 0,
        fontmenubasestyle = 2,
        fontmenuheaderstyle = 0,
        fontmenutumblerstyle = 2,
        EditClock = false,
        DrawClock = false,
        posClockX = -32.0,
        posClockY = 22.0,
        sizeClockX = 0.55,
        sizeClockY = 1.10,
        fontstyleclock = 3,
        fontoutlineclock = 2,
        AutoSetHighPriority = false,
        vehiclenames = false,
        areanames = false,
        framelimiter = true,
    },
    effects_manager = {
        MotionBlur = false,
        MotionBlurIntensity = 24,
        noplaneline = false,
        tiretracks = false,
        nobirds = false,
        nocloudbig = false,
        nocloudsmall = false,
        nocloudhorizont = false,
        postfx = false,
        nosparks = false,
        nowaterfog = false,
        nogunfire = false,
        nogunsmoke = false,
        nofxsystem = false,
        noblood = false,
        noexhaust = false,
        wheelsand = false,
        wheeldust = false,
        wheelmud = false,
        wheelgravel = false,
        wheelgrass = false,
        wheelspray = false,
        nodust = false,
        gunshell = false,
        teargas = false,
        footprints = false,
        vehsparks = false,
        vehtaxilight = false,
        swim = false,
        vehdust = false,
        footdust = false,
        vehdmgdust = false,
        vehdmgsmoke = false,
        breakobject = false,
        nomorehaze = true,
        reflectionwater = false,
        fireworld = false,
    },
    nop_samp_keys = {
        key_F1 = false,
        key_F4 = false,
        key_F7 = false,
        key_T = false,
        key_ALTENTER = false,
        key_PgUp_PgDn = false,
    },
    smart_fps = {
        pedfps = 300,
        vehfps = 300,
        boatfps = 300,
        motofps = 300,
        bikefps = 300,
        swimfps = 300,
        helifps = 300,
        planefps = 300,
        snipergunfps = 300,
        spraygunfps = 300,
    },
    armorhud = {
        status = false,
        fonts = 3,
        armortext = false,
        posX = 610.50,
        posY = 44.30,
        color = "0xFFFFFFFF",
        sizeX = 0.250,
        sizeY = 0.950,
    },
    cleaner = {
        autoclean = false,
        cleaninfo = false,
        limit = 900,
    },
    ugenrl_main = {
        enable = false,
        weapon = true,
        enemyWeapon = true,
        enemyWeaponDist = 70,
        hit = true,
        pain = true,
        informers = true,
        mode = 0,
    },
    ugenrl_volume = {
        weapon = 1.00,
        hit = 1.00,
        pain = 1.00,
        expl = 1.00,
    },
    custom_nametags = {
        status = false,
        fontName = "Times New Roman", -- �������� ������
        fontSize = 8, -- ������ ������
        fontFlag = 13,
    },
    ugenrl_sounds = {
        [22] = 'Colt 45.mp3',
        [23] = 'Silecent-Pistol.mp3',
        [24] = 'Deagle.mp3',
        [25] = 'Shotgun.mp3',
        [26] = 'Shotgun.mp3',
        [27] = 'Shotgun.mp3',
        [28] = 'Uzi.mp3',
        [29] = 'MP5.mp3',
        [30] = 'AK.mp3',
        [31] = 'M4.1.mp3',
        [32] = 'TEC-9.mp3',
        [33] = 'Rifle.mp3',
        [34] = 'Rifle.mp3',
        [35] = 'RPG.mp3',
        [36] = 'RPG.mp3',
        [38] = 'Minigun.mp3',
        hit = 'Bell.mp3',
        pain = 'Painmale.mp3',
        expl = 'Explosion.mp3',
    },
    fixtimecyc = {
        active = false,
        allambient = 0.800,
        objambient = 0.800,
        worldambientR = 0.800,
        worldambientG = 0.800,
        worldambientB = 0.800,
    },
    commands = {
        openmenu = "/gmenu",
        settime = "/st",
        setweather = "/sw",
        opentimecyccreator = "/cyc",
        blockservertime = "/bt",
        blockserverweather = "/bw",
        givemedist = "/givemedist",
        givemedistnames = "/givemedistnames",
        drawdistance = "/dd",
        drawdistanceair = "/ddair",
        drawdistancepara = "/ddpara",
        fogdistance = "/fd",
        loddistance = "/ld",
        fixtimecyc = "/fixtimecyc",
        offradio = "/gameradio",
        shownicks = "/sname",
        showhp = "/shp",
        showchat = "/showchat",
        showhud = "/showhud",
        fpslock = "/fpslock",
        postfx = "/postfx",
        antiblockedplayer = "/abplayer",
        animmoney = "/animmoney",
        chatopenfix = "/chatfix",
        autocleaner = "/accl",
        cleanmemory = "/ccl",
        cleaninfo = "/cclinfo",
        setmbforautocleaner = "/setccl",
        nobirds = "/nobirds",
        editcrosshair = "/ech",
        shadowedit = "/shadowedit",
        nocloudbig = "/nocloudbig",
        nocloudsmall = "/nocloudsmall",
        nocloudhorizont = "/nocloudhorizont",
        noshadows = "/noshadows",
        fixcrosshair = "/fixcrosshair",
        intrun = "/interiorrun",
        waterfixquadro = "/waterquadrofix",
        longarmfix = "/longarmfix",
        fixblackroads = "/fixblackroads",
        sensfix = "/sensfix",
        audiostream = "/audiostream",
        intmusic = "/intmusic",
        sounds = "/nosounds",
        noplaneline = "/noplaneline",
        sunfix = "/sunfix",
        targetblip = "/targetblip",
        radarfix = "/radarfix",
        radarWidth = "/radarw",
        radarHeight = "/radarh",
        radarx = "/radarx",
        radary = "/radary",
        ugenrl = "/ugenrl",
        uds = "/uds",
        uss = "/uss",
        ums = "/ums",
        urs = "/urs",
        uuzi = "/uuzi",
        ump5 = "/ump5",
        ubs = "/ubs",
        ups = "/ups",
        ugd = "/ugd",
        ugvw = "/ugvw",
        ugvh = "/ugvh",
        ugvp = "/ugvp",
        forceaniso = "/forceaniso",
        mapzoomfixer = "/mapzoomfixer",
        shadowcp = "/shadowcp",
        shadowlight = "/shadowlight",
        dual_monitor_fix = "/dualfix",
        aamb = "/aamb",
        oamb = "/oamb",
        wamb = "/wamb",
        brightness = "/brightness",
        nolimitmoneyhud = "/nolhud",
        tiretracks = "/tiretracks",
        tws = "/tws",
        ntgs = "/ntgs",
        moneyzerofix = "/mzfix",
        givemedistobj = "/givemedistobj",
        setfps = "/setfps",
        vehfps = "/vehfps",
        bikefps = "/bikefps",
        motofps = "/motofps",
        boatfps = "/boatfps",
        planefps = "/planefps",
        helifps = "/helifps",
        swimfps = "/swimfps",
        snipergunfps = "/sniperfps",
        spraygunfps = "/sprayfps"
    },
    --=======================[[��������� ����, ������]]=====================
    borderchild = { draw = false,},
    PLeftUp = { r = 0.457, g = 0.311, b = 1, a = 1.00,},
    PLeftDown = { r = 0.459, g = 0.31, b = 1.00, a = 1.00, },
    PRightUp = { r = 0, g = 0, b = 0, a = 0, },
    PRightDown = { r = 0, g = 0, b = 0, a = 0, },
    WindowBG = { r = 0, g = 0, b = 0, a = 0.813, },
    �olorChildMenu = { r = 0.06, g = 0.06, b = 0.06, a = 0.834, },
    ColorFoneImg = { r = 0.06, g = 0.06, b = 0.06, a = 0.834, },
    ColorNavi = { r = 0.06, g = 0.06, b = 0.06, a = 0.834, },
    ActiveText = { r = 0.538, g = 0.413, b = 1.00, a = 1.00, },
    PassiveText = { r = 0.728, g = 0.728, b = 0.728, a = 1.00, },
    ColorText = { r = 0.923, g = 0.923, b = 0.923, a = 1.00, },
    FrameBg = { r = 0.053, g = 0.08, b = 0.277, a = 1.00, },
    FrameBgHovered = { r = 0.304, g = 0.281, b = 0.945, a = 0.694, },
    FrameBgActive = { r = 0.398, g = 0.329, b = 0.953, a = 0.936, },
    CheckMark = { r = 0.502, g = 0.455, b = 1.00, a = 1.00, },
    SliderGrab = { r = 0.33, g = 0.33, b = 0.33, a = 1.00, },
    SliderGrabActive = { r = 0.347, g = 0.17, b = 1.00, a = 1.00, },
    Button = { r = 0.54, g = 0.396, b = 1.00, a = 1.00, },
    ButtonHovered = { r = 0.562, g = 0.281, b = 1.00, a = 0.635, },
    ButtonActive = { r = 0.386, g = 0.289, b = 1.00, a = 1.00, },
    Header = { r = 0.439, g = 0.264, b = 1.00, a = 1.00, },
    HeaderHovered = { r = 0.389, g = 0.332, b = 1.00, a = 0.477, },
    HeaderActive = { r = 0.376, g = 0.336, b = 1.00, a = 1.00, },
    ScrollbarBg = { r = 0.386, g = 0.268, b = 1.00, a = 0.635, },
    ScrollbarGrab = { r = 0.521, g = 0.349, b = 1.00, a = 1.00, },
    ScrollbarGrabHovered = { r = 0.434, g = 0.345, b = 1.00, a = 1.00, },
    ScrollbarGrabActive = { r = 0.441, g = 0.289, b = 1.00, a = 1.00, },
    logocolor = { r = 0.441, g = 0.289, b = 1.00, a = 1.00, },
    BeginColor = { r = 0.441, g = 0.289, b = 1.00, a = 1.00, },
    --=============================================================================


}, directIni)
inicfg.save(ini, directIni)

local tLastKeys = {} -- ���������� ������ ���������

local ActOpenMenuKey = {
	v = decodeJson(ini.settings.openmenukeys)
}

function save()
    inicfg.save(ini, directIni)
end

----------------------------------------{Json}-----------------------------------------

function formatterJson(data, options)
    local function pretty(dataStr, spaces)
        local spaces = spaces ~= nil and string.rep(' ', spaces) or '\t' 
        local result = ''
        local level = 0
        local in_string = false
        
        for i = 1, #dataStr do
            local c = dataStr:sub(i, i)
        
            if c == '{' or c == '[' then
                level = level + 1
                result = result .. c .. '\n' .. string.rep(spaces, level)
            elseif c == '}' or c == ']' then
                level = level - 1
                result = result .. '\n' .. string.rep(spaces, level) .. c
            elseif c == ',' then
                result = result .. c
                if not in_string then
                    result = result .. '\n' .. string.rep(spaces, level)
                end
            elseif c == ':' then
                result = result .. ': '
            else
                result = result .. c
                if c == '"' then
                    in_string = not in_string
                end
            end
        end
        
        return result
    end

    local options = options or { }
    local data = type(data) == 'table' and encodeJson(data) or data
    local dataStr = pretty(data, options['spaces'])

    return dataStr
end

local IEPresets = {
    Money = {
        posMoneyX=-32,
        fontmoneyborder=2,
        animmoney=2,
        sizeMoneyY=1.1,
        EditMoney=true,
        nolimitmoneyhud=false,
        moneyzerofix=false,
        fontmoneystyle=3,
        sizeMoneyX=0.55,
        posMoneyY=89,
    },
    Radar = {
        radaralpha=255,
        radarPosX=40,
        radarfix=true,
        smalliconsradar=false,
        roundedRadarSize=1.11,
        radarWidth=76,
        radar_color_fix=false,
        radarPosY=104,
        roundedRadar=false,
        radarHeight=94,
        trianglev_icon_border=1.4,
        trianglen_icon_size=1.4,
        player_icon_size=10,
        smalliconsradar=true,
        quadro_icon_size=1.4,
        trianglen_icon_border=1.4,
        quadro_icon_border=1.4,
        trianglev_icon_size=1.4,
        arrowicon_menu=true,
        osnov_icon=7.5,
        arrowmap_size=10,
        radrarnorth=false,
    },
    Health = {
        nohealthflick=false,
        healthborder=true,
        sizeHealthY=9,
        posHealthY=77,
        posHealthX=-141,
        sizeHealthX=109,
        EditHealth=true,
    },
    Armor = {
        EditArmor=true,
        posArmorX=-94,
        posArmorY=48,
        sizeArmorX =62,
        sizeArmorY =9,
        eternalArmor=false,
        armorborder=true,
    },
    Wanted = {
        spaceWanted=18,
        sizeWantedY=1.21,
        sizeWantedX=0.6,
        posWantedX=-29,
        EditWanted=true,
        eternalwanted=false,
        posWantedY=114,
    },
    Crosshair = {
        fixcrosshair=true,
        crosshairSize=1.100,
        nocrosshaireditsize=false,
    },
    Patrons = {
        sizePatronsY=0.7,
        posPatronsY=43,
        EditPatrons=true,
        sizePatronsX=0.3,
        posPatronsX=47,
        renderammo=false,
        fontammostyle=1,
        singleclip = false,
        EternalPatrons = false,
    },
    MenuPause = {
        beginmenu=false,
        fullmenuheight=480,
        fontmenubasestyle=2,
        fullmenuwidth=640,
        fontmenutumblerstyle=2,
        fontmenuheaderstyle=2,
        fullmenuimage=false,
        speedinputsmap=21.00,
        mapzoomvalue=300,
        mapzoomfixer=true,
        fixloadmap=true,
        mapzoom=true,
        helptext=false,
    },
    Breath = {
        posBreathX=-94,
        EditBreath=true,
        sizeBreathY=9,
        breathborder=true,
        eternalBreath=false,
        sizeBreathX=62,
        posBreathY=62,
    },
    Weapon = {
        sizeWeaponY=58,
        posWeaponX=-32,
        posWeaponY=20,
        sizeWeaponX=47,
        EditWeapon=true,
    },
    Clock = {
        posClockX=-32,
        fontstyleclock=2,
        fontoutlineclock=3,
        sizeClockX=0.55,
        posClockY=22,
        DrawClock=false,
        EditClock=true,
        sizeClockY=1.1,
    },
    Other = {
        showhud=false,
        showchat=false,
        targetblip=true,
    },
    Recolorer = {
        Recolorer = true,
        Health = -6222836,
        Armor = -1,
        Stars = -2851328,
        Patrons = -3543041,
        PlayerHealth = -65536,
        PlayerHealth2 = -15461356,
        PlayerArmor = -1,
        PlayerArmor2 = -15461356,
        Money = -16751862,
    },
    HPHud = {
        Status = false,
        fonts = 3,
        hptext = false,
        posX = 610.50,
        posY = 66.0,
        Color = "0xFFFFFFFF",
        sizeX = 0.250,
        sizeY = 0.950,
    },
    ArmorHud = {
        Status = false,
        fonts = 3,
        armortext = false,
        posX = 610.50,
        posY = 44.30,
        Color = "0xFFFFFFFF",
        sizeX = 0.250,
        sizeY = 0.950,
    },
}



local txtFiles = {}  -- ������� ��� �������� �������� ������

function getJson()
    if not doesDirectoryExist(getWorkingDirectory().."\\GameTweaker\\IE-presets") then
        createDirectory(getWorkingDirectory().."\\GameTweaker\\IE-presets")
    end
    if doesFileExist(getWorkingDirectory().."\\GameTweaker\\IE-presets\\"..ini.settings.currentpreset) then
        local jsfile = getWorkingDirectory().."\\GameTweaker\\IE-presets\\"..ini.settings.currentpreset
        local file = io.open(jsfile, "r") -- ��������� ���� � ������ ������
        a = file:read("*a") -- ������ ����, ��� � ��� �������
        file:close() -- ���������
        preset = decodeJson(a) -- ������ ���� JSON-�������
        --encodedTable = encodeJson(preset) -- ���������� ��� Lua ������ � JSON
        local file = io.open(jsfile, "w")
        --file:write(encodedTable) -- ���������� ���� �������
        file:write(formatterJson(preset))
        file:flush() -- ���������
        file:close() -- ���������
    else
        local file = io.open(getWorkingDirectory().."\\GameTweaker\\IE-presets\\"..ini.settings.currentpreset, "a+") -- ��������� � ������� ����
        file:close() -- ���������, ��� ���� �� ����� ����� �� �� ��������. �� �� ��� ���������!
        local file = io.open(getWorkingDirectory().."\\GameTweaker\\IE-presets\\"..ini.settings.currentpreset, "w")
        --encodedTable = encodeJson(IEPresets)
        file:write(formatterJson(IEPresets)) -- ���������� ���� �������
        file:flush() -- ���������
        file:close() -- ���������
        getJson()
    end
end
getJson()

function jsonExist(table)
    for key, value in pairs(table) do
        for subkey, subvalue in pairs(value) do
            if preset[key][subkey] == nil then
                preset[key][subkey] = subvalue
            end
        end
    end
end
jsonExist(IEPresets)

function saveJson(table)
    if table == "preset" then
        --encodedTable = encodeJson(preset) -- ���������� ��� Lua ������ � JSON
        local file = io.open(getWorkingDirectory().."\\GameTweaker\\IE-presets\\"..ini.settings.currentpreset, "w")
        file:write(formatterJson(preset))
        file:flush() -- ���������
        file:close() -- ���������
    end
end

local function explode_rgba(argb)-- ������������� ���� �� ������� � ���� 0xFF - alpha FFFFFF - white � r,g,b,a ��� coloredit
    local a = bit.band(bit.rshift(argb, 24), 0xFF) / 255
    local r = bit.band(bit.rshift(argb, 16), 0xFF) / 255
    local g = bit.band(bit.rshift(argb, 8), 0xFF) / 255
    local b = bit.band(argb, 0xFF) / 255
    return r, g, b, a
end

-----------------------------------------------------------------------------------------------
local tbmtext = {
    u8"�������",
    u8"��� ��������",
    u8"�����������",
}
local tmtext = imgui.new['const char*'][#tbmtext](tbmtext)

local gmodetext = {
    u8"������� ������������������",
    u8"����� ���� + Genrl",
    u8"����� ���� + �������",
}
local gmodechar = imgui.new['const char*'][#gmodetext](gmodetext)

local fontmoneybordertext = {
    u8"��� �������",
    u8"������",
    u8"C����������",
}
local fontmoneyborderchar = imgui.new['const char*'][#fontmoneybordertext](fontmoneybordertext)

local fontstyletext = {
    u8"FONT_GOTHIC",
    u8"FONT_SUBTITLES",
    u8"FONT_MENU",
    u8"FONT_PRICEDOWN",
}
local fontstylechar = imgui.new['const char*'][#fontstyletext](fontstyletext)
local fontoutlineclockchar = imgui.new['const char*'][#fontmoneybordertext](fontmoneybordertext)
------------------------------------------------------------------------------------------------
local sliders = {}
local checkboxes = {}
local buffers = {}
local icolors = {}

function imgui_Data()
    -------------------------- [sliders] --------------------------
    sliders.weather = new.int(tonumber(ini.settings.weather))
    sliders.doweather = new.int(tonumber(ini.settings.doweather))
    sliders.otweather = new.int(tonumber(ini.settings.otweather))
    sliders.hours = new.int(tonumber(ini.settings.hours))
    sliders.min = new.int(tonumber(ini.settings.min))
    sliders.drawdist = new.float(tonumber(ini.settings.drawdist))
    sliders.drawdistair = new.float(tonumber(ini.settings.drawdistair))
    sliders.drawdistpara = new.float(tonumber(ini.settings.drawdistpara))
    sliders.fog = new.float(tonumber(ini.settings.fog))
    sliders.lod = new.float(tonumber(ini.settings.lod))
    sliders.allambient = new.float(tonumber(ini.fixtimecyc.allambient))
    sliders.objambient = new.float(tonumber(ini.fixtimecyc.objambient))
    sliders.shadowcp = new.int(tonumber(ini.settings.shadowcp))
    sliders.shadowlight = new.int(tonumber(ini.settings.shadowlight))
    sliders.aspectratio = new.float(tonumber(ini.settings.aspectratio))
    sliders.fov = new.float(tonumber(ini.settings.fov))
    sliders.limitmem = new.int(tonumber(ini.cleaner.limit))
    sliders.MotionBlurIntensity = new.int(tonumber(ini.effects_manager.MotionBlurIntensity))
    sliders.mapzoomvalue = new.float(tonumber(preset["MenuPause"]["mapzoomvalue"]))
    sliders.roundedRadarSize = new.float(tonumber(preset["Radar"]["roundedRadarSize"]))
    sliders.crosshairSize = new.float(tonumber(preset["Crosshair"]["crosshairSize"]))
    sliders.radaralpha = new.float(tonumber(preset["Radar"]["radaralpha"]))
    sliders.radarw = new.float(tonumber(preset["Radar"]["radarWidth"]))
    sliders.radarh = new.float(tonumber(preset["Radar"]["radarHeight"]))
    sliders.radarposx = new.float(tonumber(preset["Radar"]["radarPosX"]))
    sliders.radarposy = new.float(tonumber(preset["Radar"]["radarPosY"]))
    sliders.brightness = new.int(tonumber(ini.settings.brightness))
    
    sliders.hpposX = new.float(tonumber(preset["HPHud"]["posX"]))
    sliders.hpposY = new.float(tonumber(preset["HPHud"]["posY"]))
    sliders.hpSizeX = new.float(tonumber(preset["HPHud"]["sizeX"]))
    sliders.hpSizeY = new.float(tonumber(preset["HPHud"]["sizeY"]))
    
    sliders.armorhudPosX = new.float(tonumber(preset["ArmorHud"]["posX"]))
    sliders.armorhudPosY = new.float(tonumber(preset["ArmorHud"]["posY"]))
    sliders.armorhudSizeX = new.float(tonumber(preset["ArmorHud"]["sizeX"]))
    sliders.armorhudSizeY = new.float(tonumber(preset["ArmorHud"]["sizeY"]))

    sliders.distobjects_stolb_fonars = new.float(tonumber(ini.settings.distobjects_stolb_fonars))
    sliders.distobjects_musor = new.float(tonumber(ini.settings.distobjects_musor))
    sliders.nickdistance = new.float(tonumber(ini.settings.nickdistance))
    sliders.custom_nametags_fontSize = new.int(tonumber(ini.custom_nametags.fontSize))
    sliders.custom_nametags_fontFlag = new.int(tonumber(ini.custom_nametags.fontFlag))
    sliders.vehloddist = new.float(tonumber(ini.settings.vehloddist))
    sliders.speedinputsmap = new.float(tonumber(preset["MenuPause"]["speedinputsmap"]))

    sliders.osnov_icon = new.float(tonumber(preset["Radar"]["osnov_icon"]))
    sliders.quadro_icon_size = new.float(tonumber(preset["Radar"]["quadro_icon_size"]))
    sliders.quadro_icon_border = new.float(tonumber(preset["Radar"]["quadro_icon_border"]))
    sliders.trianglev_icon_size = new.float(tonumber(preset["Radar"]["trianglev_icon_size"]))
    sliders.trianglev_icon_border = new.float(tonumber(preset["Radar"]["trianglev_icon_border"]))
    sliders.trianglen_icon_size = new.float(tonumber(preset["Radar"]["trianglen_icon_size"]))
    sliders.trianglen_icon_border = new.float(tonumber(preset["Radar"]["trianglen_icon_border"]))
    sliders.player_icon_size = new.float(tonumber(preset["Radar"]["player_icon_size"]))
    sliders.arrowmap_size = new.float(tonumber(preset["Radar"]["arrowmap_size"]))


    ----------------------------------------------------------
    sliders.pedfps = new.int(tonumber(ini.smart_fps.pedfps))
    sliders.vehfps = new.int(tonumber(ini.smart_fps.vehfps))
    sliders.boatfps = new.int(tonumber(ini.smart_fps.boatfps))
    sliders.motofps = new.int(tonumber(ini.smart_fps.motofps))
    sliders.bikefps = new.int(tonumber(ini.smart_fps.bikefps))
    sliders.swimfps = new.int(tonumber(ini.smart_fps.swimfps))
    sliders.helifps = new.int(tonumber(ini.smart_fps.helifps))
    sliders.planefps = new.int(tonumber(ini.smart_fps.planefps))
    sliders.snipergunfps = new.int(tonumber(ini.smart_fps.snipergunfps))
    sliders.spraygunfps = new.int(tonumber(ini.smart_fps.spraygunfps))
    -------------------------------------------------------



    ------------------------- [ugenrl] ---------------------------------
    sliders.weapon_volume_slider = new.float(tonumber(ini.ugenrl_volume.weapon))
    sliders.hit_volume_slider = new.float(tonumber(ini.ugenrl_volume.hit))
    sliders.pain_volume_slider = new.float(tonumber(ini.ugenrl_volume.pain))
    sliders.expl_volume_slider = new.float(tonumber(ini.ugenrl_volume.expl))
    sliders.enemyweapon_dist = new.int(tonumber(ini.ugenrl_main.enemyWeaponDist))
    --------------------------------------------------------------------

    ---------------------- [ �������� ��������� ����������] --------
    sliders.posPatronsX = new.float(tonumber(preset["Patrons"]["posPatronsX"]))
    sliders.posPatronsY = new.float(tonumber(preset["Patrons"]["posPatronsY"]))
    sliders.sizePatronsX = new.float(tonumber(preset["Patrons"]["sizePatronsX"]))
    sliders.sizePatronsY = new.float(tonumber(preset["Patrons"]["sizePatronsY"]))

    sliders.posHealthX = new.float(tonumber(preset["Health"]["posHealthX"]))
    sliders.posHealthY = new.float(tonumber(preset["Health"]["posHealthY"]))
    sliders.sizeHealthX = new.float(tonumber(preset["Health"]["sizeHealthX"]))
    sliders.sizeHealthY = new.float(tonumber(preset["Health"]["sizeHealthY"]))

    sliders.posMoneyX = new.float(tonumber(preset["Money"]["posMoneyX"]))
    sliders.posMoneyY = new.float(tonumber(preset["Money"]["posMoneyY"]))
    sliders.sizeMoneyX = new.float(tonumber(preset["Money"]["sizeMoneyX"]))
    sliders.sizeMoneyY = new.float(tonumber(preset["Money"]["sizeMoneyY"]))

    sliders.posBreathX = new.float(tonumber(preset["Breath"]["posBreathX"]))
    sliders.posBreathY = new.float(tonumber(preset["Breath"]["posBreathY"]))
    sliders.sizeBreathX = new.float(tonumber(preset["Breath"]["sizeBreathX"]))
    sliders.sizeBreathY = new.float(tonumber(preset["Breath"]["sizeBreathY"]))

    sliders.posArmorX = new.float(tonumber(preset["Armor"]["posArmorX"]))
    sliders.posArmorY = new.float(tonumber(preset["Armor"]["posArmorY"]))
    sliders.sizeArmorX = new.float(tonumber(preset["Armor"]["sizeArmorX"]))
    sliders.sizeArmorY = new.float(tonumber(preset["Armor"]["sizeArmorY"]))

    sliders.posWeaponX = new.float(tonumber(preset["Weapon"]["posWeaponX"]))
    sliders.posWeaponY = new.float(tonumber(preset["Weapon"]["posWeaponY"]))
    sliders.sizeWeaponX = new.float(tonumber(preset["Weapon"]["sizeWeaponX"]))
    sliders.sizeWeaponY = new.float(tonumber(preset["Weapon"]["sizeWeaponY"]))

    sliders.posWantedX = new.float(tonumber(preset["Wanted"]["posWantedX"]))
    sliders.posWantedY = new.float(tonumber(preset["Wanted"]["posWantedY"]))
    sliders.sizeWantedX = new.float(tonumber(preset["Wanted"]["sizeWantedX"]))
    sliders.sizeWantedY = new.float(tonumber(preset["Wanted"]["sizeWantedY"]))
    sliders.spaceWanted = new.float(tonumber(preset["Wanted"]["spaceWanted"]))

    sliders.posClockX = new.float(tonumber(preset["Clock"]["posClockX"]))
    sliders.posClockY = new.float(tonumber(preset["Clock"]["posClockY"]))
    sliders.sizeClockX = new.float(tonumber(preset["Clock"]["sizeClockX"]))
    sliders.sizeClockY = new.float(tonumber(preset["Clock"]["sizeClockY"]))


    --------------------------- [checkboxes] ---------------------------
    checkboxes.nopgamma = new.bool(ini.settings.nopgamma)
    checkboxes.ovalityCorrection = new.bool(ini.settings.ovalityCorrection)
    checkboxes.borderchild_draw = new.bool(ini.borderchild.draw)
    checkboxes.anticrash = new.bool(ini.settings.anticrash)
    checkboxes.blockweather = new.bool(ini.settings.blockweather)
    checkboxes.blocktime = new.bool(ini.settings.blocktime)
    checkboxes.sync_time = new.bool(ini.settings.sync_time)
    checkboxes.gtatime = new.bool(ini.settings.gtatime)
    checkboxes.gtaweather = new.bool(ini.settings.gtaweather)
    checkboxes.noRain = new.bool(ini.settings.noRain)
    checkboxes.noFog = new.bool(ini.settings.noFog)
    checkboxes.noSandstorm = new.bool(ini.settings.noSandstorm)
    checkboxes.antiblockedplayer = new.bool(ini.settings.antiblockedplayer)
    checkboxes.chatt = new.bool(ini.settings.chatt)
    checkboxes.sensfix = new.bool(ini.settings.sensfix)
    checkboxes.fixblackroads = new.bool(ini.settings.fixblackroads)
    checkboxes.longarmfix = new.bool(ini.settings.longarmfix)
    checkboxes.waterfixquadro = new.bool(ini.settings.waterfixquadro)
    checkboxes.intrun = new.bool(ini.settings.intrun)
    checkboxes.cleaninfo = new.bool(ini.cleaner.cleaninfo)
    checkboxes.fixcrosshair = new.bool(ini.settings.fixcrosshair)
    checkboxes.mapzoom = new.bool(preset["MenuPause"]["mapzoom"])
    checkboxes.sunfix = new.bool(ini.settings.sunfix)
    checkboxes.radarfix = new.bool(preset["Radar"]["radarfix"])
    checkboxes.roundedRadar = new.bool(preset["Radar"]["roundedRadar"])
    checkboxes.vehtaxilight = new.bool(ini.effects_manager.vehtaxilight)
    checkboxes.forceaniso = new.bool(ini.settings.forceaniso)
    checkboxes.mapzoomfixer = new.bool(ini.settings.mapzoomfixer)
    checkboxes.dual_monitor_fix = new.bool(ini.settings.dual_monitor_fix)
    checkboxes.radar_color_fix = new.bool(preset["Radar"]["radar_color_fix"])
    checkboxes.nop_samp_keys_F1 = new.bool(ini.nop_samp_keys.key_F1)
    checkboxes.nop_samp_keys_F4 = new.bool(ini.nop_samp_keys.key_F4)
    checkboxes.nop_samp_keys_F7 = new.bool(ini.nop_samp_keys.key_F7)
    checkboxes.nop_samp_keys_T = new.bool(ini.nop_samp_keys.key_T)
    checkboxes.nop_samp_keys_ALTENTER = new.bool(ini.nop_samp_keys.key_ALTENTER)
    checkboxes.nop_samp_keys_PgUp_PgDn = new.bool(ini.nop_samp_keys.key_PgUp_PgDn)
    checkboxes.nolimitmoneyhud = new.bool(preset["Money"]["nolimitmoneyhud"])
    checkboxes.hphud = new.bool(preset["HPHud"]["Status"])
    checkboxes.hpt = new.bool(preset["HPHud"]["hptext"])
    checkboxes.armorhud = new.bool(preset["ArmorHud"]["Status"])
    checkboxes.armortext = new.bool(preset["ArmorHud"]["armortext"])
    checkboxes.fixtimecyc = new.bool(ini.fixtimecyc.active)
    checkboxes.givemedist = new.bool(ini.settings.givemedist)
    checkboxes.shadowedit = new.bool(ini.settings.shadowedit)
    checkboxes.givemedistnames = new.bool(ini.settings.givemedistnames)
    checkboxes.autoclean = new.bool(ini.cleaner.autoclean)
    checkboxes.sounds = new.bool(ini.settings.sounds)
    checkboxes.noradio = new.bool(ini.settings.noradio)
    checkboxes.intmusic = new.bool(ini.settings.intmusic)
    checkboxes.audiostream = new.bool(ini.settings.audiostream)
    checkboxes.targetblip = new.bool(preset["Other"]["targetblip"])
    checkboxes.fixloadmap = new.bool(preset["MenuPause"]["fixloadmap"])
    checkboxes.helptext = new.bool(preset["MenuPause"]["helptext"])
    checkboxes.beginmenu = new.bool(preset["MenuPause"]["beginmenu"])
    checkboxes.treepitching = new.bool(ini.settings.treepitching)
    checkboxes.fixbloodwood = new.bool(ini.settings.fixbloodwood)
    checkboxes.refreshratefix = new.bool(ini.settings.refreshratefix)
    checkboxes.framelimiter = new.bool(ini.settings.framelimiter)
    checkboxes.recolorer = new.bool(preset["Recolorer"]["Recolorer"])
    checkboxes.patchduck = new.bool(ini.settings.patchduck)
    checkboxes.FixArrowPassMotoBike = new.bool(ini.settings.FixArrowPassMotoBike)
    checkboxes.nocrosshaireditsize = new.bool(preset["Crosshair"]["nocrosshaireditsize"])
    checkboxes.renderammo = new.bool(preset["Patrons"]["renderammo"])
    checkboxes.singleclip = new.bool(preset["Patrons"]["singleclip"])
    checkboxes.EternalPatrons = new.bool(preset["Patrons"]["EternalPatrons"])
    ----------------- [ugenrl] ----------------------------
    checkboxes.ugenrl_enable = new.bool(ini.ugenrl_main.enable)
    checkboxes.weapon_checkbox = new.bool(ini.ugenrl_main.weapon)
    checkboxes.enemyweapon_checkbox = new.bool(ini.ugenrl_main.enemyWeapon)
    checkboxes.hit_checkbox = new.bool(ini.ugenrl_main.hit)
    checkboxes.pain_checkbox = new.bool(ini.ugenrl_main.pain)
    ---------------------------------------------------------
    checkboxes.showchat = new.bool(preset["Other"]["showchat"])
    checkboxes.shownicks = new.bool(ini.settings.shownicks)
    checkboxes.showhp = new.bool(ini.settings.showhp)
    checkboxes.showhud = new.bool(preset["Other"]["showhud"])
    checkboxes.unlimitfps = new.bool(ini.settings.unlimitfps)
    checkboxes.postfx = new.bool(ini.effects_manager.postfx)
    checkboxes.nocloudsmall = new.bool(ini.effects_manager.nocloudsmall)
    checkboxes.nocloudbig = new.bool(ini.effects_manager.nocloudbig)
    checkboxes.nocloudhorizont = new.bool(ini.effects_manager.nocloudhorizont)
    checkboxes.nobirds = new.bool(ini.effects_manager.nobirds)
    checkboxes.noshadows = new.bool(ini.settings.noshadows)
    checkboxes.pedshadows = new.bool(ini.settings.pedshadows)
    checkboxes.vehshadows = new.bool(ini.settings.vehshadows)
    checkboxes.poleshadows = new.bool(ini.settings.poleshadows)
    checkboxes.maxshadows = new.bool(ini.settings.maxshadows)
    checkboxes.noplaneline = new.bool(ini.effects_manager.noplaneline)
    checkboxes.tiretracks = new.bool(ini.effects_manager.tiretracks)
    checkboxes.custom_nametags = new.bool(ini.custom_nametags.status)
    checkboxes.moneyzerofix = new.bool(preset["Money"]["moneyzerofix"])
    checkboxes.givemedistobj = new.bool(ini.settings.givemedistobj)
    checkboxes.fullmenuimage = new.bool(preset["MenuPause"]["fullmenuimage"])
    checkboxes.smalliconsradar = new.bool( preset["Radar"]["smalliconsradar"])
    checkboxes.radrarnorth = new.bool(preset["Radar"]["radrarnorth"])
    checkboxes.arrowicon_menu = new.bool(preset["Radar"]["arrowicon_menu"])
    checkboxes.nosparks = new.bool(ini.effects_manager.nosparks)
    checkboxes.nowaterfog = new.bool(ini.effects_manager.nowaterfog)
    checkboxes.nogunfire = new.bool(ini.effects_manager.nogunfire)
    checkboxes.nogunsmoke = new.bool(ini.effects_manager.nogunsmoke)
    checkboxes.nofxsystem = new.bool(ini.effects_manager.nofxsystem)
    checkboxes.noblood = new.bool(ini.effects_manager.noblood)
    checkboxes.noexhaust = new.bool(ini.effects_manager.noexhaust)
    checkboxes.wheelsand = new.bool(ini.effects_manager.wheelsand)
    checkboxes.wheeldust = new.bool(ini.effects_manager.wheeldust)
    checkboxes.wheelmud = new.bool(ini.effects_manager.wheelmud)
    checkboxes.wheelgravel = new.bool(ini.effects_manager.wheelgravel)
    checkboxes.wheelgrass = new.bool(ini.effects_manager.wheelgrass)
    checkboxes.wheelspray = new.bool(ini.effects_manager.wheelspray)
    checkboxes.vehsparks = new.bool(ini.effects_manager.vehsparks)
    checkboxes.nodust =  new.bool(ini.effects_manager.nodust)
    checkboxes.gunshell = new.bool(ini.effects_manager.gunshell)
    checkboxes.teargas = new.bool(ini.effects_manager.teargas)
    checkboxes.footprints = new.bool(ini.effects_manager.footprints)
    checkboxes.nohealthflick = new.bool(ini.settings.nohealthflick)
    checkboxes.swim = new.bool(ini.effects_manager.swim)
    checkboxes.vehdust = new.bool(ini.effects_manager.vehdust)
    checkboxes.vehdmgdust = new.bool(ini.effects_manager.vehdmgdust)
    checkboxes.footdust = new.bool(ini.effects_manager.footdust)
    checkboxes.vehdmgsmoke = new.bool(ini.effects_manager.vehdmgsmoke)
    checkboxes.breakobject = new.bool(ini.effects_manager.breakobject)
    checkboxes.nomorehaze = new.bool(ini.effects_manager.nomorehaze)
    checkboxes.reflectionwater = new.bool(ini.effects_manager.reflectionwater)
    checkboxes.fireworld  = new.bool(ini.effects_manager.fireworld)

    checkboxes.timecyc_creator = new.bool(false)

    ----------------------[ �������� ��������� ���������� ]---------------------------
    checkboxes.EditPatrons = new.bool(preset["Patrons"]["EditPatrons"])
    checkboxes.EditHealth =  new.bool(preset["Health"]["EditHealth"])
    checkboxes.healthborder = new.bool(preset["Health"]["healthborder"])
    checkboxes.EditMoney = new.bool(preset["Money"]["EditMoney"])
    checkboxes.EditBreath = new.bool(preset["Breath"]["EditBreath"])
    checkboxes.breathborder = new.bool(preset["Breath"]["breathborder"])
    checkboxes.eternalBreath = new.bool(preset["Breath"]["eternalBreath"])
    checkboxes.EditArmor = new.bool(preset["Armor"]["EditArmor"])
    checkboxes.armorborder = new.bool(preset["Armor"]["armorborder"])
    checkboxes.eternalArmor = new.bool(preset["Armor"]["eternalArmor"])
    checkboxes.EditWeapon = new.bool(preset["Weapon"]["EditWeapon"])
    checkboxes.EditWanted = new.bool(preset["Wanted"]["EditWanted"])
    checkboxes.eternalwanted = new.bool(preset["Wanted"]["eternalwanted"])
    checkboxes.EditClock = new.bool(preset["Clock"]["EditClock"])
    checkboxes.DrawClock = new.bool(preset["Clock"]["DrawClock"])

    ---------------------------------------------------------

    checkboxes.AutoSetHighPriority = new.bool(ini.settings.AutoSetHighPriority)
    checkboxes.CustomFov = new.bool(ini.settings.CustomFov)
    checkboxes.MotionBlur = new.bool(ini.effects_manager.MotionBlur)
    checkboxes.vehiclenames = new.bool(ini.settings.vehiclenames)
    checkboxes.areanames = new.bool(ini.settings.areanames)

    ------------------- [buffers] --------------------------

    buffers.cnt_fontname = new.char[64](ini.custom_nametags.fontName)
    buffers.cmd_openmenu = new.char[64](ini.commands.openmenu)
    buffers.cmd_settime = new.char[64](ini.commands.settime)
    buffers.cmd_setweather = new.char[64](ini.commands.setweather)
    buffers.cmd_blockservertime = new.char[64](ini.commands.blockservertime)
    buffers.cmd_blockserverweather = new.char[64](ini.commands.blockserverweather)
    buffers.cmd_givemedist = new.char[64](ini.commands.givemedist)
    buffers.cmd_givemedistnames = new.char[64](ini.commands.givemedistnames)
    buffers.cmd_drawdistance = new.char[64](ini.commands.drawdistance)
    buffers.cmd_drawdistanceair = new.char[64](ini.commands.drawdistanceair)
    buffers.cmd_drawdistancepara = new.char[64](ini.commands.drawdistancepara)
    buffers.cmd_fogdistance = new.char[64](ini.commands.fogdistance)
    buffers.cmd_loddistance = new.char[64](ini.commands.loddistance)
    buffers.cmd_offradio = new.char[64](ini.commands.offradio)
    buffers.cmd_shownicks = new.char[64](ini.commands.shownicks)
    buffers.cmd_showhp = new.char[64](ini.commands.showhp)
    buffers.cmd_showchat = new.char[64](ini.commands.showchat)
    buffers.cmd_showhud = new.char[64](ini.commands.showhud)
    buffers.cmd_fpslock = new.char[64](ini.commands.fpslock)
    buffers.cmd_postfx = new.char[64](ini.commands.postfx)
    buffers.cmd_antiblockedplayer = new.char[64](ini.commands.antiblockedplayer)
    buffers.cmd_animmoney = new.char[64](ini.commands.animmoney)
    buffers.cmd_chatopenfix = new.char[64](ini.commands.chatopenfix)
    buffers.cmd_autocleaner = new.char[64](ini.commands.autocleaner)
    buffers.cmd_cleanmemory = new.char[64](ini.commands.cleanmemory)
    buffers.cmd_cleaninfo = new.char[64](ini.commands.cleaninfo)
    buffers.cmd_setmbforautocleaner = new.char[64](ini.commands.setmbforautocleaner)
    buffers.cmd_nobirds = new.char[64](ini.commands.nobirds)
    buffers.cmd_opentimecyccreator = new.char[64](ini.commands.opentimecyccreator)
    buffers.cmd_editcrosshair = new.char[64](ini.commands.editcrosshair)
    buffers.cmd_shadowedit = new.char[64](ini.commands.shadowedit)
    buffers.cmd_nocloudbig = new.char[64](ini.commands.nocloudbig)
    buffers.cmd_nocloudsmall = new.char[64](ini.commands.nocloudsmall)
    buffers.cmd_nocloudhorizont = new.char[64](ini.commands.nocloudhorizont)
    buffers.cmd_noshadows = new.char[64](ini.commands.noshadows)
    buffers.cmd_fixcrosshair = new.char[64](ini.commands.fixcrosshair)
    buffers.cmd_intrun = new.char[64](ini.commands.intrun)
    buffers.cmd_waterfixquadro = new.char[64](ini.commands.waterfixquadro)
    buffers.cmd_longarmfix = new.char[64](ini.commands.longarmfix)
    buffers.cmd_fixblackroads = new.char[64](ini.commands.fixblackroads)
    buffers.cmd_fixsens = new.char[64](ini.commands.sensfix)
    buffers.cmd_audiostream = new.char[64](ini.commands.audiostream)
    buffers.cmd_intmusic = new.char[64](ini.commands.intmusic)
    buffers.cmd_nosounds = new.char[64](ini.commands.sounds)
    buffers.cmd_noplaneline = new.char[64](ini.commands.noplaneline)
    buffers.cmd_sunfix = new.char[64](ini.commands.sunfix)
    buffers.cmd_targetblip = new.char[64](ini.commands.targetblip)
    buffers.fullmenuheight = new.float(ini.settings.fullmenuheight)
    buffers.fullmenuwidth = new.float(ini.settings.fullmenuwidth)
    buffers.cmd_radarwidth = new.char[64](ini.commands.radarWidth)
    buffers.cmd_radarheight = new.char[64](ini.commands.radarHeight)
    buffers.cmd_radarx = new.char[64](ini.commands.radarx)
    buffers.cmd_radary = new.char[64](ini.commands.radary)
    buffers.cmd_ugenrl = new.char[64](ini.commands.ugenrl)
    buffers.cmd_uds = new.char[64](ini.commands.uds)
    buffers.cmd_uss = new.char[64](ini.commands.uss)
    buffers.cmd_ums = new.char[64](ini.commands.ums)
    buffers.cmd_urs = new.char[64](ini.commands.urs)
    buffers.cmd_ubs = new.char[64](ini.commands.ubs)
    buffers.cmd_uuzi = new.char[64](ini.commands.uuzi)
    buffers.cmd_ump5 = new.char[64](ini.commands.ump5)
    buffers.cmd_ups = new.char[64](ini.commands.ups)
    buffers.cmd_ugd = new.char[64](ini.commands.ugd)
    buffers.cmd_ugvw = new.char[64](ini.commands.ugvw)
    buffers.cmd_ugvh = new.char[64](ini.commands.ugvh)
    buffers.cmd_ugvp = new.char[64](ini.commands.ugvp)
    buffers.cmd_forceaniso = new.char[64](ini.commands.forceaniso)
    buffers.cmd_mapzoomfixer = new.char[64](ini.commands.mapzoomfixer)
    buffers.cmd_shadowcp = new.char[64](ini.commands.shadowcp)
    buffers.cmd_shadowlight = new.char[64](ini.commands.shadowlight)
    buffers.cmd_dual_monitor_fix = new.char[64](ini.commands.dual_monitor_fix)
    buffers.cmd_radarfix = new.char[64](ini.commands.radarfix)
    buffers.cmd_brightness = new.char[64](ini.commands.brightness)
    buffers.cmd_nolimitmoneyhud = new.char[64](ini.commands.nolimitmoneyhud)
    buffers.cmd_tiretracks = new.char[64](ini.commands.tiretracks)
    buffers.cmd_tws = new.char[64](ini.commands.tws)
    buffers.cmd_fixtimecyc = new.char[64](ini.commands.fixtimecyc)
    buffers.cmd_aamb = new.char[64](ini.commands.aamb)
    buffers.cmd_oamb = new.char[64](ini.commands.oamb)
    buffers.cmd_wamb = new.char[64](ini.commands.wamb)
    buffers.cmd_ntgs = new.char[64](ini.commands.ntgs)
    buffers.cmd_moneyzerofix = new.char[64](ini.commands.moneyzerofix)
    buffers.cmd_givemedistobj = new.char[64](ini.commands.givemedistobj)
    buffers.cmd_setfps = new.char[64](ini.commands.setfps)
    buffers.cmd_vehfps = new.char[64](ini.commands.vehfps)
    buffers.cmd_bikefps = new.char[64](ini.commands.bikefps)
    buffers.cmd_motofps =  new.char[64](ini.commands.motofps)
    buffers.cmd_boatfps = new.char[64](ini.commands.boatfps)
    buffers.cmd_planefps = new.char[64](ini.commands.planefps)
    buffers.cmd_helifps = new.char[64](ini.commands.helifps)
    buffers.cmd_swimfps = new.char[64](ini.commands.swimfps)
    buffers.cmd_snipergunfps = new.char[64](ini.commands.snipergunfps)
    buffers.cmd_spraygunfps = new.char[64](ini.commands.spraygunfps)



    ------------------- [icolors] ----------------------------
    icolors.wamb = new.float[3](ini.fixtimecyc.worldambientR, ini.fixtimecyc.worldambientG, ini.fixtimecyc.worldambientB)
    icolors.PLeftUp = new.float[4](ini.PLeftUp.r, ini.PLeftUp.g, ini.PLeftUp.b, ini.PLeftUp.a)
    icolors.PLeftDown = new.float[4](ini.PLeftDown.r, ini.PLeftDown.g, ini.PLeftDown.b, ini.PLeftDown.a)
    icolors.PRightUp = new.float[4](ini.PRightUp.r, ini.PRightUp.g, ini.PRightUp.b, ini.PRightUp.a)
    icolors.PRightDown = new.float[4](ini.PRightDown.r, ini.PRightDown.g, ini.PRightDown.b, ini.PRightDown.a)
    icolors.WindowBG = new.float[4](ini.WindowBG.r, ini.WindowBG.g, ini.WindowBG.b, ini.WindowBG.a)
    icolors.�olorChildMenu = new.float[4](ini.�olorChildMenu.r, ini.�olorChildMenu.g, ini.�olorChildMenu.b, ini.�olorChildMenu.a)
    --  icolors.�olorFoneImg = new.float[4](ini.�olorFoneImg.r, ini.�olorFoneImg.g, ini.�olorFoneImg.b, ini.�olorFoneImg.a)

    icolors.ColorNavi = new.float[4](ini.ColorNavi.r, ini.ColorNavi.g, ini.ColorNavi.b, ini.ColorNavi.a)
    icolors.ActiveText = new.float[4](ini.ActiveText.r, ini.ActiveText.g, ini.ActiveText.b, ini.ActiveText.a)
    icolors.PassiveText = new.float[4](ini.PassiveText.r, ini.PassiveText.g, ini.PassiveText.b, ini.PassiveText.a)
    icolors.ColorText = new.float[4](ini.ColorText.r, ini.ColorText.g, ini.ColorText.b, ini.ColorText.a)
    icolors.FrameBg = new.float[4](ini.FrameBg.r, ini.FrameBg.g, ini.FrameBg.b, ini.FrameBg.a)
    icolors.FrameBgHovered = new.float[4](ini.FrameBgHovered.r, ini.FrameBgHovered.g, ini.FrameBgHovered.b, ini.FrameBgHovered.a)
    icolors.FrameBgActive = new.float[4](ini.FrameBgActive.r, ini.FrameBgActive.g, ini.FrameBgActive.b, ini.FrameBgActive.a)
    icolors.CheckMark = new.float[4](ini.CheckMark.r, ini.CheckMark.g, ini.CheckMark.b, ini.CheckMark.a)
    icolors.SliderGrab = new.float[4](ini.SliderGrab.r, ini.SliderGrab.g, ini.SliderGrab.b, ini.SliderGrab.a)
    icolors.SliderGrabActive = new.float[4](ini.SliderGrabActive.r, ini.SliderGrabActive.g, ini.SliderGrabActive.b, ini.SliderGrabActive.a)
    icolors.Button = new.float[4](ini.Button.r, ini.Button.g, ini.Button.b, ini.Button.a)
    icolors.ButtonHovered = new.float[4](ini.ButtonHovered.r, ini.ButtonHovered.g, ini.ButtonHovered.b, ini.ButtonHovered.a)
    icolors.ButtonActive = new.float[4](ini.ButtonActive.r, ini.ButtonActive.g, ini.ButtonActive.b, ini.ButtonActive.a)
    icolors.Header = new.float[4](ini.Header.r, ini.Header.g, ini.Header.b, ini.Header.a)
    icolors.HeaderHovered = new.float[4](ini.HeaderHovered.r, ini.HeaderHovered.g, ini.HeaderHovered.b, ini.HeaderHovered.a)
    icolors.HeaderActive = new.float[4](ini.HeaderActive.r, ini.HeaderActive.g, ini.HeaderActive.b, ini.HeaderActive.a)
    icolors.ScrollbarBg = new.float[4](ini.ScrollbarBg.r, ini.ScrollbarBg.g, ini.ScrollbarBg.b, ini.ScrollbarBg.a)
    icolors.ScrollbarGrab = new.float[4](ini.ScrollbarGrab.r, ini.ScrollbarGrab.g, ini.ScrollbarGrab.b, ini.ScrollbarGrab.a)
    icolors.ScrollbarGrabHovered = new.float[4](ini.ScrollbarGrabHovered.r, ini.ScrollbarGrabHovered.g, ini.ScrollbarGrabHovered.b, ini.ScrollbarGrabHovered.a)
    icolors.ScrollbarGrabActive = new.float[4](ini.ScrollbarGrabActive.r, ini.ScrollbarGrabActive.g, ini.ScrollbarGrabActive.b, ini.ScrollbarGrabActive.a)
    icolors.LogoColor = new.float[4](ini.logocolor.r, ini.logocolor.g, ini.logocolor.b, ini.logocolor.a)
    icolors. BeginColor = new.float[4](ini.BeginColor.r, ini.BeginColor.g, ini.BeginColor.b, ini.BeginColor.a)

    --------------------------------------------
    icolors.RECOLORER_HEALTH = new.float[4](explode_rgba(preset["Recolorer"]["Health"]))
    icolors.RECOLORER_ARMOUR = new.float[4](explode_rgba(preset["Recolorer"]["Armor"]))
    icolors.RECOLORER_PLAYERHEALTH = new.float[4](explode_rgba(preset["Recolorer"]["PlayerHealth"]))
    icolors.RECOLORER_PLAYERHEALTH2 = new.float[4](explode_rgba(preset["Recolorer"]["PlayerHealth2"]))
    icolors.RECOLORER_PLAYERARMOR = new.float[4](explode_rgba(preset["Recolorer"]["PlayerArmor"]))
    icolors.RECOLORER_PLAYERARMOR2 = new.float[4](explode_rgba(preset["Recolorer"]["PlayerArmor2"]))
    icolors.RECOLORER_MONEY = new.float[4](explode_rgba(preset["Recolorer"]["Money"]))
    icolors.RECOLORER_STARS = new.float[4](explode_rgba(preset["Recolorer"]["Stars"]))
    icolors.RECOLORER_PATRONS = new.float[4](explode_rgba(preset["Recolorer"]["Patrons"]))

    icolors.IndicatorHP_color = new.float[4](explode_rgba(preset["HPHud"]["Color"]))
    icolors.IndicatorARMOR_color = new.float[4](explode_rgba(preset["ArmorHud"]["Color"]))

    ---------------------------- [ other ] -----------------------------
    ivar = new.int(tonumber(preset["Money"]["animmoney"]))
    gmodevar = new.int(tonumber(ini.ugenrl_main.mode))
    fontmoneybordervar = new.int(tonumber(preset["Money"]["fontmoneyborder"]))
    fontoutlineclockvar = new.int(tonumber(ini.settings.fontoutlineclock))
    fontmoneystylevar = new.int(tonumber(preset["Money"]["fontmoneystyle"]))
    fontammostylevar = new.int(tonumber(preset["Patrons"]["fontammostyle"]))
    fontstyleclockvar = new.int(tonumber(preset["Clock"]["fontstyleclock"]))
    fontmenubasestylevar = new.int(tonumber(preset["MenuPause"]["fontmenubasestyle"]))
    fontmenuheaderstylevar = new.int(tonumber(preset["MenuPause"]["fontmenuheaderstyle"]))
    fontmenutumblerstylevar = new.int(tonumber(preset["MenuPause"]["fontmenutumblerstyle"]))
    fontstylehpvar = new.int(tonumber(preset["HPHud"]["fonts"]))
    fontstylearmvar = new.int(tonumber(preset["ArmorHud"]["fonts"]))
    ---------------------------------------------------------------------
    

end
imgui_Data()

-- const data
buffers.multilineText = new.char[14000]()
buffers.search_cmd = new.char[64]()
buffers.IEpresetName = new.char[128]()
---------------------------------------------------------------



local imguiInputsCmdEditor = {
    [u8"������� ���� �������"] = {var = buffers.cmd_openmenu, cfg = "openmenu"},
    [u8"������� ���� ��������� ������ � �������"] = {var = buffers.cmd_tws, cfg = "tws"},
    [u8"�������� �����"] = {var = buffers.cmd_settime, cfg = "settime"},
    [u8"�������� ������"] = {var = buffers.cmd_setweather, cfg = "setweather"},
    [u8"����������� ��������� ������� ��������"] = {var = buffers.cmd_blockservertime, cfg = "blockservertime"},
    [u8"����������� ��������� ������ ��������"] = {var = buffers.cmd_blockserverweather, cfg = "blockserverweather"},
    [u8"�������� / ��������� ����������� ������ ����������"] = {var = buffers.cmd_givemedist, cfg = "givemedist"},
    [u8"�������� ��������� ����������"] = {var = buffers.cmd_drawdistance, cfg = "drawdistance"},
    [u8"�������� ��������� ���������� ��� ���������� ����������"] = {var = buffers.cmd_drawdistanceair, cfg = "drawdistanceair"},
    [u8"�������� ��������� ���������� ��� ������������� ��������"] = {var = buffers.cmd_drawdistancepara, cfg = "drawdistancepara"},
    [u8"�������� ��������� ������"] = {var = buffers.cmd_fogdistance, cfg = "fogdistance"},
    [u8"�������� ��������� �����"] = {var = buffers.cmd_loddistance, cfg = "loddistance"},
    [u8"�������� �������"] = {var = buffers.cmd_brightness, cfg = "brightness"},
    [u8"�������� / ��������� ����� � ����������"] = {var = buffers.cmd_offradio, cfg = "offradio"},
    [u8"������ ���"] = {var = buffers.cmd_showchat, cfg = "showchat"},
    [u8"������ HUD"] = {var = buffers.cmd_showhud, cfg = "showhud"},
    [u8"�������� / ������ ���� �������"] = {var = buffers.cmd_shownicks, cfg = "shownicks"},
    [u8"�������� / ������ �� �������"] = {var = buffers.cmd_showhp, cfg = "showhp"},
    [u8"�������� �������� �������� ��������� ���-�� �����"] = {var = buffers.cmd_animmoney, cfg = "animmoney"},
    [u8"�������� / ��������� ������������ ���"] = {var = buffers.cmd_fpslock, cfg = "fpslock"},
    [u8"�������� / ��������� ����-���������"] = {var = buffers.cmd_postfx, cfg = "postfx"},
    [u8"�������� / ��������� ����������� ����������� � ������ ������� ��� ������"] = {var = buffers.cmd_antiblockedplayer, cfg = "antiblockedplayer"},
    [u8"�������� / ��������� �������� ���� �� ������� \"�\""] = {var = buffers.cmd_chatopenfix, cfg = "chatopenfix"},
    [u8"�������� / ��������� ����-������� ������"] = {var = buffers.cmd_autocleaner, cfg = "autocleaner"},
    [u8"�������� ������"] = {var = buffers.cmd_cleanmemory, cfg = "cleanmemory"},
    [u8"��������  / ��������� ��������� �� ������� ������"] = {var = buffers.cmd_cleaninfo, cfg = "cleaninfo"},
    [u8"���������� ����� � ���������� ��� ����-������� ������"] = {var = buffers.cmd_setmbforautocleaner, cfg = "setmbforautocleaner"},
    [u8"�������� / ��������� ����"] = {var = buffers.cmd_nobirds, cfg = "nobirds"},
    [u8"������� ���� ��������� ���������"] = {var = buffers.cmd_opentimecyccreator, cfg = "opentimecyccreator"},
    [u8"�������� / ��������� ����������� ��������� ��� nopostfx"] = {var = buffers.cmd_fixtimecyc, cfg = "fixtimecyc"},
    [u8"�������� ����� ��������� ��������� ����"] = {var = buffers.cmd_aamb, cfg = "aamb"},
    [u8"�������� ��������� �������� � �����"] = {var = buffers.cmd_oamb, cfg = "oamb"},
    [u8"�������� ���� ��������� � ������� RGB"] = {var = buffers.cmd_wamb, cfg = "wamb"},
    [u8"�������� ������ �������"] = {var = buffers.cmd_editcrosshair, cfg = "editcrosshair"},
    [u8"�������� / ��������� ���������� ������ ����"] = {var = buffers.cmd_shadowedit, cfg = "shadowedit"},
    [u8"�������� / ��������� ������� ������"] = {var = buffers.cmd_nocloudbig, cfg = "nocloudbig"},
    [u8"�������� / ��������� ������ ������"] = {var = buffers.cmd_nocloudsmall, cfg = "nocloudsmall"},
    [u8"�������� / ��������� ������ �� ���������"] = {var = buffers.cmd_nocloudhorizont, cfg = "nocloudhorizont"},
    [u8"�������� / ��������� ���� ����"] = {var = buffers.cmd_noshadows, cfg = "noshadows"},
    [u8"�������� / ��������� ����������� ����� ����� �� �������"] = {var = buffers.cmd_fixcrosshair, cfg = "fixcrosshair"},
    [u8"�������� / ��������� ����������� ���� � ����������"] = {var = buffers.cmd_intrun, cfg = "intrun"},
    [u8"�������� / ��������� ����������� ���������� ����"] = {var = buffers.cmd_waterfixquadro, cfg = "waterfixquadro"},
    [u8"�������� / ��������� ����������� ������� ��� ��� ���� �� 2-� �������� �/�"] = {var = buffers.cmd_longarmfix, cfg = "longarmfix"},
    [u8"�������� / ��������� ����������� ������ �����"] = {var = buffers.cmd_fixblackroads, cfg = "fixblackroads"},
    [u8"�������� / ��������� ����������� ���������������� ����� �� ���� X � Y"] = {var = buffers.cmd_fixsens, cfg = "fixsens"},
    [u8"�������� / ��������� ����������"] = {var = buffers.cmd_audiostream, cfg = "audiostream"},
    [u8"����� ����� �� ���������� ����� � ����"] = {var = buffers.cmd_nolimitmoneyhud, cfg = "nolimitmoneyhud"},
    [u8"�������� / ��������� ������ � ����������"] = {var = buffers.cmd_intmusic, cfg = "intmusic"},
    [u8"�������� / ��������� ����� ����"] = {var = buffers.cmd_nosounds, cfg = "nosounds"},
    [u8"�������� / ��������� ������ �� ��������� �� ����"] = {var = buffers.cmd_noplaneline, cfg = "noplaneline"},
    [u8"�������� / ��������� ������"] = {var = buffers.cmd_sunfix, cfg = "sunfix"},
    [u8"�������� / ��������� ������ �� �������"] = {var = buffers.cmd_targetblip, cfg = "targetblip"},
    [u8"�������� / ��������� �������� ������"] = {var = buffers.cmd_radarfix, cfg = "radarfix"},
    [u8"�������� / ��������� ����������� ������ ����� �� ������ �������"] = {var = buffers.cmd_dual_monitor_fix, cfg = "dual_monitor_fix"},
    [u8"�������� ������ ������"] = {var = buffers.cmd_radarwidth, cfg = "radarwidth"},
    [u8"�������� ������ ������"] = {var = buffers.cmd_radarheight, cfg = "radarheight"},
    [u8"�������� ������� ������ �� X"] = {var = buffers.cmd_radarx, cfg = "radarx"},
    [u8"�������� ������� ������ �� Y"] = {var = buffers.cmd_radary, cfg = "radary"},
    [u8"�������� / ��������� Ultimate Genrl"] = {var = buffers.cmd_ugenrl, cfg = "ugenrl"},
    [u8"�������� ���� deagle"] = {var = buffers.cmd_uds, cfg = "uds"},
    [u8"�������� ���� shotgun"] = {var = buffers.cmd_uss, cfg = "uss"},
    [u8"�������� ���� m4"] = {var = buffers.cmd_ums, cfg = "ums"},
    [u8"�������� ���� rifle"] = {var = buffers.cmd_urs, cfg = "urs"},
    [u8"�������� ���� uzi"] = {var = buffers.cmd_uuzi, cfg = "uuzi"},
    [u8"�������� ���� mp5"] = {var = buffers.cmd_ump5, cfg = "ump5"},
    [u8"�������� ���� ���������"] = {var = buffers.cmd_ubs, cfg = "ubs"},
    [u8"�������� ���� ����"] = {var = buffers.cmd_ups, cfg = "ups"},
    [u8"�������� ��������� ������ ������ �������"] = {var = buffers.cmd_ugd, cfg = "ugd"},
    [u8"�������� ��������� ����� ���������"] = {var = buffers.cmd_ugvw, cfg = "ugvw"},
    [u8"�������� ��������� ����� ���������"] = {var = buffers.cmd_ugvh, cfg = "ugvh"},
    [u8"�������� ��������� ����� ����"] = {var = buffers.cmd_ugvp, cfg = "ugvp"},
    [u8"�������� / ��������� ������������ ���������� �������"] = {var = buffers.cmd_forceaniso, cfg = "forceaniso"},
    [u8"�������� / ��������� ����������� ������ ���������������� ��� ���� �����"] = {var = buffers.cmd_mapzoomfixer, cfg = "mapzoomfixer"},
    [u8"�������� �������� ����"] = {var = buffers.cmd_shadowcp, cfg = "shadowcp"},
    [u8"�������� ���� �������"] = {var = buffers.cmd_shadowlight, cfg = "shadowlight"},
    [u8"�������� / ��������� ����� ���"] = {var = buffers.cmd_tiretracks, cfg = "tiretracks"},
    [u8"�������� ��������� ���������� ���������"] = {var = buffers.cmd_ntgs, cfg = "ntgs"},
    [u8"����������� ������� ����������� �����"] = {var = buffers.cmd_moneyzerofix, cfg = "moneyzerofix"},
    [u8"�������� / ��������� ����������� ������ ��������� ��������� ��������"] = {var = buffers.cmd_givemedistobj, cfg = "givemedistobj"},
    [u8"�������� / ��������� ����������� ������ ���������� ���������"] = {var = buffers.cmd_givemedistnames, cfg = "givemedistnames"},
    [u8"�������� ��� � ���"] = {var = buffers.cmd_setfps, cfg = "setfps"},
    [u8"�������� ��� � ����"] = {var = buffers.cmd_vehfps, cfg = "vehfps"},
    [u8"�������� ��� � �����������"] = {var = buffers.cmd_bikefps, cfg = "bikefps"},
    [u8"�������� ��� � ����������"] = {var = buffers.cmd_motofps, cfg = "motofps"},
    [u8"�������� ��� � ������"] = {var = buffers.cmd_boatfps, cfg = "boatfps"},
    [u8"�������� ��� � ���������"] = {var = buffers.cmd_planefps, cfg = "planefps"},
    [u8"�������� ��� � ����������"] = {var = buffers.cmd_helifps, cfg = "helifps"},
    [u8"�������� ��� �� ����� ��������"] = {var = buffers.cmd_swimfps, cfg = "swimfps"},
    [u8"�������� ��� ���������"] = {var = buffers.cmd_snipergunfps, cfg = "snipergunfps"},
    [u8"�������� ��� Spray Can"] = {var = buffers.cmd_spraygunfps, cfg = "cmd_spraygunfps"},
}

local imguiCheckboxesPatches = {
    [u8"��������� ��� �� � (��� ���� ������� �� �������� ���������� ������� T)"] = {var = checkboxes.chatt, cfg = "chatt", fnc = "_"},
    [u8"C���� ����� �� ����������� ����� � ����"] = {var = checkboxes.nolimitmoneyhud, cfg = "nolimitmoneyhud", fnc = "NoLimitMoneyHud"},
    [u8"������� ������"] = {var = checkboxes.sunfix, cfg = "sunfix", fnc = "SunFix"},
    [u8"��������� ����������� �������� � ��������� ������"] = {var = checkboxes.treepitching, cfg = "treepitching", fnc = "TreePitching"},
    [u8"���� �������� ������� � �������, ����� ����� � ����� �������"] = {var = checkboxes.patchduck, cfg = "patchduck", fnc = "PatchDuck"},
    [u8"���� ���� �� ����������, ����� ����������� �� 2-� �������� �/c � ����������"] = {var = checkboxes.FixArrowPassMotoBike, cfg = "FixArrowPassMotoBike", fnc = "FixArrowPassMotoBike"},
    [u8"AntiCrash - ������� ������ �� �������� � ��� � ����� �������� ��"] = {var = checkboxes.anticrash, cfg = "anticrash", fnc = "AntiCrash"},
    [u8"������������� ������� ��������� \"�������\" ��� ����"] = {var = checkboxes.AutoSetHighPriority, cfg = "AutoSetHighPriority", fnc = "_"},
    [u8"������� ����������� �������� ���������� ��� �������"] = {var = checkboxes.vehiclenames, cfg = "vehiclenames", fnc = "VehicleNames"},
    [u8"������� ����������� �������� �������"] = {var = checkboxes.areanames, cfg = "areanames", fnc = "AreaNames"},
}

local imguiCheckboxesFixes = {
    [u8"����������� ����������� � ������ ������� ��� ������"] = {var = checkboxes.antiblockedplayer, cfg = "antiblockedplayer", fnc = "_"},
    [u8"����������� ���������������� ����� �� ���� X � Y"] = {var = checkboxes.sensfix, cfg = "sensfix", fnc = "FixSensitivity"},
    [u8"����������� ������ �����"] = {var = checkboxes.fixblackroads, cfg = "fixblackroads", fnc = "FixBlackRoads"},
    [u8"����������� ������� ��� ��� ���� �� 2-� �������� �/�"] = {var = checkboxes.longarmfix, cfg = "longarmfix", fnc = "FixLongArm"},
    [u8"����������� ���������� ����"] = {var = checkboxes.waterfixquadro, cfg = "waterfixquadro", fnc = "FixWaterQuadro"},
    [u8"����������� ���� � ����������"] = {var = checkboxes.intrun, cfg = "intrun", fnc = "InteriorRun"},
    [u8"����������� ����� ����� �� �������"] = {var = checkboxes.fixcrosshair, cfg = "fixcrosshair", fnc = "FixCrosshair"},
    [u8"����������� ������ ����� �� ������ �������"] = {var = checkboxes.dual_monitor_fix, cfg = "dual_monitor_fix", fnc = "_"},
    [u8"����������� ���� �� ��������� [������������ ����������]"] = {var = checkboxes.forceaniso, cfg = "forceaniso", fnc = "ForceAniso"},
    [u8"����������� ������ ���������������� ��� ���� �����"] = {var = checkboxes.mapzoomfixer, cfg = "mapzoomfixer", fnc = "_"},
    [u8"����������� ������ �������� ����� � ���� ESC"] = {var = checkboxes.fixloadmap, cfg = "fixloadmap", fnc = "FixLoadMap"},
    [u8"����������� ����� ��� ����������� ��������"] = {var = checkboxes.fixbloodwood, cfg = "fixbloodwood", fnc = "FixBloodWood"},
    [u8"����������� �������� (�������� ��������� 75 �� � ���� ��� ��������)"] = {var = checkboxes.refreshratefix, cfg = "refreshratefix", fnc = "_"},
    [u8"����������� �������� ����, ����� ����� � ������� ��� ������ ���� �������"] = {var = checkboxes.ovalityCorrection, cfg = "ovalityCorrection", fnc = "OvalityCorrection"},
}


local imguiCheckboxesBoostFPS = {
    [u8"�������� FPS unlock"] = {var = checkboxes.unlimitfps, cfg = "unlimitfps", fnc = "FPSUnlock"},
    [u8"������ ���� �������"] = {var = checkboxes.shownicks, cfg = "shownicks", fnc = "ShowNICKS"},
    [u8"������ �� �������"] = {var = checkboxes.showhp, cfg = "showhp", fnc = "ShowHP"},
}

local imguiCheckboxesEffectsManagerSky = {
    [u8"��������� ������ ������"] = {var = checkboxes.nocloudsmall, cfg = "nocloudsmall", fnc = "EffectsManager"},
    [u8"��������� ������� ������"] = {var = checkboxes.nocloudbig, cfg = "nocloudbig", fnc = "EffectsManager"},
    [u8"��������� ������ �� ���������"] = {var = checkboxes.nocloudhorizont, cfg = "nocloudhorizont", fnc = "EffectsManager"},
    [u8"��������� ����"] = {var = checkboxes.nobirds, cfg = "nobirds", fnc = "EffectsManager"},
}

local imguiCheckboxesEffectsManagerOther = {
    [u8"��������� ����-���������"] = {var = checkboxes.postfx, cfg = "postfx", fnc = "EffectsManager"},
    [u8"��������� ��� �� ����"] = {var = checkboxes.nofxsystem, cfg = "nofxsystem", fnc = "EffectsManager"},
    [u8"��������� �����"] = {var = checkboxes.noblood, cfg = "noblood", fnc = "EffectsManager"},
    [u8"��������� ����� ��� �� �����"] = {var = checkboxes.footprints, cfg = "footprints", fnc = "EffectsManager"},
    [u8"��������� ������� ����"] = {var = checkboxes.swim, cfg = "swim", fnc = "EffectsManager"},
    [u8"��������� ����� ��� �����"] = {var = checkboxes.nowaterfog, cfg = "nowaterfog", fnc = "EffectsManager"},
    [u8"��������� ���� ��� ������"] = {var = checkboxes.footdust, cfg = "footdust", fnc = "EffectsManager"},
    [u8"��������� ���� ��� ������� ��������"] = {var = checkboxes.breakobject, cfg = "breakobject", fnc = "EffectsManager"},
    [u8"��������� ������ ����"] = {var = checkboxes.nomorehaze, cfg = "nomorehaze", fnc = "EffectsManager"},
    [u8"��������� ����� �� ����"] = {var = checkboxes.reflectionwater, cfg = "reflectionwater", fnc = "EffectsManager"},
    [u8"��������� �����"] = {var = checkboxes.fireworld, cfg = "fireworld", fnc = "EffectsManager"},
    
}

local imguiCheckboxesVehicleEffectsManager = {
    [u8"��������� ����� �� ��� �����"] = {var = checkboxes.wheelsand, cfg = "wheelsand", fnc = "EffectsManager"},
    [u8"��������� ���� �� ��� �����"] = {var = checkboxes.wheeldust, cfg = "wheeldust", fnc = "EffectsManager"},
    [u8"��������� ����� �� ��� �����"] = {var = checkboxes.wheelmud, cfg = "wheelmud", fnc = "EffectsManager"},
    [u8"��������� ������ �� ��� �����"] = {var = checkboxes.wheelgravel, cfg = "wheelgravel", fnc = "EffectsManager"},
    [u8"��������� ����� �� ��� �����"] = {var = checkboxes.wheelgrass, cfg = "wheelgrass", fnc = "EffectsManager"},
    [u8"��������� ��� �� ��� �����"] = {var = checkboxes.wheelspray, cfg = "wheelspray", fnc = "EffectsManager"},
    [u8"��������� ����� ��� ���������"] = {var = checkboxes.vehsparks, cfg = "vehsparks", fnc = "EffectsManager"},
    [u8"��������� ����� ���"] = {var = checkboxes.tiretracks, cfg = "tiretracks", fnc = "EffectsManager"},
    [u8"��������� ��� �� ���� ����������"] = {var = checkboxes.noexhaust, cfg = "noexhaust", fnc = "EffectsManager"},
    [u8"��������� ������ �� ��������� �� ����"] = {var = checkboxes.noplaneline, cfg = "noplaneline", fnc = "EffectsManager"},
    [u8"��������� �������� ����� �����"] = {var = checkboxes.vehtaxilight, cfg = "vehtaxilight", fnc = "EffectsManager"},
    [u8"��������� ���� �� ���������� ����������"] = {var = checkboxes.vehdust, cfg = "vehdust", fnc = "EffectsManager"},
    [u8"��������� ���� ��� ������������"] = {var = checkboxes.vehdmgdust, cfg = "vehdmgdust", fnc = "EffectsManager"},
    [u8"��������� ��� �� ������������� ���������"] = {var = checkboxes.vehdmgsmoke, cfg = "vehdmgsmoke", fnc = "EffectsManager"},
}

local imguiCheckboxesWeaponEffectsManager = {
    [u8"��������� �����"] = {var = checkboxes.nosparks, cfg = "nosparks", fnc = "EffectsManager"},
    [u8"��������� ����� �� ������"] = {var = checkboxes.nogunfire, cfg = "nogunfire", fnc = "EffectsManager"},
    [u8"��������� ��� �� ������"] = {var = checkboxes.nogunsmoke, cfg = "nogunsmoke", fnc = "EffectsManager"},
    [u8"��������� ���� ��� �������� � �����, �����"] = {var = checkboxes.nodust, cfg = "nodust", fnc = "EffectsManager"},
    [u8"��������� �������� ����� ��� ���������"] = {var = checkboxes.gunshell, cfg = "gunshell", fnc = "EffectsManager"},
    [u8"��������� �������� ���� �� ������� �����"] = {var = checkboxes.teargas, cfg = "teargas", fnc = "EffectsManager"},
}



local nameTags = {
    getState = function()
        return memory.getint8(serverPtr + 56, 1)
    end,
    setState = function(state)
        memory.setint8(serverPtr + 56, state)
    end
}
local getBonePosition = ffi.cast("int (__thiscall*)(void*, float*, int, bool)", 0x5E4280)


-------------------
function __genOrderedIndex( t )
    local orderedIndex = {}
    for key in pairs(t) do
        table.insert( orderedIndex, key )
    end
    table.sort( orderedIndex )
    return orderedIndex
end

function orderedNext(t, state)
    local key = nil
    if state == nil then
        t.__orderedIndex = __genOrderedIndex( t )
        key = t.__orderedIndex[1]
    else
        for i = 1,table.getn(t.__orderedIndex) do
            if t.__orderedIndex[i] == state then
                key = t.__orderedIndex[i+1]
            end
        end
    end
    if key then
        return key, t[key]
    end
    t.__orderedIndex = nil
    return
end
function orderedPairs(t)
    return orderedNext, t, nil
end
------------------

local ui_meta = {
    __index = function(self, v)
        if v == "switch" then
            local switch = function()
                if self.process and self.process:status() ~= "dead" then
                    return false -- ���������� �������� ��� �� �����������!
                end
                
                self.timer = os.clock()
                self.state = not self.state
                
                self.process = lua_thread.create(function()
                    local bringFloatTo = function(from, to, start_time, duration)
                        local timer = os.clock() - start_time
                        local count = timer / (duration / 100)
                        return (timer >= 0.00 and timer <= duration) and count * ((to - from) / 100) or (timer > duration and to or from)
                    end

                    for i = 0, 1000 do
                        wait(0)
                        local a = bringFloatTo(0.00, 1.00, self.timer, self.duration)
                        self.alpha = self.state and a or 1.00 - a
                        if a == 1.00 then break end
                    end
                end)
                
                return true -- ��������� ���� ��������!
            end
            
            return switch
        end
        
        if v == "alpha" then
            return self.state and 1.00 or 0.00
        end
    end
}



local gfmenu = { state = false, duration = 0.800 }
setmetatable(gfmenu, ui_meta)

local twsmenu = { state = false, duration = 0.800 }
setmetatable(twsmenu, ui_meta)

local timecyc_creator = { state = false, duration = 0.800 }
setmetatable(timecyc_creator, ui_meta)

function LoadPatch()
    writeMemory(0x5B8E55, 4, 90000, true)--flickr
    writeMemory(0x5B8EB0, 4, 90000, true)--flickr
    
    memory.setfloat(0xB5FCC8, 0xEEFCEA, true) -- audiofix (Ugenrl work if radio 0)
    writeMemory(0x5EFFE7, 1, 0xEB, true)-- disable talking
    memory.fill(0x5557CF, 0x90, 7, true) -- binthesky by DK
    writeMemory(0x53E94C, 1, 0, true) --del fps delay 14 ms
    writeMemory(0x745BC9, 2, 0x9090, true) --SADisplayResolutions(1920x1080// 16:9)
    memory.write(12761548, 1051965045, 4, true) --car speed fps fix
    memory.fill(0x555854, 0x90, 5, true) --InterioRreflections
    memory.fill(0x57733B, 0x90, 5, true)--��������� �������� �� ������ "������ ����� ����" � ���� �����

    
    if ini.settings.AutoSetHighPriority then ffi.C.SetPriorityClass(ffi.C.GetCurrentProcess(), 0x00000080) end
end

function onSystemInitialized()
    local originalVol = memory.getfloat(0xB5FCC8, true)
    memory.setfloat(0xEEFCEA, originalVol, true)
    if originalVol < 0.0625 then
        memory.setfloat(0xB5FCC8, 0.1000, true)
    end
    LoadPatch()
end

--====================================== | Timecyc Editor | ============================
local weather = {
	[0]  = u8"�KC�PACO��E��A� LA",
	[1]  = u8"CO��E��A� LA",
	[2]  = u8"�KC�PACO��E��A� C�O� LA",
	[3]  = u8"CO��E��A� � C�O� LA",
	[4]  = u8"�E�PE��A� LA",
	[5]  = u8"CO��E��A� SF",
	[6]  = u8"�KC�PACO��E��A� SF",
	[7]  = u8"O��A��A� SF",
	[8]  = u8"�O�����A� SF",
	[9]  = u8"�Y�A��A� SF",
	[10] = u8"CO��E��A� VEGAS",
	[11] = u8"�KC�PACO��E��A� VEGAS",
	[12] = u8"O��A��A� VEGAS",
	[13] = u8"�KC�PACO��E��A� �A�OPO��A�",
	[14] = u8"CO��E��A� �A�OPO��A�",
	[15] = u8"�E�PE��A� �A�OPO��A�",
	[16] = u8"�O�����A� �A�OPO��A�",
	[17] = u8"�KC�PA CO��E��A� �YC����",
	[18] = u8"CO��E��A� �YC����",
	[19] = u8"�YP� � �YC����",
	[20] = u8"�O� �O�O�",
	[21] = u8"�O�. ��E�A 1",
	[22] = u8"�O�. ��E�A 2"
}
local weatherchar = imgui.new['const char*'][#weather+1](weather)

local CTimeCycle = {
	m_nAmbientRed 				= ffi.cast("unsigned char*", memory.getuint32(0x560C61)),
	m_nAmbientGreen 			= ffi.cast("unsigned char*", memory.getuint32(0x55F4D6)),
	m_nAmbientBlue 				= ffi.cast("unsigned char*", memory.getuint32(0x55F4E8)),
	m_nAmbientRed_Obj 			= ffi.cast("unsigned char*", memory.getuint32(0x55F4FA)),
	m_nAmbientGreen_Obj 		= ffi.cast("unsigned char*", memory.getuint32(0x55F50C)),
	m_nAmbientBlue_Obj 			= ffi.cast("unsigned char*", memory.getuint32(0x55F51E)),
	m_nSkyTopRed 				= ffi.cast("unsigned char*", memory.getuint32(0x55F531)),
	m_nSkyTopGreen 				= ffi.cast("unsigned char*", memory.getuint32(0x55F53D)),
	m_nSkyTopBlue 				= ffi.cast("unsigned char*", memory.getuint32(0x55F549)),
	m_nSkyBottomRed				= ffi.cast("unsigned char*", memory.getuint32(0x55F555)),
	m_nSkyBottomGreen 			= ffi.cast("unsigned char*", memory.getuint32(0x55F561)),
	m_nSkyBottomBlue 			= ffi.cast("unsigned char*", memory.getuint32(0x55F56D)),
	m_nSunCoreRed 				= ffi.cast("unsigned char*", memory.getuint32(0x55F579)),
	m_nSunCoreGreen 			= ffi.cast("unsigned char*", memory.getuint32(0x55F585)),
	m_nSunCoreBlue 				= ffi.cast("unsigned char*", memory.getuint32(0x55F591)),
	m_nSunCoronaRed 			= ffi.cast("unsigned char*", memory.getuint32(0x55F59D)),
	m_nSunCoronaGreen 			= ffi.cast("unsigned char*", memory.getuint32(0x55F5A9)),
	m_nSunCoronaBlue 			= ffi.cast("unsigned char*", memory.getuint32(0x55F5B5)),
	m_fSunSize 					= ffi.cast("unsigned char*", memory.getuint32(0x55F5C0)),
	m_fSpriteSize 				= ffi.cast("unsigned char*", memory.getuint32(0x55F5D2)),
	m_fSpriteBrightness 		= ffi.cast("unsigned char*", memory.getuint32(0x55F5E4)),
	m_nShadowStrength 			= ffi.cast("unsigned char*", memory.getuint32(0x55F5F7)),
	m_nLightShadowStrength		= ffi.cast("unsigned char*", memory.getuint32(0x55F603)),
	m_nPoleShadowStrength 		= ffi.cast("unsigned char*", memory.getuint32(0x55F60F)),
	m_fFarClip 					= ffi.cast("short*", memory.getuint32(0x55F61B)),
	m_fFogStart 				= ffi.cast("short*", memory.getuint32(0x55F62E)),
	m_fLightsOnGroundBrightness = ffi.cast("unsigned char*", memory.getuint32(0x55F640)),
	m_nLowCloudsRed 			= ffi.cast("unsigned char*", memory.getuint32(0x55F653)),
	m_nLowCloudsGreen 			= ffi.cast("unsigned char*", memory.getuint32(0x55F65F)),
	m_nLowCloudsBlue 			= ffi.cast("unsigned char*", memory.getuint32(0x55F66B)),
	m_nFluffyCloudsBottomRed 	= ffi.cast("unsigned char*", memory.getuint32(0x55F677)),
	m_nFluffyCloudsBottomGreen 	= ffi.cast("unsigned char*", memory.getuint32(0x55F683)),
	m_nFluffyCloudsBottomBlue 	= ffi.cast("unsigned char*", memory.getuint32(0x55F690)),
	m_fWaterRed 				= ffi.cast("unsigned char*", memory.getuint32(0x55F69C)),
	m_fWaterGreen 				= ffi.cast("unsigned char*", memory.getuint32(0x55F6B0)),
	m_fWaterBlue 				= ffi.cast("unsigned char*", memory.getuint32(0x55F6C3)),
	m_fWaterAlpha 				= ffi.cast("unsigned char*", memory.getuint32(0x55F6D6)),
	m_fPostFx1Red 				= ffi.cast("unsigned char*", memory.getuint32(0x55F6E9)),
	m_fPostFx1Green 			= ffi.cast("unsigned char*", memory.getuint32(0x55F6FC)),
	m_fPostFx1Blue 				= ffi.cast("unsigned char*", memory.getuint32(0x55F70F)),
	m_fPostFx1Alpha 			= ffi.cast("unsigned char*", memory.getuint32(0x55F725)),
	m_fPostFx2Red 				= ffi.cast("unsigned char*", memory.getuint32(0x55F73B)),
	m_fPostFx2Green 			= ffi.cast("unsigned char*", memory.getuint32(0x55F751)),
	m_fPostFx2Blue 				= ffi.cast("unsigned char*", memory.getuint32(0x55F767)),
	m_fPostFx2Alpha 			= ffi.cast("unsigned char*", memory.getuint32(0x55F77D)),
	m_fCloudAlpha 				= ffi.cast("unsigned char*", memory.getuint32(0x55F793)),
	m_nHighLightMinIntensity 	= ffi.cast("unsigned char*", memory.getuint32(0x55F7A9)),
	m_nWaterFogAlpha 			= ffi.cast("unsigned char*", memory.getuint32(0x55F7B8)),
	m_nDirectionalMult 			= ffi.cast("unsigned char*", memory.getuint32(0x55F7C7)),
	-- funcs
	Initialise 					= ffi.cast("void (__cdecl*)(void)", 0x5BBAC0)
}

local CurrWeather 	= ffi.cast("short*", 0xC81320)
local NextWeather 	= ffi.cast("short*", 0xC8131C)
local Hours 		= ffi.cast("unsigned char*", 0xB70153)
local Minutes 		= ffi.cast("unsigned char*", 0xB70152)
local Seconds 		= ffi.cast("unsigned short*", 0xB70150)
local TimeScale 	= ffi.cast("unsigned int*", 0xB7015C)
local NUMWEATHERS 	= 23

local Im = {
	CurrWeather 		= new.int(CurrWeather[0]),
	NextWeather 		= new.int(NextWeather[0]),
}

--=========================================| END | =====================================
local fonts = {}

local imagesLogo = {}

local jpgFiles = {}

function getJpgFilesInDirectory(directory)
    for filename in lfs.dir(directory) do  -- ������� ������ � ����������
        if filename:match("logo.*.jpg$") then  -- ��������, ������������� �� ���� ������� ����������
            table.insert(jpgFiles, filename)  -- ���������� �������� ����� � �������
        end
    end
    return jpgFiles
end

imgui.OnInitialize(function()
    imgui.GetIO().IniFilename = nil

    SwitchTheStyle()
    local config = imgui.ImFontConfig()
    config.MergeMode = true
    local glyph_ranges = imgui.GetIO().Fonts:GetGlyphRangesCyrillic()
    local path = getFolderPath(0x14) .. '\\arial.TTF'
    local path2 = getFolderPath(0x14) .. '\\tahomabd.ttf'
    local path3 = getFolderPath(0x14) .. '\\tahomabd.TTF'
    local iconRanges = new.ImWchar[3](fa.min_range, fa.max_range, 0)
    fonts[22] = imgui.GetIO().Fonts:AddFontFromFileTTF(path, 22, nil, glyph_ranges)
    
    logofont = imgui.GetIO().Fonts:AddFontFromFileTTF('moonloader/GameTweaker/fonts/fa-solid-900.ttf', 17.0, config, iconRanges)
    fonts[14] = imgui.GetIO().Fonts:AddFontFromFileTTF(path2, 14.5, nil, glyph_ranges)
    fonts[15] = imgui.GetIO().Fonts:AddFontFromFileTTF(path, 16, nil, glyph_ranges)
    fonts[17] = imgui.GetIO().Fonts:AddFontFromFileTTF(path2, 17, nil, glyph_ranges)
    iconFont = imgui.GetIO().Fonts:AddFontFromFileTTF('moonloader/GameTweaker/fonts/fa-solid-900.ttf', 17.0, config, iconRanges)
    
    fone = imgui.CreateTextureFromFile(getGameDirectory() .. '\\moonloader\\GameTweaker\\fone.jpg')

    for i, filename in pairs(getJpgFilesInDirectory(getGameDirectory() .. '\\moonloader\\GameTweaker')) do
        imagesLogo[i] = imgui.CreateTextureFromFile(getGameDirectory() .. '\\moonloader\\GameTweaker\\'..filename)

    end
    fonts[50] = imgui.GetIO().Fonts:AddFontFromFileTTF(path, 50, nil, glyph_ranges)
end)



------------------------------------------ [FFI cdef] ---------------------------
ffi.cdef [[
    int GetPriorityClass(void* hProcess);
    int SetPriorityClass(void* hProcess, int dwPriorityClass);
    void* GetCurrentProcess();

    uint32_t GetLastError();
    void* OpenProcess(uint32_t dwDesiredAccess, int32_t bInheritHandle, uint32_t dwProcessId);
    int TerminateProcess(void* hProcess, uint32_t uExitCode);
    uint32_t GetCurrentProcessId();
    
    int VirtualProtect(void* lpAddress, unsigned long dwSize, unsigned long flNewProtect, unsigned long* lpflOldProtect);
    void* VirtualAlloc(void* lpAddress, unsigned long dwSize, unsigned long  flAllocationType, unsigned long flProtect);
    int VirtualFree(void* lpAddress, unsigned long dwSize, unsigned long dwFreeType);

	typedef unsigned long HANDLE;
	typedef HANDLE HWND;
	typedef struct _RECT {
		long left;
		long top;
		long right;
		long bottom;
	} RECT, *PRECT;

	HWND GetActiveWindow(void);

	bool GetWindowRect(
		HWND   hWnd,
		PRECT lpRect
	);

	bool ClipCursor(const RECT *lpRect);

	bool GetClipCursor(PRECT lpRect);
    
    //----------------------
    typedef unsigned int UINT;
    typedef unsigned long DWORD;
    typedef DWORD HRESULT;
    typedef long LONG;
    typedef int BOOL;
    typedef enum _D3DFORMAT { __D3DFORMAT } D3DFORMAT; 
    typedef enum _D3DMULTISAMPLE_TYPE { __D3DMULTISAMPLE_TYPE } D3DMULTISAMPLE_TYPE;
    typedef enum _D3DSWAPEFFECT { __D3DSWAPEFFECT } D3DSWAPEFFECT;
    typedef struct _HWND* HWND;

    typedef struct _IDirect3DDevice9 IDirect3DDevice9;

    typedef struct _RGNDATAHEADER {
        DWORD dwSize;
        DWORD iType;
        DWORD nCount;
        DWORD nRgnSize;
        RECT  rcBound;
    } RGNDATAHEADER;

    typedef struct _RGNDATA {
        RGNDATAHEADER rdh;
        char          Buffer[1];
    } RGNDATA;

    typedef struct _D3DPRESENT_PARAMETERS {
        UINT                BackBufferWidth;
        UINT                BackBufferHeight;
        D3DFORMAT           BackBufferFormat;
        UINT                BackBufferCount;
        D3DMULTISAMPLE_TYPE MultiSampleType;
        DWORD               MultiSampleQuality;
        D3DSWAPEFFECT       SwapEffect;
        HWND                hDeviceWindow;
        BOOL                Windowed;
        BOOL                EnableAutoDepthStencil;
        D3DFORMAT           AutoDepthStencilFormat;
        DWORD               Flags;
        UINT                FullScreen_RefreshRateInHz;
        UINT                PresentationInterval;
    } D3DPRESENT_PARAMETERS;

    typedef union _LARGE_INTEGER {
        struct {
        long LowPart;
        long HighPart;
        };
        long long QuadPart;
    } LARGE_INTEGER;

    //kernel32
    int __stdcall QueryPerformanceCounter(LARGE_INTEGER* performanceCount);
    int __stdcall QueryPerformanceFrequency(LARGE_INTEGER* frequency);

    //winmm
    DWORD __stdcall timeGetTime(void);

    typedef unsigned int uint16;
    typedef unsigned int uint8;
]]
-------------------------------------------------------------------
local kernel32 = ffi.load("Kernel32.dll")
local winmm = ffi.load("winmm.dll")
local TARGET_FRAMERATE = 1000


local function copy(dst, src, len)
    return ffi.copy(ffi.cast('void*', dst), ffi.cast('const void*', src), len)
end

local buff = {free = {}}

local function VirtualProtect(lpAddress, dwSize, flNewProtect, lpflOldProtect)
    return ffi.C.VirtualProtect(ffi.cast('void*', lpAddress), dwSize, flNewProtect, lpflOldProtect)
end

local function VirtualAlloc(lpAddress, dwSize, flAllocationType, flProtect, blFree)
    local alloc = ffi.C.VirtualAlloc(lpAddress, dwSize, flAllocationType, flProtect)
    if blFree then
        table.insert(buff.free, alloc)
    end
    return ffi.cast('intptr_t', alloc)
end

local hook = {hooks = {}}

function hook.new(cast, callback, hook_addr, size)
    jit.off(callback, false) --off jit compilation | thx FYP
    local size = size or 5
    local new_hook = {}
    local detour_addr = tonumber(ffi.cast('intptr_t', ffi.cast('void*', ffi.cast(cast, callback))))
    local void_addr = ffi.cast('void*', hook_addr)
    local old_prot = ffi.new('unsigned long[1]')
    local org_bytes = ffi.new('uint8_t[?]', size)
    ffi.copy(org_bytes, void_addr, size)
    local hook_bytes = ffi.new('uint8_t[?]', size, 0x90)
    hook_bytes[0] = 0xE9
    ffi.cast('uint32_t*', hook_bytes + 1)[0] = detour_addr - hook_addr - 5
    new_hook.call = ffi.cast(cast, hook_addr)
    new_hook.status = false
    local function set_status(bool)
        new_hook.status = bool
        ffi.C.VirtualProtect(void_addr, size, 0x40, old_prot)
        ffi.copy(void_addr, bool and hook_bytes or org_bytes, size)
        ffi.C.VirtualProtect(void_addr, size, old_prot[0], old_prot)
    end
    new_hook.stop = function() set_status(false) end
    new_hook.start = function() set_status(true) end
    new_hook.start()
    table.insert(hook.hooks, new_hook)
    return setmetatable(new_hook, {
        __call = function(self, ...)
            self.stop()
            local res = self.call(...)
            self.start()
            return res
        end
    })
end

--VMT HOOKS
local vmt_hook = {hooks = {}}
function vmt_hook.new(vt)
    local new_hook = {}
    local org_func = {}
    local old_prot = ffi.new('unsigned long[1]')
    local virtual_table = ffi.cast('intptr_t**', vt)[0]
    new_hook.this = virtual_table
    new_hook.hookMethod = function(cast, func, method)
        jit.off(func, false) --off jit compilation | thx FYP
        org_func[method] = virtual_table[method]
        VirtualProtect(virtual_table + method, 4, 0x4, old_prot)
        virtual_table[method] = ffi.cast('intptr_t', ffi.cast(cast, func))
        VirtualProtect(virtual_table + method, 4, old_prot[0], old_prot)
        return ffi.cast(cast, org_func[method])
    end
    new_hook.unHookMethod = function(method)
        VirtualProtect(virtual_table + method, 4, 0x4, old_prot)
        -- virtual_table[method] = org_func[method]
        local alloc_addr = VirtualAlloc(nil, 5, 0x1000, 0x40, false)
        local trampoline_bytes = ffi.new('uint8_t[?]', 5, 0x90)
        trampoline_bytes[0] = 0xE9
        ffi.cast('int32_t*', trampoline_bytes + 1)[0] = org_func[method] - tonumber(alloc_addr) - 5
        copy(alloc_addr, trampoline_bytes, 5)
        virtual_table[method] = ffi.cast('intptr_t', alloc_addr)
        VirtualProtect(virtual_table + method, 4, old_prot[0], old_prot)
        org_func[method] = nil
    end
    new_hook.unHookAll = function()
        for method, func in pairs(org_func) do
            new_hook.unHookMethod(method)
        end
    end
    table.insert(vmt_hook.hooks, new_hook.unHookAll)
    return new_hook
end
--VMT HOOKS

--DELETE HOOKS
addEventHandler('onScriptTerminate', function(scr)
    if scr == thisScript() then
        for i, addr in ipairs(buff.free) do
			ffi.C.VirtualFree(addr, 0, 0x8000)
        end
        for i, unHookFunc in ipairs(vmt_hook.hooks) do
            unHookFunc()
        end
        for i, hook in ipairs(hook.hooks) do
            if hook.status then
                hook.stop()
            end
        end
    end
end)
--DELETE HOOKS

-------------------------------------------------------------------
local rcClip, rcOldClip = ffi.new('RECT'), ffi.new('RECT')
----------------------------------------------------------------------------------------
------------------------------------ [cleaner] --------------------------------------------
local function round(num, idp)
    local mult = 10 ^ (idp or 0)
    return math.floor(num * mult + 0.5) / mult
end

function get_memory()
    return round(memory.read(0x8E4CB4, 4, true) / 1048576, 1)
end
-------------------------------------------------------------------------------------------------
local IndicatorsCheck = {
    hp = false,
    armor = false,

}

local mainLoaded = false


local CWeather__ReleaseWeather = ffi.cast("void (__cdecl*)()", 0x72A510)

local objdists = {}

local locked = false


function table.find(f, vl) -- find element
    for _, v in ipairs(f) do
        if f.vl then
            return true
        end
    end
    return false
end

local motoBikeModelIds = {461, 462, 463, 468, 521, 522, 523, 581, 586}

function isCharInAnyMotoBike(handle)
    local modelid = getCarModel(storeCarCharIsInNoSave(handle))
    return table.find(motoBikeModelIds, modelid)
end

local bikeModelIds = {481, 509, 510}

function isCharInAnyBike(handle)
    local modelid = getCarModel(storeCarCharIsInNoSave(handle))
    return table.find(bikeModelIds, modelid)
end

function main()
    if mainLoaded then
        goto endmain -- ����� �� ����� ������ callback
        return false
    end
    if not mainLoaded then
        
        mainLoaded = true
        resethook()
        getobjdists()
        if ffi.string(buffers.multilineText) == "" then
            buffers.multilineText = new.char[10000](u8(table.concat(objdists, "\n")))
        end
        --------------------- [ dual monitor fix] --------------
        ffi.C.GetWindowRect(ffi.C.GetActiveWindow(), rcClip);
        ffi.C.ClipCursor(rcClip);
        --------------------------------------------------------
        while not isSampAvailable() do wait(0) end
        sampRegisterChatCommand("q", function()
            kill()
        end)
        if ini.settings.framelimiter then
            presenthook()
        end
        hookVideomode()
        bindOpenmenu = rkeys.registerHotKey(ActOpenMenuKey.v, true, function()
            if not sampIsCursorActive() then
                gfmenu.switch()
            end
        end)
        sampAddChatMessage(script_name.."{FFFFFF} ����: {dc4747}"..ini.commands.openmenu.." {FFFFFF}��� {dc4747}"..table.concat(rkeys.getKeysName(ActOpenMenuKey.v), " + ")..". {FFFFFF}������: {dc4747}"..script_version.." {FFFFFF}�����: {dc4747}"..script_author, 0x73b461)
        loadSounds()--ugenrl
        gotofunc("all")--load all func
        addEventHandler('onWindowMessage', function(msg, wparam, lparam)
            if wparam == 27 then
                if gfmenu.state or twsmenu.state or timecyc_creator.state then
                    if msg == wm.WM_KEYDOWN then
                        consumeWindowMessage(true, false)
                    end
                    if msg == wm.WM_KEYUP then
                        if gfmenu.state then
                            gfmenu.switch()
                        elseif twsmenu.state then
                            twsmenu.switch()
                        elseif timecyc_creator.state then
                            timecyc_creator.switch()
                        end
                    end
                end
            end
            if ini.settings.mapzoomfixer then
                if (msg == 522 and readMemory(0xBA68A5, 1, true) == 5) then
                    if wparam == 7864320 and memory.getfloat(0xBA67AC, true) < 1000.0 then
                        memory.setfloat(0xBA67AC, memory.getfloat(0xBA67AC, true) + 42.0, false)
                    elseif wparam == 4287102976 and memory.getfloat(0xBA67AC, true) > 300.0 then
                        memory.setfloat(0xBA67AC, memory.getfloat(0xBA67AC, true) - 42.0, false)
                    end
                end
            end
            if ini.settings.dual_monitor_fix then
                if msg == wm.WM_KILLFOCUS then
                    ffi.C.GetClipCursor(rcOldClip);
                    ffi.C.ClipCursor(rcOldClip);
                elseif msg == wm.WM_SETFOCUS then
                    ffi.C.GetWindowRect(ffi.C.GetActiveWindow(), rcClip);
                    ffi.C.ClipCursor(rcClip);
                end
            end
            if ini.nop_samp_keys.key_ALTENTER and msg == 261 and wparam == 13 then
                consumeWindowMessage(true, true)
            end
            
        end)
        if getModuleHandle("timecycle24.asi") ~= 0 or getModuleHandle("timecycle24") ~= 0 then
            NUMHOURS = 24
            bTimecyc24h = true
        else
            NUMHOURS = 8
            bTimecyc24h = false
        end
        cntfont()
        
        serverPtr = sampGetServerSettingsPtr()
        ultimateGenrlThread = lua_thread.create(UltimateGenrl)
        basicThread = lua_thread.create(basic)
    end
    ::endmain::
end

function UltimateGenrl()
    while true do
        wait(0)
        
        -- ��������������� ��������
        if not ini.ugenrl_main.enable or sampGetGamestate() ~= 3 then 
            goto continue
        end
  
        local mode = ini.ugenrl_main.mode
        local myX, myY, myZ = getCharCoordinates(PLAYER_PED)
        local currentWeapon = getCurrentCharWeapon(PLAYER_PED)
  
        if mode == 0 or mode == 1 then
            -- ��������������� ����� ��� �������� ������
            if ini.ugenrl_main.weapon and isCharShooting(PLAYER_PED) then
                playSound(ini.ugenrl_sounds[currentWeapon], ini.ugenrl_volume.weapon)
            end
            
            -- ��������������� ����� � ������ ���������� ��� ��������
            if ini.ugenrl_main.enemyWeapon then
                local hasFoundChars, randomCharHandle = findAllRandomCharsInSphere(myX, myY, myZ, ini.ugenrl_main.enemyWeaponDist, true, true)
                if hasFoundChars and hasFoundChars ~= nil and isCharShooting(randomCharHandle) then
                    playSound(ini.ugenrl_sounds[getCurrentCharWeapon(randomCharHandle)], ini.ugenrl_volume.weapon, randomCharHandle) 
                end
            end
        end
  
        -- ��������������� ����� ��� ��������� ����� � ������
        if playPain then
            playSound(ini.ugenrl_sounds.pain, ini.ugenrl_volume.pain)
            playPain = false
            if weaponSoundDelay[dmgWeaponId] then wait(weaponSoundDelay[dmgWeaponId]) end 
        end
  
        if playHit then
            playSound(ini.ugenrl_sounds.hit, ini.ugenrl_volume.hit)
            playHit = false
            if weaponSoundDelay[dmgWeaponId] then wait(weaponSoundDelay[dmgWeaponId]) end
        end
  
        if isExpl() then
            playSound(ini.ugenrl_sounds.expl, ini.ugenrl_volume.expl)
        end
        ::continue::
    end
end


function basic()
    while true do
        wait(0)

        if ini.settings.CustomFov then
            if isCurrentCharWeapon(PLAYER_PED, 34) and isKeyDown(2) then
                if not locked then 
                    cameraSetLerpFov(70.0, 70.0, 1000, 1)
                    locked = true
                end
            else
                cameraSetLerpFov(ini.settings.fov, ini.settings.fov, 1000, 1)
                locked = false
            end
        end
        
        

        if sampGetGamestate() == 2 then -- ������� ������� ��������� � ������ ����� ����������� �� ������
            while sampGetGamestate() ~= 3 do wait(0) end
            local getmaxservnickdistance = sampGetServerSettingsPtr() + 39
            if memory.getfloat(0xFFFC90, true) ~= memory.getfloat(getmaxservnickdistance, true) then
                memory.setfloat(0xFFFC90, memory.getfloat(getmaxservnickdistance), true)
                gotofunc("SetDistNickNames")
                gotofunc("GTATime")
                gotofunc("GTAWeather")
                
            end
        end

        if ini.cleaner.autoclean then
            if tonumber(get_memory()) > tonumber(ini.cleaner.limit) then
                gotofunc("CleanMemory")
            end
        end

        

        if ini.settings.sync_time and not ini.settings.gtatime then
            if memory.read(0xB70153, 1, true) ~= os.date("%H") then
                ini.settings.hours = os.date("%H")
                gotofunc("SetTime")
            end
            if memory.read(0xB70152, 1, true) ~= os.date("%M") then
                ini.settings.min = os.date("%M")
                gotofunc("SetTime")
            end
        end

        if not ini.settings.sync_time and not ini.settings.gtatime and not ini.settings.gtaweather then
            if ini.settings.blockweather == true and memory.read(0xC81320, 2, true) ~= ini.settings.weather then gotofunc("SetWeather") end
            if ini.settings.blocktime == true and memory.read(0xB70153, 1, true) ~= ini.settings.hours then gotofunc("SetTime") end
        end

        if not sampIsCursorActive() then
            if ini.settings.chatt and isKeyJustPressed(84) then
                sampSetChatInputEnabled(true)
            end
        end
        if ini.settings.antiblockedplayer and not isCharInAnyCar(PLAYER_PED) then
            for i = 0, sampGetMaxPlayerId(true) do
                if sampIsPlayerConnected(i) then
                    local result, id = sampGetCharHandleBySampPlayerId(i)
                    if result then
                        if isCharOnScreen(id) and doesCharExist(id) then
                            local x, y, z = getCharCoordinates(id)
                            local mX, mY, mZ = getCharCoordinates(PLAYER_PED)
                            if 0.67 > getDistanceBetweenCoords3d(x, y, z, mX, mY, mZ) then
                                setCharCollision(id, false)
                            end
                        end
                    end
                end
            end
        end


        if ini.settings.givemedist then 
            if isCharInAnyPlane(PLAYER_PED) or isCharInAnyHeli(PLAYER_PED) then --airveh dist 
                if memory.getfloat(0xB7C7F0, true) ~= ini.settings.drawdistair then 
                    memory.setfloat(0xB7C7F0, ini.settings.drawdistair, true) 
                    memory.setfloat(0xC992F0, ini.settings.fog, true) 
                end 
            else 
                if memory.getfloat(0xB7C7F0, true) ~= ini.settings.drawdist and getCurrentCharWeapon(PLAYER_PED) ~= 46 then 
                    memory.setfloat(0xB7C7F0, ini.settings.drawdist, true) 
                    memory.setfloat(0xC992F0, ini.settings.fog, true) 
                end 
                if tonumber(("%.1f"):format(memory.getfloat(0xB7C7F0, true))) ~= ini.settings.drawdistpara and getCurrentCharWeapon(PLAYER_PED) == 46 then 
                    memory.setfloat(0xB7C7F0, ini.settings.drawdistpara, true) 
                end 
            end 
 
            if memory.getfloat(0xC992F0, true) >= memory.getfloat(0xB7C7F0, true) then --fix bug dist 
                memory.setfloat(0xC992F0, ini.settings.drawdistpara - 1.0, true) 
                ini.settings.fog = ini.settings.drawdist - 1.0 
                save() 
            end 
        end

        if ini.custom_nametags.status then
            if nameTags.getState() then
                nameTags.setState(false)
            end
            for i = 0, sampGetMaxPlayerId(true) do
                if sampIsPlayerConnected(i) then
                    local getted, remotePlayer = sampGetCharHandleBySampPlayerId(i)
                    if getted then
                        local remotePlayerX, remotePlayerY, remotePlayerZ = getBodyPartCoordinates(8, remotePlayer);
                        local myPosX, myPosY, myPosZ = getCharCoordinates(playerPed)
                        local dist = getDistanceBetweenCoords3d(remotePlayerX, remotePlayerY, remotePlayerZ, myPosX, myPosY, myPosZ)
                        if dist <= tonumber(memory.getfloat(0xFFFC90, true)) and not isGamePaused() then
                            if dist <= tonumber(ini.settings.nickdistance) then
                                if isCharOnScreen(remotePlayer) then
                                    local camX, camY, camZ = getActiveCameraCoordinates()
                                    local wposX, wposY = convert3DCoordsToScreen(remotePlayerX, remotePlayerY, remotePlayerZ + 0.4 + (dist * 0.05))
                                    local result, colPoint = processLineOfSight(camX, camY, camZ, remotePlayerX, remotePlayerY, remotePlayerZ, true, false, false, true, false, false, false, true) 
                                    if not result then
                                        local color = sampGetPlayerColor(i)
                                        local aa, rr, gg, bb = explode_argb(color)
                                        color = join_argb(255, rr, gg, bb)
                                        local text = string.format("%s (%d)", sampGetPlayerNickname(i), i)
                                        local afkState = sampIsPlayerPaused(i)
                                        if afkState then 
                                            text = "[AFK] " .. text;
                                        end
                                        if not ini.settings.shownicks then renderFontDrawText(CNTrenderFont, text, wposX - renderGetFontDrawTextLength(CNTrenderFont, text) / 2, wposY, color) end
                                        if not ini.settings.showhp then
                                            renderDrawBoxWithBorder(wposX - 24, wposY + renderGetFontDrawHeight(CNTrenderFont) + 12, 100 / 2, 6, preset["Recolorer"]["Recolorer"] and preset["Recolorer"]["PlayerHealth2"] or 0xFF000000, 1, 0xFF000000)
                                            renderDrawBoxWithBorder(wposX - 24, wposY + renderGetFontDrawHeight(CNTrenderFont) + 12, math.clamp(sampGetPlayerHealth(i), 0, 100) * 1 / 2, 6, preset["Recolorer"]["Recolorer"] and preset["Recolorer"]["PlayerHealth"] or 0xFFFF0000, 1, 0x00000000)
                                            if sampGetPlayerArmor(i) > 1 then
                                                renderDrawBoxWithBorder(wposX - 24, wposY + renderGetFontDrawHeight(CNTrenderFont) + 4, 100 / 2, 6, preset["Recolorer"]["Recolorer"] and preset["Recolorer"]["PlayerArmor2"] or 0xFF000000, 1, 0xFF000000)
                                                renderDrawBoxWithBorder(wposX - 24, wposY + renderGetFontDrawHeight(CNTrenderFont) + 4, sampGetPlayerArmor(i) / 2, 6, preset["Recolorer"]["Recolorer"] and preset["Recolorer"]["PlayerArmor"] or 0xFFFFFFFF, 1, 0x00000000)
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
    
            
    
            for k, v in pairs(chatBubbles) do
                if os.time() > v["time"] then
                    table.remove(chatBubbles, i);
                else
                    local getted, remotePlayer = sampGetCharHandleBySampPlayerId(v["playerid"])
                    if getted then
                        local remotePlayerX, remotePlayerY, remotePlayerZ = getBodyPartCoordinates(8, remotePlayer);
                        local myPosX, myPosY, myPosZ = getCharCoordinates(playerPed)
                        local dist = getDistanceBetweenCoords3d(remotePlayerX, remotePlayerY, remotePlayerZ, myPosX, myPosY, myPosZ)
                        if dist <= v["dist"] and not isGamePaused() then
                            if isCharOnScreen(remotePlayer) then
                                local camX, camY, camZ = getActiveCameraCoordinates()
                                local wposX, wposY = convert3DCoordsToScreen(remotePlayerX, remotePlayerY, remotePlayerZ + 0.450 + (dist * 0.05))
                                local result, colPoint = processLineOfSight(camX, camY, camZ, remotePlayerX, remotePlayerY, remotePlayerZ, true, false, false, true, false, false, false, true) 
                                if not result then
                                    local rr, gg, bb, aa = explode_argb(v["color"])
                                    v["color"] = join_argb(255, rr, gg, bb)
                                    renderFontDrawText(CNTrenderFont, v["text"], wposX - renderGetFontDrawTextLength(CNTrenderFont, v["text"]) / 2, wposY - renderGetFontDrawHeight(CNTrenderFont) - 2, v["color"])
                                end
                            end
                        end
                    end
                end
            end
        end


        --------------------------
        if ini.settings.framelimiter then
            if isPauseMenuActive() then
                TARGET_FRAMERATE = 1000
            else
                if isCharOnFoot(PLAYER_PED) and TARGET_FRAMERATE ~= ini.smart_fps.pedfps and not isCharSwimming(PLAYER_PED) and getCurrentCharWeapon(PLAYER_PED) ~= 34 and getCurrentCharWeapon(PLAYER_PED) ~= 41 then
                    TARGET_FRAMERATE = ini.smart_fps.pedfps
                elseif isCharOnFoot(PLAYER_PED) and TARGET_FRAMERATE ~= ini.smart_fps.snipergunfps and not isCharSwimming(PLAYER_PED) and getCurrentCharWeapon(PLAYER_PED) == 34 then
                    TARGET_FRAMERATE = ini.smart_fps.snipergunfps
                elseif isCharOnFoot(PLAYER_PED) and TARGET_FRAMERATE ~= ini.smart_fps.spraygunfps and not isCharSwimming(PLAYER_PED) and getCurrentCharWeapon(PLAYER_PED) == 41 then
                    TARGET_FRAMERATE = ini.smart_fps.spraygunfps
                end
                if isCharInAnyHeli(PLAYER_PED) and TARGET_FRAMERATE ~= ini.smart_fps.helifps then
                    TARGET_FRAMERATE = ini.smart_fps.helifps
                elseif isCharInAnyPlane(PLAYER_PED) and TARGET_FRAMERATE ~= ini.smart_fps.planefps then
                    TARGET_FRAMERATE = ini.smart_fps.planefps
                elseif isCharInAnyCar(PLAYER_PED) and not isCharInAnyPlane(PLAYER_PED) and not isCharInAnyHeli(PLAYER_PED) and not isCharInAnyBoat(PLAYER_PED) then
                    if isCharInAnyMotoBike(PLAYER_PED) and TARGET_FRAMERATE ~= ini.smart_fps.motofps then
                        TARGET_FRAMERATE = ini.smart_fps.motofps
                    end
                    if isCharInAnyBike(PLAYER_PED) and TARGET_FRAMERATE ~= ini.smart_fps.bikefps then
                        TARGET_FRAMERATE = ini.smart_fps.bikefps
                    end
                    if isCharSittingInAnyCar(PLAYER_PED) and not isCharInAnyPlane(PLAYER_PED) and not isCharInAnyHeli(PLAYER_PED) and not isCharInAnyMotoBike(PLAYER_PED) and not isCharInAnyBike(PLAYER_PED) and TARGET_FRAMERATE ~= ini.smart_fps.vehfps then
                        TARGET_FRAMERATE = ini.smart_fps.vehfps
                    end
                elseif isCharInAnyBoat(PLAYER_PED) and TARGET_FRAMERATE ~= ini.smart_fps.boatfps then
                    TARGET_FRAMERATE = ini.smart_fps.boatfps
                elseif isCharSwimming(PLAYER_PED) and TARGET_FRAMERATE ~= ini.smart_fps.swimfps then
                    TARGET_FRAMERATE = ini.smart_fps.swimfps
                end
            end
        end
        -----------------------------

        
        



        
        DrawIndicators("hp")
        DrawIndicators("ar")
    
    end
end


function DrawIndicators(ind)
    if ind == "hp" then
        if sampGetGamestate() == 3 and not IndicatorsCheck.hp then
            sampTextdrawCreate(1978, "_", -1, -1)	
            IndicatorsCheck.hp = true
        end

        if IndicatorsCheck.hp and not sampTextdrawIsExists(1978) then
            IndicatorsCheck.hp = false
        end 

        if IndicatorsCheck.hp then
            local health = getCharHealth(PLAYER_PED)
            sampTextdrawSetPos(1978, preset["HPHud"]["posX"], preset["HPHud"]["posY"])
            sampTextdrawSetStyle(1978, preset["HPHud"]["fonts"])
            sampTextdrawSetAlign(1978, preset["HPHud"]["posX"])
            sampTextdrawSetLetterSizeAndColor(1978, preset["HPHud"]["sizeX"], preset["HPHud"]["sizeY"], preset["HPHud"]["Color"])
            sampTextdrawSetOutlineColor(1978, 1, 0xFF000000)
            if preset["HPHud"]["Status"] and not sampIsScoreboardOpen() and readMemory(0xBA676C, 1, true) == 0 and health > 0 then
                if health > 255 then health = "255_+" end
                sampTextdrawSetString(1978, health.. (preset["HPHud"]["hptext"] and "_hp" or ""))
            else
                sampTextdrawSetString(1978, "_")
            end
        end

    elseif ind == "ar" then
        if sampGetGamestate() == 3 and not IndicatorsCheck.armor then
            sampTextdrawCreate(1979, "_", -1, -1)	
            IndicatorsCheck.armor = true
        end

        if IndicatorsCheck.armor and not sampTextdrawIsExists(1979) then
            IndicatorsCheck.armor = false
        end 

        if IndicatorsCheck.armor then
            local armour = getCharArmour(PLAYER_PED)
            sampTextdrawSetPos(1979, preset["ArmorHud"]["posX"], preset["ArmorHud"]["posY"])
            sampTextdrawSetStyle(1979, preset["ArmorHud"]["fonts"])
            sampTextdrawSetAlign(1979, preset["ArmorHud"]["posX"])
            sampTextdrawSetLetterSizeAndColor(1979, preset["ArmorHud"]["sizeX"], preset["ArmorHud"]["sizeY"], preset["ArmorHud"]["Color"])
            sampTextdrawSetOutlineColor(1979, 1, 0xFF000000)
            if preset["ArmorHud"]["Status"] and not sampIsScoreboardOpen() and readMemory(0xBA676C, 1, true) == 0 and armour > 1 then
                if armour > 100 then armour = "100_+" end
                sampTextdrawSetString(1979, armour.. (preset["ArmorHud"]["armortext"] and "_ar" or ""))
            else
                sampTextdrawSetString(1979, "_")
            end
        end
    

    end
end

function kill()
    -- �������� ��������� PROCESS_TERMINATE
    local PROCESS_TERMINATE = 0x0001

    -- �������� ������������� �������� gta_sa.exe
    local processId = ffi.C.GetCurrentProcessId()

    -- ��������� ������� gta_sa.exe ��� ��� ����������
    local processHandle = ffi.C.OpenProcess(PROCESS_TERMINATE, 0, processId)
    if processHandle == nil then
        -- ���� �������� ������ ��� �������� ��������, ������� ��������� �� ������
        local errorCode = ffi.C.GetLastError()
        print("������ ��� �������� ��������: " .. errorCode)
    else
        -- �������� ������� TerminateProcess ��� ���������� �������� gta_sa.exe
        local exitCode = 0 -- ��� ���������� �������� (� ������ ������ 0)
        local result = ffi.C.TerminateProcess(processHandle, exitCode)
        if result == 0 then
            -- ���� �������� ������ ��� ���������� ��������, ������� ��������� �� ������
            local errorCode = ffi.C.GetLastError()
            print("������ ��� ���������� ��������: " .. errorCode)
        end
    end
end

function onQuitGame()
   kill()
end

function math.clamp(x, min, max)
    return math.max(math.min(x, max), min)
end





function getobjdists()
    local file = io.open("moonloader\\GameTweaker\\Objects_Dist.txt", "a+") -- ��������� � ������� ����
    file:close() -- ���������, ��� ���� �� ����� ����� �� �� ��������. �� �� ��� ���������!
    local file = io.open("moonloader\\GameTweaker\\Objects_Dist.txt", "a+") -- ���������
    for line in file:lines() do -- ������ ��� ���������
        objdists[#objdists+1] = line -- ���������� ������ � ������
    end
    file:close() -- ��������� ����
end



-- ������� ��� ��������� ������ ������ � ������������ ����������� � ��������� ����������
function getTxtFilesInDirectory(directory)
    for filename in lfs.dir(directory) do  -- ������� ������ � ����������
        if filename:match("%.json$") then  -- ��������, ������������� �� ���� ������� ����������
            table.insert(txtFiles, filename)  -- ���������� �������� ����� � ������� txtFiles
        end
    end
    return txtFiles
end


txtFilesInCurrentDirectory = getTxtFilesInDirectory(getGameDirectory().."\\moonloader\\GameTweaker\\IE-presets")  -- ��������� ������ ������

local selectedFile = 1  -- �� ��������� ������ ������ ����

function getSelect(id, name)
    for i, v in ipairs(name) do
        if v == id then
            n = i
        end
    end
    return n
end

local tempName
local tempIter

function drawFileSelection()
    imgui.Text(u8"���� �������:")
    imgui.BeginChild('##presetchild', imgui.ImVec2(170, 260), true) 
    for i, filename in pairs(txtFilesInCurrentDirectory) do
        imgui.PushFont(iconFont)
        if imgui.Button(fa.ICON_FA_TRASH.."##" .. i) and filename ~= "Default.json" then
            tempName = filename
            tempIter = i
            imgui.OpenPopup(u8'�������� �������')
        end
        
        
        imgui.PopFont()
       
        imgui.SameLine()
        if selectedFile ~= getSelect(ini.settings.currentpreset, txtFilesInCurrentDirectory) then
            selectedFile = getSelect(ini.settings.currentpreset, txtFilesInCurrentDirectory)
        end
        if imgui.Selectable((string.gsub(u8(filename), ".json", "")), selectedFile == i) then 
            selectedFile = i  -- ���������� ���������� ����� 
            ini.settings.currentpreset = filename
            save()
            getJson()
            jsonExist(IEPresets)
            gotofunc("InterfaceElementEditor") 
            gotofunc("Recolorer")
            imgui_Data()
        end
    
    end

    if imgui.BeginPopupModal(u8'�������� �������', _, imgui.WindowFlags.NoResize) then
        imgui.Text(u8"�� ������������� ������ ������� "..tempName.." ?")
        imgui.SetCursorPosX(imgui.GetCursorPos().x + 60)
        if imgui.Button(u8"�������", imgui.ImVec2(80, 25)) and tempName ~= "Default.json" then
            table.remove(txtFilesInCurrentDirectory, tempIter)  -- ������� ������ �� ������
            selectedFile = 0  -- ���������� ��������� ����, ��� ��� �� ��� ������
            os.remove(getGameDirectory().."\\moonloader\\GameTweaker\\IE-presets\\"..tempName)
            imgui.CloseCurrentPopup()
        end
        imgui.SameLine()
        imgui.SetCursorPosX(imgui.GetCursorPos().x + 10)
        if imgui.Button(u8"������", imgui.ImVec2(80, 25)) then
            imgui.CloseCurrentPopup()
        end
        imgui.EndPopup()
    end
    imgui.EndChild() 
end




local navigations = {
    --====[[����� ������� �������?]]====--
    activeTab = {
        home = new.int(1),
        fixesandpatches = new.int(1),
        graphics = new.int(1),
        optimization = new.int(1),
        gameinterface = new.int(1),
    },
    
    --===================================--
    home = {
        fa.ICON_FA_HOME..u8'\tHome',
        fa.ICON_FA_WRENCH..u8'\tFixes & Patches',
        fa.ICON_FA_DESKTOP..u8'\tGraphics',
        fa.ICON_FA_CHART_AREA..u8'\tOptimization',
        fa.ICON_FA_VOLUME_UP..u8'\tSounds',
        fa.ICON_FA_EDIT..u8'\tInterface',
        fa.ICON_FA_ALIGN_LEFT..u8'\tCommands',
        fa.ICON_FA_PAINT_ROLLER..u8'\tDesign',
    },
    fixesandpatches = {
        u8"�����������",
        u8"�����",
    },
    graphics = {
        u8'������, �����, �������',
        u8'�������� ����������',
        u8'��������� ��������',
        u8'�������� �����',
        u8'�������� ��������',
        u8'��������',
        u8'��������� ������',
    },
    optimization = {
        u8'������� ������',
        u8'��������� ��������',
        u8'������������ ������',
        u8'������',
    },
    gameinterface = {
        u8'�������',
        u8'��������',
        u8'������',
        u8'�����',
        u8'���� ����',
        u8'������',
        u8'��������',
        u8'�����',
        u8'������',
        u8'������',
        u8'����',
    },
    sounds = {
        u8'Ultimate Genrl',
        u8'Game Sounds',
    },
    current_sounds = 1,
    interface_elemets = {
        u8"�������� ����������",
        u8"����� ���������",
        u8"����������",
        u8"�������",
        u8"������",
    },
    current_elemets = 1,
}

local twsrender = imgui.OnFrame(
    function() return twsmenu.alpha > 0.00 end,
    function(self)
        self.HideCursor = not twsmenu.state
        if isKeyDown(32) and self.HideCursor == false then
            self.HideCursor = true
        elseif not isKeyDown(32) and self.HideCursor == true and twsmenu.state then
            self.HideCursor = false
        end
        imgui.PushStyleVarFloat(imgui.StyleVar.Alpha, twsmenu.alpha)
        imgui.SetNextWindowPos(imgui.ImVec2(sizeX / 2, sizeY / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
        imgui.SetNextWindowSize(imgui.ImVec2(380, 370), imgui.Cond.FirstUseEver)
        imgui.PushStyleColor(imgui.Col.WindowBg, imgui.ImVec4(0.0, 0.0, 0.0, 1.0))
        imgui.Begin(u8"�������� ������ � �������", _, imgui.WindowFlags.NoCollapse + imgui.WindowFlags.NoTitleBar)
            imgui.Text(u8"������:")
            imgui.SameLine()
            imgui.SetCursorPosX(120)
            if imgui.SliderInt(u8"##Weather", sliders.weather, 0, 45) then
                ini.settings.weather = sliders.weather[0]
                save()
                gotofunc("SetWeather")
            end
            imgui.Text(u8"����:")
            imgui.SameLine()
            imgui.SetCursorPosX(120)
            if imgui.SliderInt(u8"##hours", sliders.hours, 0, 23) then
                ini.settings.hours = sliders.hours[0]
                save()
                gotofunc("SetTime")
            end
            imgui.Text(u8"������:")
            imgui.SameLine()
            imgui.SetCursorPosX(120)
            if imgui.SliderInt(u8"##min", sliders.min, 0, 59) then
                ini.settings.min = sliders.min[0]
                save()
                gotofunc("SetTime")
            end
            if imgui.Checkbox(u8"����������� ��������� ������ ��������", checkboxes.blockweather) then
                ini.settings.blockweather = checkboxes.blockweather[0]
                save()
                gotofunc("BlockWeather")
                gotofunc("SetWeather")
            end
            if imgui.Checkbox(u8"����������� ��������� ������� ��������", checkboxes.blocktime) then
                ini.settings.blocktime = checkboxes.blocktime[0]
                save()
                gotofunc("BlockTime")
                gotofunc("SetTime")
            end
            
            if imgui.Checkbox(u8"������������� �������� ������� � ��", checkboxes.sync_time) then
                ini.settings.sync_time = checkboxes.sync_time[0]
                save()
            end
            if imgui.Checkbox(u8"���� �������", checkboxes.gtatime) then
                ini.settings.gtatime = checkboxes.gtatime[0]
                save()
                gotofunc("GTATime")
            end
            

            if ini.settings.blockweather then
                if imgui.Checkbox(u8"���� ����� (�������� ������ ������ � ������ �������)", checkboxes.gtaweather) then
                    ini.settings.gtaweather = checkboxes.gtaweather[0]
                    save()
                    gotofunc("GTAWeather")
                end
                
                imgui.Text(u8"��������� ����� �����:")
                imgui.BeginChild('##gtawetherset', imgui.ImVec2(290, 100), false)
                    if imgui.Checkbox(u8"������������ ��������� ������", checkboxes.noRain) then
                        ini.settings.noRain = checkboxes.noRain[0]
                        save()
                        gotofunc("GTAWeather")
                    end
                    if imgui.Checkbox(u8"������������ �������� ������", checkboxes.noFog) then
                        ini.settings.noFog = checkboxes.noFog[0]
                        save()
                        gotofunc("GTAWeather")
                    end
                    if imgui.Checkbox(u8"������������ �������� ����", checkboxes.noSandstorm) then
                        ini.settings.noSandstorm = checkboxes.noSandstorm[0]
                        save()
                        gotofunc("GTAWeather")
                    end
                    --[[imgui.PushItemWidth(100)
                    if imgui.InputInt(u8'������ �����', sliders.otweather) then
                        ini.settings.otweather = sliders.otweather[0]
                    end
                    if imgui.InputInt(u8'����� �����', sliders.doweather) then
                        ini.settings.doweather = sliders.doweather[0]
                    end
                    imgui.PopItemWidth()]]
                imgui.EndChild()
            end
        imgui.PopStyleColor()
        imgui.End()
        imgui.PopStyleVar()
    end
)


local timecyc_creator_render = imgui.OnFrame(
    function() return timecyc_creator.alpha > 0.00 end,
    function(self)
        self.HideCursor = not timecyc_creator.state
        if isKeyDown(32) and self.HideCursor == false then
            self.HideCursor = true
        elseif not isKeyDown(32) and self.HideCursor == true and timecyc_creator.state then
            self.HideCursor = false
        end
        imgui.PushStyleVarFloat(imgui.StyleVar.Alpha, timecyc_creator.alpha)
        imgui.SetNextWindowPos(imgui.ImVec2(sizeX / 2, sizeY / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
        imgui.SetNextWindowSize(imgui.ImVec2(660, 700), imgui.Cond.FirstUseEver)
        imgui.PushStyleColor(imgui.Col.WindowBg, imgui.ImVec4(0.0, 0.0, 0.0, 1.0))
        imgui.Begin(u8"�������� ���������", _)
        
        if not ini.settings.blocktime or not ini.settings.blockweather then
            imgui.Text(u8"������� �� �������� �� ������ ������.\n�������� ���������� ������ � �������.")
        else

            if ini.settings.gtatime or ini.settings.sync_time or ini.settings.gtaweather then
                imgui.Text(u8"������� �� �������� �� ������ ������.\n��������� ���� ������� � ������, ������������� �������� ������� � ��.")
            else
                Im_Update()
                if ini.fixtimecyc.active then
                    imgui.Text(u8"� ��� �������� ����������� ��������� ��� ����������� ����-���������.\n�����������: "..u8:encode(ini.commands.fixtimecyc)..u8" ��� ����������.")
                end
                
                
                imgui.PushItemWidth(400)
                local i = NUMWEATHERS * CTimeCycle.GetCurrentHourTimeId() + CurrWeather[0]
            
                CurrWeather[0] = Im.CurrWeather[0]
                NextWeather[0] = Im.NextWeather[0]


                if imgui.Combo(u8"������� ������", Im.CurrWeather, weatherchar, #weather) then
                    CurrWeather[0] = Im.CurrWeather[0]
                    ini.settings.weather = Im.CurrWeather[0]
                    save()
                end

                if imgui.Combo(u8"��������� ������", Im.NextWeather, weatherchar, #weather) then
                    NextWeather[0] = Im.NextWeather[0]
                end

                if imgui.SliderInt(u8"����", sliders.hours, 0, 23, "%.0f") then ini.settings.hours = sliders.hours[0] save() gotofunc("SetTime") end

                if imgui.SliderInt(u8"������", sliders.min, 0, 59, "%.0f") then ini.settings.min = sliders.min[0] save() gotofunc("SetTime") end

                if imgui.ColorEdit3(u8"���������", Im.AmbRGB) then
                    CTimeCycle.m_nAmbientRed[i], CTimeCycle.m_nAmbientGreen[i], CTimeCycle.m_nAmbientBlue[i] = Im.AmbRGB[0] * 255, Im.AmbRGB[1] * 255, Im.AmbRGB[2] * 255
                end
                
                if imgui.ColorEdit3(u8"��������� �����. ��������", Im.AmbObjRGB) then
                    CTimeCycle.m_nAmbientRed_Obj[i], CTimeCycle.m_nAmbientGreen_Obj[i], CTimeCycle.m_nAmbientBlue_Obj[i] = Im.AmbObjRGB[0] * 255, Im.AmbObjRGB[1] * 255, Im.AmbObjRGB[2] * 255
                end
        
                if imgui.ColorEdit3(u8"���� ����", Im.SkyTopRGB) then
                    CTimeCycle.m_nSkyTopRed[i], CTimeCycle.m_nSkyTopGreen[i], CTimeCycle.m_nSkyTopBlue[i] = Im.SkyTopRGB[0] * 255, Im.SkyTopRGB[1] * 255, Im.SkyTopRGB[2] * 255
                end
        
                if imgui.ColorEdit3(u8"���� ���", Im.SkyBottomRGB) then
                    CTimeCycle.m_nSkyBottomRed[i], CTimeCycle.m_nSkyBottomGreen[i], CTimeCycle.m_nSkyBottomBlue[i] = Im.SkyBottomRGB[0] * 255, Im.SkyBottomRGB[1] * 255, Im.SkyBottomRGB[2] * 255
                end
        
                if imgui.ColorEdit3(u8"��������� ����", Im.SunCoreRGB) then
                    CTimeCycle.m_nSunCoreRed[i], CTimeCycle.m_nSunCoreGreen[i], CTimeCycle.m_nSunCoreBlue[i] = Im.SunCoreRGB[0] * 255, Im.SunCoreRGB[1] * 255, Im.SunCoreRGB[2] * 255
                end
        
                if imgui.ColorEdit3(u8"��������� ������", Im.SunCoronaRGB) then
                    CTimeCycle.m_nSunCoronaRed[i], CTimeCycle.m_nSunCoronaGreen[i], CTimeCycle.m_nSunCoronaBlue[i] = Im.SunCoronaRGB[0] * 255, Im.SunCoronaRGB[1] * 255, Im.SunCoronaRGB[2] * 255
                end

                if imgui.SliderInt(u8"������ ������", Im.SunSz, 0, 127) then
                    CTimeCycle.m_fSunSize[i] = Im.SunSz[0]
                end
        
                if imgui.SliderInt(u8"������ �������", Im.SpriteSz, 0, 127) then
                    CTimeCycle.m_fSpriteSize[i] = Im.SpriteSz[0]
                end
        
                if imgui.InputInt(u8"������� �������", Im.SpriteBrght, 1, 10) then
                    CTimeCycle.m_fSpriteBrightness[i] = Im.SpriteBrght[0]
                end
        
                if imgui.SliderInt(u8"��������� �����", Im.ShadowStr, 0, 255) then
                    CTimeCycle.m_nShadowStrength[i] = Im.ShadowStr[0]
                end
        
                if imgui.SliderInt(u8"�������� ����� �����", Im.PoleShadowStr, 0, 255) then
                    CTimeCycle.m_nPoleShadowStrength[i] = Im.PoleShadowStr[0]
                end
        
                if imgui.SliderInt(u8"���� ��������� �� ��������", Im.LightShadowStrength, 0, 255) then
                    CTimeCycle.m_nLightShadowStrength[i] = Im.LightShadowStrength[0]
                end
        
                if imgui.InputInt(u8"���������� �� ��������", Im.FarClip, 1, 10) then
                    CTimeCycle.m_fFarClip[i] = Im.FarClip[0]
                end
        
                if imgui.InputInt(u8"���������� �� ������", Im.FogStart, 1, 10) then
                    CTimeCycle.m_fFogStart[i] = Im.FogStart[0]
                end
        
                if imgui.SliderInt(u8"������� ����� �� �����", Im.LightsOnGroundBrightness, 0, 255) then
                    CTimeCycle.m_fLightsOnGroundBrightness[i] = Im.LightsOnGroundBrightness[0]
                end
        
                if imgui.ColorEdit3(u8"������ ������", Im.LowCloudsRGB) then
                    CTimeCycle.m_nLowCloudsRed[i], CTimeCycle.m_nLowCloudsGreen[i], CTimeCycle.m_nLowCloudsBlue[i] = Im.LowCloudsRGB[0] * 255, Im.LowCloudsRGB[1] * 255, Im.LowCloudsRGB[2] * 255
                end
                if imgui.ColorEdit3(u8"������� ������", Im.FluffyCloudsBotttomRGB) then
                    CTimeCycle.m_nFluffyCloudsBottomRed[i], CTimeCycle.m_nFluffyCloudsBottomGreen[i], CTimeCycle.m_nFluffyCloudsBottomBlue[i] = Im.FluffyCloudsBotttomRGB[0] * 255, Im.FluffyCloudsBotttomRGB[1] * 255, Im.FluffyCloudsBotttomRGB[2] * 255
                end
        
                if imgui.ColorEdit4(u8"����", Im.WaterRGBA, imgui.ColorEditFlags.AlphaBar) then
                    CTimeCycle.m_fWaterRed[i], CTimeCycle.m_fWaterGreen[i], CTimeCycle.m_fWaterBlue[i], CTimeCycle.m_fWaterAlpha[i] = Im.WaterRGBA[0] * 255, Im.WaterRGBA[1] * 255, Im.WaterRGBA[2] * 255, Im.WaterRGBA[3] * 255
                end
        
                if imgui.ColorEdit4("PostFx1", Im.PostFx1RGBA, imgui.ColorEditFlags.AlphaBar) then
                    CTimeCycle.m_fPostFx1Red[i], CTimeCycle.m_fPostFx1Green[i], CTimeCycle.m_fPostFx1Blue[i], CTimeCycle.m_fPostFx1Alpha[i] = Im.PostFx1RGBA[0] * 255, Im.PostFx1RGBA[1] * 255, Im.PostFx1RGBA[2] * 255, Im.PostFx1RGBA[3] * 255
                end
        
                if imgui.ColorEdit4("PostFx2", Im.PostFx2RGBA, imgui.ColorEditFlags.AlphaBar) then
                    CTimeCycle.m_fPostFx2Red[i], CTimeCycle.m_fPostFx2Green[i], CTimeCycle.m_fPostFx2Blue[i], CTimeCycle.m_fPostFx2Alpha[i] = Im.PostFx2RGBA[0] * 255, Im.PostFx2RGBA[1] * 255, Im.PostFx2RGBA[2] * 255, Im.PostFx2RGBA[3] * 255
                end
        
                if imgui.SliderInt(u8"������������ �������", Im.CloudAlpha, 0, 255) then
                    CTimeCycle.m_fCloudAlpha[i] = Im.CloudAlpha[0]
                end
        
                if imgui.SliderInt(u8"���. ������������� ���������", Im.HighLightMinIntensity, 0 ,255) then
                    CTimeCycle.m_nHighLightMinIntensity[i] = Im.HighLightMinIntensity[0]
                end
        
                if imgui.SliderInt(u8"������������ ������ �� ����", Im.WaterFogAlpha, 0, 255) then
                    CTimeCycle.m_nWaterFogAlpha[i] = Im.WaterFogAlpha[0]
                end

                if imgui.SliderInt(u8"���� ���������", Im.DirectionalMult, 0, 255) then
                    CTimeCycle.m_nDirectionalMult[i] = Im.DirectionalMult[0]
                end
        
                if imgui.Button(u8"��������� ��������") then
                    CTimeCycle.SaveToFile("timecyc")
                    printStringNow("Timecyc created!", 1000)
                end
        
                imgui.SameLine()
                imgui.SetCursorPosX(500)
                if imgui.Button(u8"�������� ��������") then
                    CTimeCycle.Initialise()
                end
                imgui.PopItemWidth()
            end
        end
        imgui.PopStyleColor()
        imgui.End()
        imgui.PopStyleVar()
    end
)


-- ������� ��� �������� �������� ����������� ������
local function rainbowColor(t, frequency)
    local r = math.sin(frequency * t + 0) * 127 + 128
    local g = math.sin(frequency * t + 2) * 127 + 128
    local b = math.sin(frequency * t + 4) * 127 + 128
    return imgui.ImVec4(r / 255, g / 255, b / 255, 1.0) -- ���������� ���� � ������� RGBA
end


-- ���������� ��� ���������� ������������ ������
local startTime = os.clock()


local newFrame = imgui.OnFrame(
    function() return gfmenu.alpha > 0.00 end,
    function(self)
        self.HideCursor = not gfmenu.state
        if isKeyDown(32) and self.HideCursor == false then
            self.HideCursor = true
        elseif not isKeyDown(32) and self.HideCursor == true and gfmenu.state then
            self.HideCursor = false
        end
        imgui.PushStyleVarFloat(imgui.StyleVar.Alpha, gfmenu.alpha)
        imgui.SetNextWindowPos(imgui.ImVec2(sizeX / 2, sizeY / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
        imgui.SetNextWindowSize(imgui.ImVec2(920, 600), imgui.Cond.FirstUseEver)
        imgui.PushStyleVarVec2(imgui.StyleVar.WindowPadding, imgui.ImVec2(0, 0))
        imgui.Begin("##GameTweaker", new.bool(true), imgui.WindowFlags.NoCollapse + imgui.WindowFlags.NoTitleBar + imgui.WindowFlags.NoResize + imgui.WindowFlags.NoBackground)
       
        imgui.PushStyleColor(imgui.Col.ChildBg, imgui.ImVec4(0.0, 0.0, 0.0, 0.0))
        local eColor = imgui.GetStyle().Colors[imgui.Col.PlotLinesHovered]
        --imgui.Image(fone, imgui.ImVec2(imgui.GetWindowSize().x, imgui.GetWindowSize().y), _,_, imgui.ImVec4(eColor.x + 0.40, eColor.y + 0.40, eColor.z + 0.40, eColor.w + 1.0))
        
        imgui.SetCursorPos(imgui.ImVec2(175, 0))
                imgui.SetCursorPos(imgui.ImVec2(0, 0))
                local draw_list = imgui.GetWindowDrawList()
                local p = imgui.GetCursorScreenPos()
                local eColor = imgui.GetStyle().Colors[imgui.Col.WindowBg]
                local col_box = imgui.GetColorU32Vec4(imgui.ImVec4(eColor.x, eColor.y, eColor.z, eColor.w))
                --draw_list:AddRectFilled(imgui.ImVec2(p.x, p.y), imgui.ImVec2(p.x+175, p.y + 1400), col_box)
                local p = imgui.GetCursorScreenPos()
                imgui.GetWindowDrawList():AddRectFilledMultiColor(imgui.ImVec2(p.x, p.y), imgui.ImVec2(p.x + imgui.GetWindowWidth(), p.y + imgui.GetWindowHeight()), imgui.GetColorU32Vec4(imgui.ImVec4(ini.ColorNavi.r, ini.ColorNavi.g, ini.ColorNavi.b, ini.ColorNavi.a)), imgui.GetColorU32Vec4(imgui.ImVec4(ini.ColorNavi.r, ini.ColorNavi.g, ini.ColorNavi.b, ini.ColorNavi.a)), imgui.GetColorU32Vec4(imgui.ImVec4(eColor.x, eColor.y, eColor.z, eColor.w)), imgui.GetColorU32Vec4(imgui.ImVec4(eColor.x, eColor.y, eColor.z, eColor.w)))
                imgui.BeginChild("##LeftMenu", imgui.ImVec2(190, 430), false)
                
                    imgui.SetCursorPos(imgui.ImVec2(0, 10))
                    imgui.PushFont(fonts[22])
                    imgui.PushFont(logofont)
    
                    imgui.PushStyleColor(imgui.Col.Text, imgui.ImVec4(ini.logocolor.r, ini.logocolor.g, ini.logocolor.b, ini.logocolor.a))

                    local timePassed = os.clock() - startTime
                    local tintCol = rainbowColor(timePassed, 0.5) -- ���������� ���� ������� ��� ��������� �����
                    
                    imgui.Image(imagesLogo[ini.settings.currentLogo], imgui.ImVec2(190, 55), _,_, imgui.ImVec4(ini.logocolor.r, ini.logocolor.g, ini.logocolor.b, ini.logocolor.a))
                    if imgui.IsItemHovered() and imgui.IsMouseClicked(1,true) then   
                        imgui.SetCursorPos(imgui.ImVec2(8, 20))
                        imgui.OpenPopup("popup")
                    end
                    
                    if imgui.BeginPopup('popup') then
                        imgui.PushFont(fonts[15])
                        imgui.Text(u8"�������� �������")
                        imgui.PopFont()
                        for i =1, #imagesLogo do
                            if imgui.ImageButton(imagesLogo[i], imgui.ImVec2(201/1.2, 60/1.2)) then
                                ini.settings.currentLogo = i
                                save()
                                imgui.CloseCurrentPopup()
                            end
                        end
                        imgui.EndPopup()
                    end

                    --imgui.SameLine()
                    --imgui.SetCursorPosY(imgui.GetCursorPosY() + 10)
                    --imgui.Text("GAMETWEAKER")
                    imgui.PopStyleColor(1)
                    imgui.PopFont()
                    imgui.PopFont()

                    imgui.SetCursorPos(imgui.ImVec2(0, 70))
                    imgui.PushFont(fonts[15])
                    imgui.PushFont(iconFont)
                    imgui.CustomMenu(navigations.home, navigations.activeTab.home, imgui.ImVec2(180, 37))
                    imgui.PopFont()
                    imgui.PopFont()
                   
                imgui.EndChild()
                imgui.SetCursorPos(imgui.ImVec2(20, imgui.GetWindowSize().y - 70))
                imgui.Text(u8"Author:")
                imgui.SameLine()
                imgui.Link("https://vk.com/gorskinscripts", "Gorskin")
                imgui.SetCursorPos(imgui.ImVec2(20, imgui.GetWindowSize().y - 50))
                imgui.Text(u8"Design:")
                imgui.SameLine()
                imgui.Link("https://www.youtube.com/channel/UCzwEEGD5o9rcK8uwMsR8kog", "Unsvar")
                imgui.SetCursorPos(imgui.ImVec2(20, imgui.GetWindowSize().y - 30))
                imgui.Text(u8"Version:") imgui.SameLine()
                imgui.TextColored(imgui.ImVec4(imgui.GetStyle().Colors[imgui.Col.CheckMark]), script_version)
                imgui.PopStyleColor(1)
                imgui.SameLine()
                imgui.PushStyleVarVec2(imgui.StyleVar.WindowPadding, imgui.ImVec2(10, 10))
                
                imgui.PushStyleVarFloat(imgui.StyleVar.ChildRounding, 0)
                
                imgui.SetCursorPos(imgui.ImVec2(170, 0))
                    imgui.PushStyleVarFloat(imgui.StyleVar.ChildBorderSize, 0)
                    imgui.BeginChild("##MainMenu", imgui.ImVec2(imgui.GetWindowSize().x - 10, imgui.GetWindowSize().y), true)
                    if CloseButton(u8"", new.bool(true), imgui.ImVec2(imgui.GetWindowSize().x - 190, 15)) then
                        gfmenu.switch()
                    end
                    imgui.Hint(u8"ESC - ������� ����", 0.1)
                    imgui.SetCursorPos(imgui.ImVec2(27, 35))
                    imgui.PopStyleVar()
                    imgui.PushStyleColor(imgui.Col.Border, imgui.ImVec4(0.0, 0.0, 0.0, 0.0))
                    imgui.PushStyleColor(imgui.Col.ChildBg, imgui.ImVec4(0.0, 0.0, 0.0, 0.0))
                    imgui.BeginChild("##MainMenuVnutri", imgui.ImVec2(imgui.GetWindowSize().x - 175, imgui.GetWindowSize().y - 50), true)
                    
                    imgui.PopStyleColor(2)
                    imgui.PushFont(fonts[14])
                    if navigations.activeTab.home[0] == 1 then
                        imgui.SetCursorPos(imgui.ImVec2(imgui.GetWindowSize().x / 90, imgui.GetCursorPosY() + 16))
                        imgui.PushFont(fonts[50])
                        imgui.TextColored(imgui.ImVec4(ini.BeginColor.r, ini.BeginColor.g, ini.BeginColor.b, ini.BeginColor.a), u8"HOME")
                        imgui.PopFont()
                        imgui.PushStyleColor(imgui.Col.Border, ini.borderchild.draw and imgui.GetStyle().Colors[imgui.Col.PlotHistogram] or imgui.ImVec4(0,0,0,0)) -- ����
                        imgui.SetCursorPos(imgui.ImVec2(imgui.GetCursorPosX() - 1, imgui.GetCursorPosY() - 8))
                        imgui.BeginChild("##rightmenugg", imgui.ImVec2(imgui.GetWindowSize().x - 45, imgui.GetWindowSize().y - 85), true)
                        imgui.PopStyleColor(1)
                            imgui.PushFont(fonts[17])
                            imgui.Text(u8"GAMETWEAKER")
                            imgui.PopFont()
                            imgui.SameLine()
                            imgui.Text(u8"- ������������������� ������ ��� ������ ��������� ����:")
                            imgui.Text(u8"�����������, ������������, ��������� �������, ������ � ������ ������!")
                           
                            imgui.PushItemWidth(335)
                            imgui.SetCursorPos(imgui.ImVec2(500, 430))
                            imgui.Text(u8"���������:")
                            imgui.SameLine()
                            if imgui.HotKey("##1������� ����", ActOpenMenuKey, tLastKeys, 100) then
                                rkeys.changeHotKey(bindOpenmenu, ActOpenMenuKey.v)
                                sampAddChatMessage(script_name.." {FFFFFF}������ ��������: {dc4747}" .. table.concat(rkeys.getKeysName(tLastKeys.v), " + ") .. "{ffffff} | �����: {dc4747}" .. table.concat(rkeys.getKeysName(ActOpenMenuKey.v), " + "), 0x73b461)
                                ini.settings.openmenukeys = encodeJson(ActOpenMenuKey.v)
                                save()
                            end
        
                            imgui.PopItemWidth()
                            imgui.SetCursorPos(imgui.ImVec2(10, 270))
                            
                            
                        imgui.EndChild()
                    elseif navigations.activeTab.home[0] == 2 then
                        imgui.SetCursorPos(imgui.ImVec2(imgui.GetWindowSize().x / 90, imgui.GetCursorPosY() + 16))
                        imgui.PushFont(fonts[50])
                        imgui.TextColored(imgui.ImVec4(ini.BeginColor.r, ini.BeginColor.g, ini.BeginColor.b, ini.BeginColor.a), u8"FIXES & PATCHES")
                        imgui.PopFont()
                        imgui.SetCursorPos(imgui.ImVec2(imgui.GetCursorPosX() - 1, imgui.GetCursorPosY() - 8))
                        imgui.PushStyleColor(imgui.Col.Border, ini.borderchild.draw and imgui.GetStyle().Colors[imgui.Col.PlotHistogram] or imgui.ImVec4(0,0,0,0)) -- ����
                        imgui.BeginChild("##leftmenuddd", imgui.ImVec2(130, imgui.GetWindowSize().y - 85), true)
                        imgui.SetCursorPosX(imgui.GetCursorPosX() - 15)
                            imgui.CustomSelectable(navigations.fixesandpatches, navigations.activeTab.fixesandpatches, imgui.ImVec2(160, 30))
                        imgui.EndChild()
                        imgui.SameLine()
                        imgui.PushStyleColor(imgui.Col.Border, ini.borderchild.draw and imgui.GetStyle().Colors[imgui.Col.PlotHistogram] or imgui.ImVec4(0,0,0,0)) -- ����
                        imgui.SetCursorPosX(imgui.GetCursorPosX() - 7)
                        imgui.BeginChild("##rightmenuddd", imgui.ImVec2(imgui.GetWindowSize().x - 174, imgui.GetWindowSize().y - 85), true)
                            if navigations.activeTab.fixesandpatches[0] == 1 then
                                for k, v in orderedPairs(imguiCheckboxesFixes) do
                                    if imgui.Checkbox(k, v.var) then
                                        ini.settings[v.cfg] = v.var[0]
                                        save()
                                        if v.fnc ~= "_" then
                                            gotofunc(v.fnc)
                                        end
                                    end
                                end
                            elseif navigations.activeTab.fixesandpatches[0] == 2 then
                                for k, v in orderedPairs(imguiCheckboxesPatches) do
                                    if imgui.Checkbox(k, v.var) then
                                        ini.settings[v.cfg] = v.var[0]
                                        save()
                                        if v.fnc ~= "_" then
                                            gotofunc(v.fnc)
                                        end
                                    end
                                end
                                imgui.Text(u8"���������� ������:")
                                imgui.BeginChild('##blockkeys', imgui.ImVec2(320, 200), true)
                                    if imgui.Checkbox(u8"����������� ������� F1", checkboxes.nop_samp_keys_F1) then
                                        ini.nop_samp_keys.key_F1 = checkboxes.nop_samp_keys_F1[0]
                                        save()
                                        gotofunc("BlockSampKeys")
                                    end
                                    if imgui.Checkbox(u8"����������� ������� F4", checkboxes.nop_samp_keys_F4) then
                                        ini.nop_samp_keys.key_F4 = checkboxes.nop_samp_keys_F4[0]
                                        save()
                                        gotofunc("BlockSampKeys")
                                    end
                                    if imgui.Checkbox(u8"����������� ������� F7", checkboxes.nop_samp_keys_F7) then
                                        ini.nop_samp_keys.key_F7 = checkboxes.nop_samp_keys_F7[0]
                                        save()
                                        gotofunc("BlockSampKeys")
                                    end
                                    if imgui.Checkbox(u8"����������� ������� T", checkboxes.nop_samp_keys_T) then
                                        ini.nop_samp_keys.key_T = checkboxes.nop_samp_keys_T[0]
                                        save()
                                        gotofunc("BlockSampKeys")
                                    end
                                    if imgui.Checkbox(u8"����������� ������� ����� (ALT+ENTER)", checkboxes.nop_samp_keys_ALTENTER) then
                                        ini.nop_samp_keys.key_ALTENTER = checkboxes.nop_samp_keys_ALTENTER[0]
                                        save()
                                    end
                                    if imgui.Checkbox(u8"����������� ������� PgUp � PgDn", checkboxes.nop_samp_keys_PgUp_PgDn) then
                                        ini.nop_samp_keys.key_PgUp_PgDn = checkboxes.nop_samp_keys_PgUp_PgDn[0]
                                        save()
                                        gotofunc("BlockSampKeys")
                                    end
                                imgui.EndChild()
                            end
                        imgui.EndChild()
  
                        
                        
                        
                    elseif navigations.activeTab.home[0] == 3 then
                        imgui.SetCursorPos(imgui.ImVec2(imgui.GetWindowSize().x / 90, imgui.GetCursorPosY() + 16))
                        imgui.PushFont(fonts[50])
                        imgui.TextColored(imgui.ImVec4(ini.BeginColor.r, ini.BeginColor.g, ini.BeginColor.b, ini.BeginColor.a), u8"GRAPHICS")
                        imgui.PopFont()
                        imgui.SetCursorPos(imgui.ImVec2(imgui.GetCursorPosX() - 1, imgui.GetCursorPosY() - 8))
                        imgui.PushStyleColor(imgui.Col.Border, ini.borderchild.draw and imgui.GetStyle().Colors[imgui.Col.PlotHistogram] or imgui.ImVec4(0,0,0,0)) -- ����
                        imgui.BeginChild("##leftmenudd", imgui.ImVec2(190, imgui.GetWindowSize().y - 85), true)
                            imgui.SetCursorPosX(imgui.GetCursorPosX() - 15)
                            imgui.CustomSelectable(navigations.graphics, navigations.activeTab.graphics, imgui.ImVec2(200, 30))
                        imgui.EndChild()
                        imgui.SameLine()
                        imgui.PushStyleColor(imgui.Col.Border, ini.borderchild.draw and imgui.GetStyle().Colors[imgui.Col.PlotHistogram] or imgui.ImVec4(0,0,0,0)) -- ����
                        imgui.SetCursorPosX(imgui.GetCursorPosX() - 7)
                        imgui.BeginChild("##rightmenudd", imgui.ImVec2(imgui.GetWindowSize().x - 234, imgui.GetWindowSize().y - 85), true)
                        imgui.PopStyleColor(2)
                            if navigations.activeTab.graphics[0] == 1 then
                                imgui.PushFont(iconFont) -- ���������� ���������� ������
                                imgui.PushItemWidth(350)
                                if imgui.Checkbox(u8"��������� ��������� �����", checkboxes.nopgamma) then
                                    ini.settings.nopgamma = checkboxes.nopgamma[0]
                                    save()
                                    gotofunc("SetBrightness")
                                end
                            
                                
                                imgui.Text(fa.ICON_FA_IMAGE..u8" �������:") imgui.SameLine() imgui.SetCursorPosX(120)
                                if imgui.SliderInt(u8"##brightness", sliders.brightness, 0, 500, u8"%d %%") then
                                    ini.settings.brightness = sliders.brightness[0]
                                    save()
                                    gotofunc("SetBrightness")
                                end
                                
                                    
                                imgui.Text(fa.ICON_FA_CLOUD_RAIN..u8" ������:")
                                
                                imgui.SameLine()
                                imgui.SetCursorPosX(120)
                                if imgui.SliderInt(u8"##Weather", sliders.weather, 0, 45) then
                                    ini.settings.weather = sliders.weather[0]
                                    save()
                                    gotofunc("SetWeather")
                                end
                            

                            
                                imgui.Text(fa.ICON_FA_CLOCK..u8" ����:")
                                imgui.SameLine()
                                imgui.SetCursorPosX(120)
                                if imgui.SliderInt(u8"##hours", sliders.hours, 0, 23) then
                                    ini.settings.hours = sliders.hours[0]
                                    save()
                                    gotofunc("SetTime")
                                end
                                imgui.Text(fa.ICON_FA_HOURGLASS_HALF..u8" ������:")
                                imgui.SameLine()
                                imgui.SetCursorPosX(120)
                                if imgui.SliderInt(u8"##min", sliders.min, 0, 59) then
                                    ini.settings.min = sliders.min[0]
                                    save()
                                    gotofunc("SetTime")
                                end
                            
                                imgui.PopFont()--����� ���������� ������
                                imgui.PopItemWidth()
                                if imgui.Checkbox(u8"����������� ��������� ������ ��������", checkboxes.blockweather) then
                                    ini.settings.blockweather = checkboxes.blockweather[0]
                                    save()
                                    gotofunc("BlockWeather")
                                    gotofunc("SetWeather")
                                end
                                if imgui.Checkbox(u8"����������� ��������� ������� ��������", checkboxes.blocktime) then
                                    ini.settings.blocktime = checkboxes.blocktime[0]
                                    save()
                                    gotofunc("BlockTime")
                                    gotofunc("SetTime")
                                end
                                
                                if imgui.Checkbox(u8"������������� �������� ������� � ��", checkboxes.sync_time) then
                                    ini.settings.sync_time = checkboxes.sync_time[0]
                                    save()
                                end
                                if imgui.Checkbox(u8"���� �������", checkboxes.gtatime) then
                                    ini.settings.gtatime = checkboxes.gtatime[0]
                                    save()
                                    gotofunc("GTATime")
                                end
                                

                                if ini.settings.blockweather then
                                    if imgui.Checkbox(u8"���� ����� (�������� ������ ������ � ������ �������)", checkboxes.gtaweather) then
                                        ini.settings.gtaweather = checkboxes.gtaweather[0]
                                        save()
                                        gotofunc("GTAWeather")
                                    end
                                    imgui.Text(u8"��������� ����� �����:")
                                    imgui.BeginChild('##gtawetherset', imgui.ImVec2(290, 105), false)
                                        if imgui.Checkbox(u8"������������ ��������� ������", checkboxes.noRain) then
                                            ini.settings.noRain = checkboxes.noRain[0]
                                            save()
                                            gotofunc("GTAWeather")
                                        end
                                        if imgui.Checkbox(u8"������������ �������� ������", checkboxes.noFog) then
                                            ini.settings.noFog = checkboxes.noFog[0]
                                            save()
                                            gotofunc("GTAWeather")
                                        end
                                        if imgui.Checkbox(u8"������������ �������� ����", checkboxes.noSandstorm) then
                                            ini.settings.noSandstorm = checkboxes.noSandstorm[0]
                                            save()
                                            gotofunc("GTAWeather")
                                        end
                                    imgui.EndChild()
                                end
                                
                                
                            elseif navigations.activeTab.graphics[0] == 2 then
                                    if imgui.Checkbox(u8"�������� ����������� ������ ����������", checkboxes.givemedist) then
                                        ini.settings.givemedist = not ini.settings.givemedist
                                        save()
                                        gotofunc("GivemeDist")
                                    end
                                    if ini.settings.givemedist then
                                        imgui.PushItemWidth(480)
                                            if imgui.DragFloat(u8"##Drawdist", sliders.drawdist, 1.0, 35.00, 2000.00, u8"�������� ����������: %.2f") then
                                                ini.settings.drawdist = ("%.2f"):format(sliders.drawdist[0])
                                                save()
                                                memory.setfloat(12044272, ini.settings.drawdist, true)
                                            end
                                            imgui.SetCursorPosY(imgui.GetCursorPosY()+10)
                                            if imgui.DragFloat(u8"##drawdistair", sliders.drawdistair, 1.0, 35.00, 2000.00, u8"� ��������� ����������: %.2f") then
                                                ini.settings.drawdistair = ("%.2f"):format(sliders.drawdistair[0])
                                                save()
                                                if isCharInAnyPlane(PLAYER_PED) or isCharInAnyHeli(PLAYER_PED) then
                                                    if memory.getfloat(12044272, true) ~= ini.settings.drawdistair then
                                                        memory.setfloat(12044272, ini.settings.drawdistair, true)
                                                    end
                                                end
                                            end
                                            imgui.SetCursorPosY(imgui.GetCursorPosY()+10)
                                            if imgui.DragFloat(u8"##drawdistpara", sliders.drawdistpara, 1.0, 35.00, 2000.00, u8"��� ������������� ��������: %.2f") then
                                                ini.settings.drawdistpara = ("%.2f"):format(sliders.drawdistpara[0])
                                                save()
                                                if getCurrentCharWeapon(PLAYER_PED) == 46 then
                                                    if memory.getfloat(12044272, true) ~= ini.settings.drawdistpara then
                                                        memory.setfloat(12044272, ini.settings.drawdistpara, true)
                                                    end
                                                end
                                            end
                                            imgui.SetCursorPosY(imgui.GetCursorPosY()+10)
                                            if imgui.DragFloat(u8"##fog", sliders.fog, 1.0, -1000.00, 2000.00, u8"��������� ������: %.2f") then
                                                ini.settings.fog = ("%.2f"):format(sliders.fog[0])
                                                save()
                                                memory.setfloat(13210352, ini.settings.fog, true)
                                            end
                                            
                                        imgui.PopItemWidth()
                                    end
                                imgui.PushItemWidth(480)
                                imgui.SetCursorPosY(imgui.GetCursorPosY()+10)
                                if imgui.DragFloat(u8"##lod", sliders.lod, 1.0, 0.00, 1000.00, u8"��������� �����: %.2f") then
                                    ini.settings.lod = ("%.2f"):format(sliders.lod[0])
                                    save()
                                    gotofunc("LodDist")
                                end
                                imgui.SetCursorPosY(imgui.GetCursorPosY()+10)
                                if imgui.DragFloat(u8"##vehloddist", sliders.vehloddist, 1.0, 0.00, 190.00, u8"��������� ����� ����������: %.2f") then
                                    ini.settings.vehloddist = ("%.2f"):format(sliders.vehloddist[0])
                                    save()
                                    gotofunc("SetDistLodVeh")
                                end
                                imgui.SetCursorPosY(imgui.GetCursorPosY()+10)
                                if imgui.Checkbox(u8"�������� ����������� ������ ���������� ���������", checkboxes.givemedistnames) then
                                    ini.settings.givemedistnames = checkboxes.givemedistnames[0]
                                    save()
                                end
                                if ini.settings.givemedistnames and memory.read(0xFFFC90, 4, true) ~= 697076735 then
                                    if tonumber(sliders.nickdistance[0]) > tonumber(memory.getfloat(0xFFFC90, true)) then sliders.nickdistance[0] = memory.getfloat(0xFFFC90, true) end
                                    if imgui.DragFloat(u8"##ntgs", sliders.nickdistance, 0.5, 0.00, memory.getfloat(0xFFFC90, true), u8"��������� ���������: %.2f") then
                                        ini.settings.nickdistance = ("%.2f"):format(sliders.nickdistance[0])
                                        save()
                                        gotofunc("SetDistNickNames")
                                    end
                                end
                                imgui.PopItemWidth()
                                
                            elseif navigations.activeTab.graphics[0] == 3 then
                                if imgui.Checkbox(u8"�������� ����������� ������ ��������� ��������� ��������", checkboxes.givemedistobj) then
                                    ini.settings.givemedistobj = checkboxes.givemedistobj[0]
                                    save()
                                    gotofunc("SetDistObjects")
                                end
                                if ini.settings.givemedistobj then
                                    imgui.PushItemWidth(480)
                                    if imgui.SliderFloat(u8"##dfonars", sliders.distobjects_stolb_fonars, -10.0, 90.0, u8"��������� ��������� �������: %.1f") then
                                        ini.settings.distobjects_stolb_fonars = ("%.1f"):format(sliders.distobjects_stolb_fonars[0])
                                        save()
                                        gotofunc("SetDistObjects")
                                    end
                                    imgui.SetCursorPosY(imgui.GetCursorPosY()+10)
                                    if imgui.SliderFloat(u8"##dmusor", sliders.distobjects_musor, -10.0, 40.0, u8"��������� ��������� ������: %.1f") then
                                        ini.settings.distobjects_musor = ("%.1f"):format(sliders.distobjects_musor[0])
                                        save()
                                        gotofunc("SetDistObjects")
                                    end
                                    imgui.PopItemWidth()
                                    imgui.NewLine()
                                    imgui.Separator()
                                    imgui.Text(u8'��������� ��������� ��������� ��������.')
                                    imgui.Separator()
                                    imgui.NewLine()
                                    imgui.Text(u8'������� id ������� (int), �������� (string), ��������� (int)')
                                    imgui.Text(u8'������ �������������: 1280 �������� 50')
                                    imgui.InputTextMultiline("##multilineText", buffers.multilineText, sizeof(buffers.multilineText), imgui.ImVec2(200, 230))
                                    if imgui.Button(u8"���������", imgui.ImVec2(100,25)) and buffers.multilineText[0] ~= " " and buffers.multilineText[0] ~= "" and buffers.multilineText[0] ~= nil then
                                        if doesFileExist("moonloader\\GameTweaker\\Objects_Dist.txt") then
                                            local path = getGameDirectory().."//moonloader//GameTweaker//Objects_Dist.txt"
                                            os.remove(path)
                                            file = io.open("moonloader\\GameTweaker\\Objects_Dist.txt", "a+") -- ��������� ����
                                            file:write(string.format(""..u8:decode ( ffi.string(buffers.multilineText) ).."\n") )
        
                                            file:close()
                                            objdists = {}
                                            getobjdists()
                                            gotofunc("SetDistObjects")
                                        end
                                    end
                                    
                                end
                            elseif navigations.activeTab.graphics[0] == 4 then
                                if imgui.Checkbox(u8"�������� ����������� ������ ����", checkboxes.shadowedit) then
                                    ini.settings.shadowedit = checkboxes.shadowedit[0]
                                    save()
                                    gotofunc("ShadowEdit")
                                end
                                if imgui.Checkbox(u8"��������� ���� ���� ���������", checkboxes.noshadows) then
                                    ini.settings.noshadows = checkboxes.noshadows[0]
                                    save()
                                    gotofunc("NoShadows")
                                end
                                if imgui.Checkbox(u8"��������� ���� ��� ����������", checkboxes.pedshadows) then
                                    ini.settings.pedshadows = checkboxes.pedshadows[0]
                                    save()
                                    gotofunc("NoShadows")
                                end
                                if imgui.Checkbox(u8"��������� ���� ��� �����������", checkboxes.vehshadows) then
                                    ini.settings.vehshadows = checkboxes.vehshadows[0]
                                    save()
                                    gotofunc("NoShadows")
                                end
                                if imgui.Checkbox(u8"��������� ���� ��� ��������", checkboxes.poleshadows) then
                                    ini.settings.poleshadows = checkboxes.vehshadows[0]
                                    save()
                                    gotofunc("NoShadows")
                                end
                                if imgui.Checkbox(u8"��������� ���� �� ������� �������� �������", checkboxes.maxshadows) then
                                    ini.settings.maxshadows = checkboxes.maxshadows[0]
                                    save()
                                    gotofunc("NoShadows")
                                end
                                
            
                                if ini.settings.shadowedit then
                                    if not ini.settings.noshadows then
                                    imgui.PushItemWidth(525)
                                        if imgui.SliderInt(u8"##shadowcp", sliders.shadowcp, 0, 255, u8"�������� ����: %d") then
                                            ini.settings.shadowcp = sliders.shadowcp[0]
                                            save()
                                            memory.setint32(12043496, ini.settings.shadowcp, true)
                                        end
                                        imgui.SetCursorPosY(imgui.GetCursorPosY()+10)
                                        if imgui.SliderInt(u8"##shadowlight", sliders.shadowlight, 0, 255, u8"���� �������: %d") then
                                            ini.settings.shadowlight = sliders.shadowlight[0]
                                            save()
                                            memory.setint32(12043500, ini.settings.shadowlight, true)
                                        end
                                    imgui.PopItemWidth()
                                    end
                                end
                            elseif navigations.activeTab.graphics[0] == 5 then
                                imgui.Text(u8"����������: ��������� ������� �� ��������� �����.\n����� ��� ������� ���������� �������� ���� ������.")
                                    --imgui.SetCursorPos(imgui.ImVec2(100,80))
                                    imgui.BeginTitleChild(u8"������� ����������", imgui.ImVec2(450, 500), 6, 158)
                                        for k, v in orderedPairs(imguiCheckboxesVehicleEffectsManager) do
                                            if imgui.Checkbox(k, v.var) then
                                                ini.effects_manager[v.cfg] = v.var[0]
                                                ini.settings[v.cfg] = v.var[0]
                                                save()
                                                gotofunc(v.fnc)
                                            end
                                        end
         
                                        if imgui.Checkbox(u8"�������� ��� ��������", checkboxes.MotionBlur) then
                                            ini.effects_manager.MotionBlur = checkboxes.MotionBlur[0]
                                            save()
                                            gotofunc("EffectsManager")
                                        end
                                        if ini.effects_manager.MotionBlur then
                                            --imgui.PushItemWidth(180)
                            
                                            if imgui.SliderInt(u8"##������������� �������� ��� ��������", sliders.MotionBlurIntensity, 1, 100, u8"�������������: %d") then
                                                ini.effects_manager.MotionBlurIntensity = sliders.MotionBlurIntensity[0]
                                                save()
                                                gotofunc("EffectsManager")
                                            end
                                            --imgui.PopItemWidth()
                                        end
                                    imgui.EndChild()
                                    imgui.BeginTitleChild(u8"������� ������", imgui.ImVec2(450, 220), 6, 170)
                                        for k, v in orderedPairs(imguiCheckboxesWeaponEffectsManager) do
                                            if imgui.Checkbox(k, v.var) then
                                                ini.effects_manager[v.cfg] = v.var[0]
                                                ini.settings[v.cfg] = v.var[0]
                                                save()
                                                gotofunc(v.fnc)
                                            end
                                        end
                                    imgui.EndChild()
                                    imgui.BeginTitleChild(u8"������� ����", imgui.ImVec2(450, 150), 6, 178)
                                    for k, v in orderedPairs(imguiCheckboxesEffectsManagerSky) do
                                        if imgui.Checkbox(k, v.var) then
                                            ini.effects_manager[v.cfg] = v.var[0]
                                            ini.settings[v.cfg] = v.var[0]
                                            save()
                                            gotofunc(v.fnc)
                                        end
                                    end
                                    imgui.EndChild()
                                    imgui.BeginTitleChild(u8"������ �������", imgui.ImVec2(450, 350), 6, 170)
                                    for k, v in orderedPairs(imguiCheckboxesEffectsManagerOther) do
                                        if imgui.Checkbox(k, v.var) then
                                            ini.effects_manager[v.cfg] = v.var[0]
                                            ini.settings[v.cfg] = v.var[0]
                                            save()
                                            gotofunc(v.fnc)
                                        end
                                    end
                                    imgui.EndChild()

                            elseif navigations.activeTab.graphics[0] == 6 then
                                imgui.Text(u8"����� ���������� � �������� ���������.")
                                imgui.Text(u8"������ ������� ��������� ������� ����������� ��������.")
                                imgui.NewLine()
                                imgui.Text(u8"�������� ����������� � �����: \n"..getWorkingDirectory().."\\GameTweaker\\timecyc")
                                imgui.Text(u8"����� �������� ��������� ���� �� ����� \n"..getWorkingDirectory().."\\GameTweaker\\timecyc\n"..u8"��������� � ����� modloader ��� � ����� data")
                                imgui.NewLine()
                                if imgui.Button(u8'������� �������� ���������', imgui.ImVec2(200, 25)) then
                                    gfmenu.switch()
                                    timecyc_creator.switch()
                                end
                                if imgui.Checkbox(u8"��������� ��������� ��� ����������� ����-���������", checkboxes.fixtimecyc) then
                           
                                    ini.fixtimecyc.active = checkboxes.fixtimecyc[0]
                                    save()
                                    gotofunc("FixTimecyc")
                                end
                                if ini.fixtimecyc.active then
                                    imgui.PushItemWidth(470)
                                    if imgui.ColorEdit3(u8"##World Ambient", icolors.wamb, imgui.ColorEditFlags.NoInputs) then
                                        ini.fixtimecyc.worldambientR, ini.fixtimecyc.worldambientG, ini.fixtimecyc.worldambientB = ("%.3f"):format(icolors.wamb[0]), ("%.3f"):format(icolors.wamb[1]), ("%.3f"):format(icolors.wamb[2])
                                        save()
                                        gotofunc("FixTimecyc")
                                    end
                                    imgui.SameLine()
                                    imgui.Text(u8"World Ambient")
                                    imgui.Text(u8"Brightness all ambient:")
                                    if imgui.SliderFloat(u8"##AllAmbient", sliders.allambient, 0.000, 1.000, "%.3f") then
                                        ini.fixtimecyc.allambient = ("%.3f"):format(sliders.allambient[0])
                                        save()
                                        gotofunc("FixTimecyc")
                                    end
                                    imgui.Text(u8"Brightness object ambient:")
                                    if imgui.SliderFloat(u8"##ObjAmbient", sliders.objambient, 0.000, 1.000, "%.3f") then
                                        ini.fixtimecyc.objambient = ("%.3f"):format(sliders.objambient[0])
                                        save()
                                        gotofunc("FixTimecyc")
                                    end
                                    imgui.PopItemWidth()
                                end
                            elseif navigations.activeTab.graphics[0] == 7 then
                                imgui.PushItemWidth(400)
                                if imgui.SliderFloat(u8'##����������� ������', sliders.aspectratio, 0.5, 3.0, u8"����������� ������: %.2f") then
                                    ini.settings.aspectratio = ("%.2f"):format(sliders.aspectratio[0])
                                    save()
                                    gotofunc("ScreenOptions")
                                end
                                imgui.PopItemWidth()
                                imgui.SameLine()
                                if imgui.Button(u8'��������', imgui.ImVec2(70, 25)) then
                                    ini.settings.aspectratio = 1.33
                                    save()
                                    sliders.aspectratio[0] =  ini.settings.aspectratio
                                    gotofunc("ScreenOptions")
                                end
                                if imgui.Checkbox(u8"���� ���� ������", checkboxes.CustomFov) then
                                    ini.settings.CustomFov = checkboxes.CustomFov[0]
                                    save()
                                end
                                if ini.settings.CustomFov then
                                    if imgui.SliderFloat(u8'##���� ������', sliders.fov, 70.0, 100.0, u8"���� ������: %.2f") then
                                        ini.settings.fov = ("%.2f"):format(sliders.fov[0])
                                        save()
                                        gotofunc("ScreenOptions")
                                    end
                                end
                            end
                        imgui.EndChild()
                        
                        elseif navigations.activeTab.home[0] == 4 then
                            imgui.SetCursorPos(imgui.ImVec2(imgui.GetWindowSize().x / 90, imgui.GetCursorPosY() + 16))
                            imgui.PushFont(fonts[50])
                            imgui.TextColored(imgui.ImVec4(ini.BeginColor.r, ini.BeginColor.g, ini.BeginColor.b, ini.BeginColor.a), u8"OPTIMIZATION")
                            imgui.PopFont()
                            imgui.SetCursorPos(imgui.ImVec2(imgui.GetCursorPosX() - 1, imgui.GetCursorPosY() - 8))
                            imgui.PushStyleColor(imgui.Col.Border, ini.borderchild.draw and imgui.GetStyle().Colors[imgui.Col.PlotHistogram] or imgui.ImVec4(0,0,0,0)) -- ����
                            imgui.BeginChild("##leftmenuddd", imgui.ImVec2(170, imgui.GetWindowSize().y - 85), true)
                            imgui.SetCursorPosX(imgui.GetCursorPosX() - 15)
                                imgui.CustomSelectable(navigations.optimization, navigations.activeTab.optimization, imgui.ImVec2(185, 30))
                            imgui.EndChild()
                            imgui.SameLine()
                            imgui.PushStyleColor(imgui.Col.Border, ini.borderchild.draw and imgui.GetStyle().Colors[imgui.Col.PlotHistogram] or imgui.ImVec4(0,0,0,0)) -- ����
                            imgui.SetCursorPosX(imgui.GetCursorPosX() - 7)
                            imgui.BeginChild("##rightmenuddd", imgui.ImVec2(imgui.GetWindowSize().x - 214, imgui.GetWindowSize().y - 85), true)
                            imgui.PopStyleColor(2)
                                if navigations.activeTab.optimization[0] == 1 then
                                    if imgui.Checkbox(u8"���������� ��������� �� ������� ������", checkboxes.cleaninfo) then
                                        ini.cleaner.cleaninfo = checkboxes.cleaninfo[0]
                                        save()
                                    end
                                    if imgui.Checkbox(u8"�������� ����-������� ������", checkboxes.autoclean) then
                                        ini.cleaner.autoclean = checkboxes.autoclean[0]
                                        save()
                                    end
                                    if ini.cleaner.autoclean then
                                        imgui.PushItemWidth(480)
                                        if imgui.SliderInt(u8"##memlimit", sliders.limitmem, 80, 3000, u8"����� ��� ����-�������: %d ��") then
                                            ini.cleaner.limit = sliders.limitmem[0]
                                            save()
                                        end
                                        imgui.PopItemWidth()
                                    end
                                    if imgui.Button(u8"�������� ������", imgui.ImVec2(150, 25)) then
                                        gotofunc("CleanMemory")
                                    end
                                elseif navigations.activeTab.optimization[0] == 2 then
                                    if imgui.Checkbox(u8"�������� ��������� ��������", checkboxes.custom_nametags) then
                                        ini.custom_nametags.status = checkboxes.custom_nametags[0]
                                        save()
                                        if ini.custom_nametags.status then
                                            nameTags.setState(0)
                                        else
                                            nameTags.setState(1)
                                        end
                                    end
                                    if ini.custom_nametags.status then
                                        imgui.Text(u8"�������� ������:")
                                        imgui.SameLine()
                                        imgui.PushItemWidth(120)
                                        imgui.InputText(u8"##cntfn", buffers.cnt_fontname, sizeof(buffers.cnt_fontname))
                                        imgui.PopItemWidth()
                                        imgui.SameLine() imgui.SetCursorPosX(260) if imgui.Button(u8"���������##cnt", imgui.ImVec2(90, 25)) then ini.custom_nametags.fontName = str(buffers.cnt_fontname) save() cntfont() end
                                        imgui.PushItemWidth(235)
                                        if imgui.SliderInt(u8"������ ������##cntfontsize", sliders.custom_nametags_fontSize, 5, 30) then
                                            ini.custom_nametags.fontSize = sliders.custom_nametags_fontSize[0]
                                            save()
                                            cntfont()
                                        end
                                        if imgui.SliderInt(u8"���� ������##cntfontflag", sliders.custom_nametags_fontFlag, 0, 15) then
                                            ini.custom_nametags.fontFlag = sliders.custom_nametags_fontFlag[0]
                                            save()
                                            cntfont()
                                        end
                                        imgui.PopItemWidth()
                                    end
                                elseif navigations.activeTab.optimization[0] == 3 then
                                    if imgui.Checkbox(u8"�������� ������������ ������", checkboxes.framelimiter) then
                                        ini.settings.framelimiter = checkboxes.framelimiter[0]
                                        save()
                                    end
                                    if ini.settings.framelimiter then
                                        imgui.Text(u8"����������:")
                                        imgui.BulletText(u8"��� ���� ����� ������� ��� ������� ������� CTRL � ��� �� ��������.")
                                        imgui.BulletText(u8"�������� ���� 299 ������ ����� �������� ��� ��� �����������.")
                                        imgui.PushItemWidth(480)
                                        if imgui.SliderInt(u8"##������", sliders.pedfps, 5, 300, u8"FPS � ���: %d") then
                                            ini.smart_fps.pedfps = sliders.pedfps[0] save()
                                        end
                                        imgui.SetCursorPosY(imgui.GetCursorPosY()+10)
                                        if imgui.SliderInt(u8"##� ������", sliders.vehfps, 5, 300, u8"FPS � ������: %d") then
                                            ini.smart_fps.vehfps = sliders.vehfps[0] save()
                                        end
                                        imgui.SetCursorPosY(imgui.GetCursorPosY()+10)
                                        if imgui.SliderInt(u8"##� �����", sliders.boatfps, 5, 300, u8"FPS � �����: %d") then
                                            ini.smart_fps.boatfps = sliders.boatfps[0] save()
                                        end
                                        imgui.SetCursorPosY(imgui.GetCursorPosY()+10)
                                        if imgui.SliderInt(u8"##� ����������", sliders.motofps, 5, 300, u8"FPS � ����������: %d") then
                                            ini.smart_fps.motofps = sliders.motofps[0] save()
                                        end
                                        imgui.SetCursorPosY(imgui.GetCursorPosY()+10)
                                        if imgui.SliderInt(u8"##� �����������", sliders.bikefps, 5, 300, u8"FPS � �����������: %d") then
                                            ini.smart_fps.bikefps = sliders.bikefps[0] save()
                                        end
                                        imgui.SetCursorPosY(imgui.GetCursorPosY()+10)
                                        if imgui.SliderInt(u8"##�� ����� ��������", sliders.swimfps, 5, 300, u8"FPS �� ����� ��������: %d") then
                                            ini.smart_fps.swimfps = sliders.swimfps[0] save()
                                        end
                                        imgui.SetCursorPosY(imgui.GetCursorPosY()+10)
                                        if imgui.SliderInt(u8"##� ����������", sliders.helifps, 5, 300, u8"FPS � ����������: %d") then
                                            ini.smart_fps.helifps = sliders.helifps[0] save()
                                        end
                                        imgui.SetCursorPosY(imgui.GetCursorPosY()+10)
                                        if imgui.SliderInt(u8"##� ���������", sliders.planefps, 5, 300, u8"FPS � ���������: %d") then
                                            ini.smart_fps.planefps = sliders.planefps[0] save()
                                        end
                                        imgui.SetCursorPosY(imgui.GetCursorPosY()+10)
                                        if imgui.SliderInt(u8"##sniper", sliders.snipergunfps, 5, 300, u8"FPS Sniper Gun: %d") then
                                            ini.smart_fps.snipergunfps = sliders.snipergunfps[0] save()
                                        end
                                        imgui.SetCursorPosY(imgui.GetCursorPosY()+10)
                                        if imgui.SliderInt(u8"##spray", sliders.spraygunfps, 5, 300, u8"FPS Spray Can: %d") then
                                            ini.smart_fps.spraygunfps = sliders.spraygunfps[0] save()
                                        end
                                        imgui.PopItemWidth()
                                    end

                                elseif navigations.activeTab.optimization[0] == 4 then
                                   
                                    for k, v in orderedPairs(imguiCheckboxesBoostFPS) do
                                        if imgui.Checkbox(k, v.var) then
                                            ini.settings[v.cfg] = v.var[0]
                                            save()
                                            gotofunc(v.fnc)
                                        end
                                    end

                                end
                            imgui.EndChild()

                elseif navigations.activeTab.home[0] == 5 then
                    imgui.SetCursorPos(imgui.ImVec2(imgui.GetWindowSize().x / 90, imgui.GetCursorPosY() + 16))
                    imgui.PushFont(fonts[50])
                    imgui.TextColored(imgui.ImVec4(ini.BeginColor.r, ini.BeginColor.g, ini.BeginColor.b, ini.BeginColor.a), u8"SOUNDS")
                    imgui.PopFont()
                    imgui.PushStyleColor(imgui.Col.Border, ini.borderchild.draw and imgui.GetStyle().Colors[imgui.Col.PlotHistogram] or imgui.ImVec4(0,0,0,0)) -- ����
                    imgui.SetCursorPos(imgui.ImVec2(imgui.GetCursorPosX() - 1, imgui.GetCursorPosY() - 8))
                    imgui.BeginChild("##rightmenugg", imgui.ImVec2(imgui.GetWindowSize().x - 45, imgui.GetWindowSize().y - 85), true)
                    imgui.PopStyleColor(1)
                    for i, title in ipairs(navigations.sounds) do
                        if HeaderButton(navigations.current_sounds == i, title) then
                            navigations.current_sounds = i
                        end
                        if i ~= #navigations.sounds then
                            imgui.SameLine(nil, 30)
                        end
                    end
                    if navigations.current_sounds == 1 then
                            imgui.SetCursorPos(imgui.ImVec2(10, 40))
                            if imgui.Checkbox(u8"�������� Ultimate Genrl", checkboxes.ugenrl_enable) then
                                ini.ugenrl_main.enable = checkboxes.ugenrl_enable[0]
                                if ini.ugenrl_main.enable then
                                    if ini.settings.sounds then
                                        ini.settings.sounds = false
                                    end
                                else
                                    if not ini.settings.sounds then
                                        ini.settings.sounds = true
                                    end
                                    
                                    memory.hex2bin("752D", 0x503D34, 2)
                                    writeMemory(0x4D89DB, 4, 0x498D03EB, true)--on sounds 
                                end
                                save()
                                checkboxes.sounds[0] = ini.settings.sounds
                                gotofunc("NoSounds")
                            end
                            
                            if checkboxes.ugenrl_enable[0] then
                                if imgui.Checkbox(u8"����� ���������", checkboxes.weapon_checkbox) then
                                    ini.ugenrl_main.weapon = checkboxes.weapon_checkbox[0]
                                    save()
                                end
                                imgui.SameLine()
                                if imgui.Checkbox(u8"���� ��������� �� �������", checkboxes.hit_checkbox) then
                                    ini.ugenrl_main.hit = checkboxes.hit_checkbox[0]
                                    save()
                                end
                                imgui.SameLine()
                                if imgui.Checkbox(u8"����� ����", checkboxes.pain_checkbox) then
                                    ini.ugenrl_main.pain = checkboxes.pain_checkbox[0]
                                    save()
                                end
                            
                                if checkboxes.weapon_checkbox[0] then
                                    if imgui.Checkbox(u8"����� ��������� �������", checkboxes.enemyweapon_checkbox) then
                                        ini.ugenrl_main.enemyWeapon = checkboxes.enemyweapon_checkbox[0]
                                        save()
                                    end
                                end
                                imgui.SetCursorPos(imgui.ImVec2(300, 45))
                                imgui.PushItemWidth(230)
                                imgui.Text(u8"����� Ugenrl:")
                                imgui.SameLine()
                                imgui.SetCursorPosY(40)
                                if imgui.Combo(u8"##����� Ugenrl", gmodevar, gmodechar, #gmodetext) then
                                    ini.ugenrl_main.mode = gmodevar[0]
                                    save()
                                    gotofunc("UgenrlMode")
                                end
                                imgui.Hint(u8"�������� �������:\n1. ������� ������������������ - ��������� ��� ����� ���� �.� ����������� ����� ��������������� ������ � ���� �������� ������� �������� �� CPU. �������� ��� ������� ���� ������ ������ ��������� ����� � �4.\n2. ����� ���� + Genrl - ��������� ������ ����� �������������� ������ � ���. ����� ������ ����� ���������������� ��������.\n3. ����� ���� + ������� - ��� ����� ���� �������� �� ����. �� ������ ������� ������ ����� ��������� �� ����.", 0.3)
                                imgui.PopItemWidth()
                                if ini.ugenrl_main.mode ~= 2 then
                                    imgui.SetCursorPos(imgui.ImVec2(15, 125))
                                    imgui.BeginTitleChild(u8"Deagle", imgui.ImVec2(140, 142), 6, 10)
                                        for i, v in ipairs(deagleSounds) do
                                            if selected ~= getNumberSounds(24, deagleSounds) then
                                                selected = getNumberSounds(24, deagleSounds)
                                            end
                                            if imgui.Selectable(tostring(i)..". "..v, selected == i) then
                                                changeSound(24, deagleSounds[i])
                                            end
                                        end
                                    imgui.EndChild()
                                    imgui.SetCursorPos(imgui.ImVec2(180, 125))
                                    imgui.BeginTitleChild(u8"Shotgun", imgui.ImVec2(140, 142), 6, 10)
                                        for i, v in ipairs(shotgunSounds) do
                                            if selected ~= getNumberSounds(25, shotgunSounds) then
                                                selected = getNumberSounds(25, shotgunSounds)
                                            end
                                            if imgui.Selectable(tostring(i)..". "..v, selected == i) then
                                                changeSound(25, shotgunSounds[i])
                                            end
                                        end
                                    imgui.EndChild()
                                    imgui.SetCursorPos(imgui.ImVec2(345, 125))
                                    imgui.BeginTitleChild(u8" M4", imgui.ImVec2(140, 142), 6, 10)
                                        for i, v in ipairs(m4Sounds) do
                                            if selected ~= getNumberSounds(31, m4Sounds) then
                                                selected = getNumberSounds(31, m4Sounds)
                                            end
                                            if imgui.Selectable(tostring(i)..". "..v, selected == i) then
                                                changeSound(31, m4Sounds[i])
                                            end
                                        end
                                    imgui.EndChild()

                                    imgui.SetCursorPos(imgui.ImVec2(510, 125))
                                    imgui.BeginTitleChild(u8"Rifle", imgui.ImVec2(140, 142), 6, 10)
                                        for i, v in ipairs(rifleSounds) do
                                            if selected ~= getNumberSounds(33, rifleSounds) then
                                                selected = getNumberSounds(33, rifleSounds)
                                            end
                                            if imgui.Selectable(tostring(i)..". "..v, selected == i) then
                                                changeSound(33, rifleSounds[i])
                                            end
                                        end
                                    imgui.EndChild()

                                    imgui.SetCursorPos(imgui.ImVec2(15, 320))
                                    imgui.BeginTitleChild(u8"MP5", imgui.ImVec2(140, 142), 6, 10)
                                        for i, v in ipairs(mp5Sounds) do
                                            if selected ~= getNumberSounds(29, mp5Sounds) then
                                                selected = getNumberSounds(29, mp5Sounds)
                                            end
                                            if imgui.Selectable(tostring(i)..". "..v, selected == i) then
                                                changeSound(29, mp5Sounds[i])
                                            end
                                        end
                                    imgui.EndChild()

                                    imgui.SetCursorPos(imgui.ImVec2(180, 320))
                                    imgui.BeginTitleChild(u8"UZI", imgui.ImVec2(140, 142), 6, 10)
                                        for i, v in ipairs(uziSounds) do
                                            if selected ~= getNumberSounds(28, uziSounds) then
                                                selected = getNumberSounds(28, uziSounds)
                                            end
                                            if imgui.Selectable(tostring(i)..". "..v, selected == i) then
                                                changeSound(28, uziSounds[i])
                                            end
                                        end
                                    imgui.EndChild()

                                    imgui.SetCursorPos(imgui.ImVec2(345, 320))
                                    imgui.BeginTitleChild(u8"Pistol9mm", imgui.ImVec2(140, 142), 6, 10)
                                        for i, v in ipairs(Pistol9mmSounds) do
                                            if selected ~= getNumberSounds(22, Pistol9mmSounds) then
                                                selected = getNumberSounds(22, Pistol9mmSounds)
                                            end
                                            if imgui.Selectable(tostring(i)..". "..v, selected == i) then
                                                changeSound(22, Pistol9mmSounds[i])
                                            end
                                        end
                                    imgui.EndChild()

                                    imgui.SetCursorPos(imgui.ImVec2(510, 320))
                                    imgui.BeginTitleChild(u8"AK-47", imgui.ImVec2(140, 142), 6, 10)
                                        for i, v in ipairs(AKSounds) do
                                            if selected ~= getNumberSounds(30, AKSounds) then
                                                selected = getNumberSounds(30, AKSounds)
                                            end
                                            if imgui.Selectable(tostring(i)..". "..v, selected == i) then
                                                changeSound(30, AKSounds[i])
                                            end
                                        end
                                    imgui.EndChild()
                                    imgui.SetCursorPos(imgui.ImVec2(15, 515))
                                    imgui.BeginTitleChild(u8"���������", imgui.ImVec2(140, 142), 6, 10)
                                        for i, v in ipairs(hitSounds) do
                                            if selected ~= getNumberSounds("hit", hitSounds) then
                                                selected = getNumberSounds("hit", hitSounds)
                                            end
                                            if imgui.Selectable(tostring(i)..". "..v, selected == i) then
                                                changeSound("hit", hitSounds[i])
                                            end
                                        end
                                    imgui.EndChild()

                                    imgui.SetCursorPos(imgui.ImVec2(180, 515))
                                    imgui.BeginTitleChild(u8"����", imgui.ImVec2(140, 142), 6, 10)
                                        for i, v in ipairs(painSounds) do
                                            if selected ~= getNumberSounds("pain", painSounds) then
                                                selected = getNumberSounds("pain", painSounds)
                                            end
                                            if imgui.Selectable(tostring(i)..". "..v, selected == i) then
                                                changeSound("pain", painSounds[i])
                                            end
                                        end
                                    imgui.EndChild()
                                    imgui.SetCursorPos(imgui.ImVec2(345, 515))
                                    imgui.BeginTitleChild(u8"�����", imgui.ImVec2(140, 142), 6, 10)
                                        for i, v in ipairs(explSounds) do
                                            if selected ~= getNumberSounds("expl", explSounds) then
                                                selected = getNumberSounds("expl", explSounds)
                                            end
                                            if imgui.Selectable(tostring(i)..". "..v, selected == i) then
                                                changeSound("expl", explSounds[i])
                                            end
                                        end
                                    imgui.EndChild()

                                    imgui.PushItemWidth(280)
                                    imgui.SetCursorPos(imgui.ImVec2(15, 710))
                                    if imgui.SliderFloat(u8"##��������� ���������##1", sliders.weapon_volume_slider, 0.00, 1.00, u8"��������� ���������: %.2f") then
                                        ini.ugenrl_volume.weapon = ("%.2f"):format(sliders.weapon_volume_slider[0])
                                        save()
                                    end
                                    imgui.SetCursorPos(imgui.ImVec2(15, 750))
                                    if imgui.SliderFloat(u8"##��������� ���������##1", sliders.hit_volume_slider, 0.00, 1.00, u8"��������� ���������: %.2f") then
                                        ini.ugenrl_volume.hit = ("%.2f"):format(sliders.hit_volume_slider[0])
                                        save()
                                    end
                                    imgui.SetCursorPos(imgui.ImVec2(15, 790))
                                    if imgui.SliderFloat(u8"##��������� ����##1", sliders.pain_volume_slider, 0.00, 1.00, u8"��������� ����: %.2f") then
                                        ini.ugenrl_volume.pain = ("%.2f"):format(sliders.pain_volume_slider[0]) 
                                        save()
                                    end
                                    imgui.SetCursorPos(imgui.ImVec2(15, 830))
                                    if imgui.SliderInt(u8"##��������� ������", sliders.enemyweapon_dist, 0, 100, u8"��������� c���������: %d") then
                                        ini.ugenrl_main.enemyWeaponDist = sliders.enemyweapon_dist[0]
                                        save()
                                    end
                                    imgui.SetCursorPos(imgui.ImVec2(15, 870))
                                    if imgui.SliderFloat(u8"##��������� �������##1", sliders.expl_volume_slider, 0.00, 1.00, u8"��������� �������: %.2f") then
                                        ini.ugenrl_volume.expl = ("%.2f"):format(sliders.expl_volume_slider[0]) 
                                        save()
                                    end
                                    imgui.PopItemWidth()
                                else
                                    imgui.SetCursorPos(imgui.ImVec2(10, 130))
                                    imgui.BeginTitleChild(u8"���� ���������", imgui.ImVec2(140, 142), 6, 20)
                                        for i, v in ipairs(hitSounds) do
                                            if selected ~= getNumberSounds("hit", hitSounds) then
                                                selected = getNumberSounds("hit", hitSounds)
                                            end
                                            if imgui.Selectable(tostring(i)..". "..v, selected == i) then
                                                changeSound("hit", hitSounds[i])
                                            end
                                        end
                                    imgui.EndChild()
                                    imgui.PushItemWidth(220)
                                    imgui.SetCursorPos(imgui.ImVec2(180, 130))
                                    if imgui.SliderFloat(u8"��������� ���������##1", sliders.hit_volume_slider, 0.00, 1.00, "%.2f") then
                                        ini.ugenrl_volume.hit = ("%.2f"):format(sliders.hit_volume_slider[0])
                                        save()
                                    end
                                end
                            end
                            if ini.ugenrl_main.enable then
                                if ini.ugenrl_main.mode == 2 then
                                    imgui.SetCursorPosY(300)
                                else
                                imgui.SetCursorPos(imgui.ImVec2(320, 700))
                                end
                            end
                        end
                        if navigations.current_sounds == 2 then
                            imgui.SetCursorPos(imgui.ImVec2(10, 40))
                            imgui.BeginGroup()
                            if imgui.Checkbox(u8"����� � ����������", checkboxes.noradio) then
                                ini.settings.noradio = checkboxes.noradio[0]
                                save()
                                gotofunc("NoRadio")
                            end
                            if not ini.ugenrl_main.enable and imgui.Checkbox(u8"����� ����", checkboxes.sounds) then
                                ini.settings.sounds = checkboxes.sounds[0]
                                if ini.ugenrl_main.enable then ini.settings.sounds = false checkboxes.sounds[0] = ini.settings.sounds end
                                save()
                                gotofunc("NoSounds")
                            end
                            if imgui.Checkbox(u8"������ � ����������", checkboxes.intmusic) then
                                ini.settings.intmusic = checkboxes.intmusic[0]
                                save()
                                gotofunc("InteriorMusic")
                            end
                            if imgui.Checkbox(u8"����������", checkboxes.audiostream) then
                                ini.settings.audiostream = checkboxes.audiostream[0]
                                save()
                                gotofunc("AudioStream")
                            end
                            imgui.EndGroup()
                        end
                    imgui.EndChild()
                    elseif navigations.activeTab.home[0] == 6 then
                        imgui.SetCursorPos(imgui.ImVec2(imgui.GetWindowSize().x / 90, imgui.GetCursorPosY() + 16))
                        imgui.PushFont(fonts[50])
                        imgui.TextColored(imgui.ImVec4(ini.BeginColor.r, ini.BeginColor.g, ini.BeginColor.b, ini.BeginColor.a), u8"INTERFACE")
                        imgui.PopFont()
                        for i, title in ipairs(navigations.interface_elemets) do
                            if HeaderButton(navigations.current_elemets == i, title) then
                                navigations.current_elemets = i
                            end
                            if i ~= #navigations.interface_elemets then
                                imgui.SameLine(nil, 30)
                            end
                        end
                        imgui.SetCursorPos(imgui.ImVec2(imgui.GetCursorPosX() - 1, imgui.GetCursorPosY() + 5 ))
                            if navigations.current_elemets == 1 then
                                imgui.PushStyleColor(imgui.Col.Border, ini.borderchild.draw and imgui.GetStyle().Colors[imgui.Col.PlotHistogram] or imgui.ImVec4(0,0,0,0)) -- ����
                                imgui.BeginChild("##leftmenugg", imgui.ImVec2(160, imgui.GetWindowSize().y - 118), true)
                                    imgui.SetCursorPosX(imgui.GetCursorPosX() - 15)
                                    imgui.CustomSelectable(navigations.gameinterface, navigations.activeTab.gameinterface, imgui.ImVec2(180, 30))
                                imgui.EndChild()
                                imgui.SameLine()
                                imgui.SetCursorPosX(imgui.GetCursorPosX() - 7)
                                imgui.PushStyleColor(imgui.Col.Border, ini.borderchild.draw and imgui.GetStyle().Colors[imgui.Col.PlotHistogram] or imgui.ImVec4(0,0,0,0)) -- ����
                                imgui.BeginChild("##rightmenugg", imgui.ImVec2(imgui.GetWindowSize().x - 204, imgui.GetWindowSize().y - 118), true)
                                imgui.PopStyleColor(2)
                                    if navigations.activeTab.gameinterface[0] == 1 then
                                    

                                        if imgui.Checkbox(u8"�������� �������� ��������", checkboxes.EditPatrons) then
                                           
                                            preset["Patrons"]["EditPatrons"] = checkboxes.EditPatrons[0]
                                            saveJson("preset")
                                            gotofunc("InterfaceElementEditor")
                                        end
        
                                        if preset["Patrons"]["EditPatrons"] then
                                            
                                            imgui.PushItemWidth(165)
                                            if imgui.Combo(u8"����� ������ ��������", fontammostylevar, fontstylechar, #fontstyletext) then
                                                preset["Patrons"]["fontammostyle"] = fontammostylevar[0]
                                                saveJson("preset")
                                                gotofunc("InterfaceElementEditor")
                                            end
                                            imgui.PopItemWidth()
                                            if imgui.Checkbox(u8"�������� ������� ������� ������", checkboxes.renderammo) then
                                                
                                                preset["Patrons"]["renderammo"] = checkboxes.renderammo[0]
                                                saveJson("preset")
                                                gotofunc("InterfaceElementEditor")
                                            end
                                            if imgui.Checkbox(u8"������ ������ (����� �����)", checkboxes.singleclip) then
                                                
                                                preset["Patrons"]["singleclip"] = checkboxes.singleclip[0]
                                                saveJson("preset")
                                                gotofunc("InterfaceElementEditor")
                                            end
                                            if imgui.Checkbox(u8"������ �������", checkboxes.EternalPatrons) then
                                                
                                                preset["Patrons"]["EternalPatrons"] = checkboxes.EternalPatrons[0]
                                                saveJson("preset")
                                                gotofunc("InterfaceElementEditor")
                                            end
                                            if imgui.DragFloat(u8"##������� �������� X", sliders.posPatronsX, 0.2, -955.0, 250.0, u8"������� �������� X: %.2f") then
                                                preset["Patrons"]["posPatronsX"] = ("%.2f"):format(sliders.posPatronsX[0])
                                                saveJson("preset")
                                                gotofunc("InterfaceElementEditor")
                                            end
                                            imgui.SameLine()
                                            if imgui.Button(u8'��������', imgui.ImVec2(70, 25)) then
                                                preset["Patrons"]["posPatronsX"] = 47.0
                                                sliders.posPatronsX[0] = preset["Patrons"]["posPatronsX"]
                                                saveJson("preset")
                                                gotofunc("InterfaceElementEditor")
                                            end
        
                                            if imgui.DragFloat(u8"##������� �������� Y", sliders.posPatronsY, 0.2, -20.0, 420.0, u8"������� �������� Y: %.2f") then
                                                preset["Patrons"]["posPatronsY"] = ("%.2f"):format(sliders.posPatronsY[0])
                                                saveJson("preset")
                                                gotofunc("InterfaceElementEditor")
                                            end
                                            imgui.SameLine()
                                            if imgui.Button(u8'��������##1', imgui.ImVec2(70, 25)) then
                                                preset["Patrons"]["posPatronsY"] = 43.0
                                                saveJson("preset")
                                                sliders.posPatronsY[0] = preset["Patrons"]["posPatronsY"]
                                                gotofunc("InterfaceElementEditor")
                                            end
                                            
                                            if imgui.DragFloat(u8"##������ �������� X", sliders.sizePatronsX, 0.001, 0.0, 3.0, u8"������ �������� X: %.2f") then
                                                preset["Patrons"]["sizePatronsX"] = ("%.2f"):format(sliders.sizePatronsX[0])
                                                saveJson("preset")
                                                gotofunc("InterfaceElementEditor")
                                            end
                                            imgui.SameLine()
                                            if imgui.Button(u8'��������##2', imgui.ImVec2(70, 25)) then
                                                preset["Patrons"]["sizePatronsX"] = 0.3
                                                saveJson("preset")
                                                sliders.sizePatronsX[0] = preset["Patrons"]["sizePatronsX"]
                                                gotofunc("InterfaceElementEditor")
                                            end
        
                                            if imgui.DragFloat(u8"##������ �������� Y", sliders.sizePatronsY, 0.001, 0.0, 3.0, u8"������ �������� Y: %.2f") then
                                                preset["Patrons"]["sizePatronsY"] = ("%.2f"):format(sliders.sizePatronsY[0])
                                                saveJson("preset")
                                                gotofunc("InterfaceElementEditor")
                                            end
                                            imgui.SameLine()
                                            if imgui.Button(u8'��������##3', imgui.ImVec2(70, 25)) then
                                                preset["Patrons"]["sizePatronsY"] = 0.7
                                                saveJson("preset")
                                                sliders.sizePatronsY[0] = preset["Patrons"]["sizePatronsY"]
                                                gotofunc("InterfaceElementEditor")
                                            end
        
                                            
        
                                        end
        
        
                                    
                                    elseif navigations.activeTab.gameinterface[0] == 2 then
                                    
                                    
                                        if imgui.Checkbox(u8"�������� �������� ��������", checkboxes.EditHealth) then
                                            
                                            preset["Health"]["EditHealth"] = checkboxes.EditHealth[0]
                                            saveJson("preset")
                                            gotofunc("InterfaceElementEditor")
                                        end
        
                                        if  preset["Health"]["EditHealth"] then
                                            if imgui.Checkbox(u8"��������� ������� ������� ��", checkboxes.nohealthflick) then
                                                
                                                preset["Health"]["nohealthflick"] = checkboxes.nohealthflick[0]
                                                saveJson("preset")
                                                gotofunc("InterfaceElementEditor")
                                            end
        
                                            if imgui.Checkbox(u8"���������� ������� ������� ��������", checkboxes.healthborder) then
                                                preset["Health"]["healthborder"] = checkboxes.healthborder[0]
                                                saveJson("preset")
                                                gotofunc("InterfaceElementEditor")
                                            end
        
                                            if imgui.DragFloat(u8"##������� �������� X", sliders.posHealthX, 0.2, -700.0, -110.0, u8"������� �������� X: %.2f") then
                                                preset["Health"]["posHealthX"] = ("%.2f"):format(sliders.posHealthX[0])
                                                saveJson("preset")
                                                gotofunc("InterfaceElementEditor")
                                            end
                                            imgui.SameLine()
                                            if imgui.Button(u8'��������##4', imgui.ImVec2(70, 25)) then
                                                
                                                preset["Health"]["posHealthX"] = -141.0
                                                saveJson("preset")
                                                sliders.posHealthX[0] = preset["Health"]["posHealthX"]
                                                gotofunc("InterfaceElementEditor")
                                            end
        
                                            if imgui.DragFloat(u8"##������� �������� Y", sliders.posHealthY, 0.2, 9.0, 500.0, u8"������� �������� Y: %.2f") then
                                                preset["Health"]["posHealthY"] = ("%.2f"):format(sliders.posHealthY[0])
                                                saveJson("preset")
                                                gotofunc("InterfaceElementEditor")
                                            end
                                            imgui.SameLine()
                                            if imgui.Button(u8'��������##5', imgui.ImVec2(70, 25)) then
                                                preset["Health"]["posHealthY"] = 77.0
                                                saveJson("preset")
                                                sliders.posHealthY[0] = preset["Health"]["posHealthY"]
                                                gotofunc("InterfaceElementEditor")
                                            end
        
                                            if imgui.DragFloat(u8"##������ �������� X", sliders.sizeHealthX, 0.1, 0.0, 350.0, u8"������ �������� X: %.2f") then
                                                preset["Health"]["sizeHealthX"] = ("%.2f"):format(sliders.sizeHealthX[0])
                                                saveJson("preset")
                                                gotofunc("InterfaceElementEditor")
                                            end
                                            imgui.SameLine()
                                            if imgui.Button(u8'��������##6', imgui.ImVec2(70, 25)) then
                                                preset["Health"]["sizeHealthX"] = 109.0
                                                saveJson("preset")
                                                sliders.sizeHealthX[0] = preset["Health"]["sizeHealthX"]
                                                gotofunc("InterfaceElementEditor")
                                            end
        
                                            if imgui.DragFloat(u8"##������ �������� Y", sliders.sizeHealthY, 0.1, 0.0, 50.0, u8"������ �������� Y: %.2f") then
                                                preset["Health"]["sizeHealthY"] = ("%.2f"):format(sliders.sizeHealthY[0])
                                                saveJson("preset")
                                                gotofunc("InterfaceElementEditor")
                                            end
                                            imgui.SameLine()
                                            if imgui.Button(u8'��������##7', imgui.ImVec2(70, 25)) then
                                                preset["Health"]["sizeHealthY"]  = 9.0
                                                saveJson("preset")
                                                sliders.sizeHealthY[0] = preset["Health"]["sizeHealthY"] 
                                                gotofunc("InterfaceElementEditor")
                                            end
                                            
        
                                        end
        
                                    elseif navigations.activeTab.gameinterface[0] == 3 then
                                        if imgui.Checkbox(u8"����������� ������� ����������� �����", checkboxes.moneyzerofix) then
                                            preset["Money"]["moneyzerofix"] = checkboxes.moneyzerofix[0]
                                            saveJson("preset")
                                            gotofunc("InterfaceElementEditor")
                                        end
                                        imgui.Text(u8"�������� ��������� ���������� �����:")
                                        imgui.SameLine()
                                        imgui.PushItemWidth(150)
                                        if imgui.Combo(u8"##�������� ��������� ���������� �����", ivar, tmtext, #tbmtext) then
                                            preset["Money"]["animmoney"] = ivar[0]
                                            saveJson("preset")
                                            gotofunc("InterfaceElementEditor")
                                        end
                                        imgui.Hint(u8"������ �������� ����������� / ��������� ����� � ����", 0.3)
                                        if imgui.Combo(u8"������� ������� ������ �����", fontmoneybordervar, fontmoneyborderchar, #fontmoneybordertext) then
                                            preset["Money"]["fontmoneyborder"] = fontmoneybordervar[0]
                                            saveJson("preset")
                                            gotofunc("InterfaceElementEditor")
                                        end
                                        if imgui.Combo(u8"����� ������ �����", fontmoneystylevar, fontstylechar, #fontstyletext) then
                                            preset["Money"]["fontmoneystyle"] = fontmoneystylevar[0]
                                            saveJson("preset")
                                            gotofunc("InterfaceElementEditor")
                                        end
                                        imgui.PopItemWidth()
        
                                        if imgui.Checkbox(u8"�������� �������� �����", checkboxes.EditMoney) then
                                            preset["Money"]["EditMoney"] = checkboxes.EditMoney[0]
                                            saveJson("preset")
                                            gotofunc("InterfaceElementEditor")
                                        end
        
                                        if preset["Money"]["EditMoney"] then
                                            
                                            if imgui.DragFloat(u8"##������� ����� X", sliders.posMoneyX, 0.2, -610.0, 1.0,  u8"������� ����� X: %.2f") then
                                                preset["Money"]["posMoneyX"] = ("%.1f"):format(sliders.posMoneyX[0])
                                                saveJson("preset")
                                                gotofunc("InterfaceElementEditor")
                                            end
                                            imgui.SameLine()
                                            if imgui.Button(u8'��������##8', imgui.ImVec2(70, 25)) then
                                                preset["Money"]["posMoneyX"] = -32.0
                                                saveJson("preset")
                                                sliders.posMoneyX[0] = preset["Money"]["posMoneyX"]
                                                gotofunc("InterfaceElementEditor")
                                            end
        
                                            if imgui.DragFloat(u8"##������� ����� Y", sliders.posMoneyY, 0.2, 12.0, 440.0, u8"������� ����� Y: %.2f") then
                                                preset["Money"]["posMoneyY"] = ("%.2f"):format(sliders.posMoneyY[0])
                                                saveJson("preset")
                                                gotofunc("InterfaceElementEditor")
                                            end
                                            imgui.SameLine()
                                            if imgui.Button(u8'��������##9', imgui.ImVec2(70, 25)) then
                                                preset["Money"]["posMoneyY"] = 89.0
                                                saveJson("preset")
                                                sliders.posMoneyY[0] = preset["Money"]["posMoneyY"]
                                                gotofunc("InterfaceElementEditor")
                                            end
        
                                            if imgui.DragFloat(u8"##������ ����� X", sliders.sizeMoneyX, 0.01, 0.0, 3.0, u8"������ ����� X: %.2f") then
                                                preset["Money"]["sizeMoneyX"] = ("%.2f"):format(sliders.sizeMoneyX[0])
                                                saveJson("preset")
                                                gotofunc("InterfaceElementEditor")
                                            end
                                            imgui.SameLine()
                                            if imgui.Button(u8'��������##101', imgui.ImVec2(70, 25)) then
                                                preset["Money"]["sizeMoneyX"] = 0.55
                                                saveJson("preset")
                                                sliders.sizeMoneyX[0] = preset["Money"]["sizeMoneyX"]
                                                gotofunc("InterfaceElementEditor")
                                            end
        
                                            if imgui.DragFloat(u8"##������ ����� Y", sliders.sizeMoneyY, 0.01, 0.0, 3.0, u8"������ ����� Y: %.2f") then
                                                preset["Money"]["sizeMoneyY"] = ("%.2f"):format(sliders.sizeMoneyY[0])
                                                saveJson("preset")
                                                gotofunc("InterfaceElementEditor")
                                            end
                                            imgui.SameLine()
                                            if imgui.Button(u8'��������##11', imgui.ImVec2(70, 25)) then
                                                preset["Money"]["sizeMoneyY"] = 1.1
                                                saveJson("preset")
                                                sliders.sizeMoneyY[0] = preset["Money"]["sizeMoneyY"]
                                                gotofunc("InterfaceElementEditor")
                                            end
        
                                        end
        
        
                                    elseif navigations.activeTab.gameinterface[0] == 4 then
                                        if imgui.Checkbox(u8"�������� ������", checkboxes.radarfix) then
                                            preset["Radar"]["radarfix"] = checkboxes.radarfix[0]
                                            saveJson("preset")
                                            gotofunc("InterfaceElementEditor")
                                        end
                                        if preset["Radar"]["radarfix"] then
                                            if imgui.SliderFloat(u8"##������������ ���������", sliders.radaralpha, 0.0, 255.0, u8"������������ ���������: %0.2f") then
                                                preset["Radar"]["radaralpha"] = ("%.2f"):format(sliders.radaralpha[0])
                                                saveJson("preset")
                                                gotofunc("InterfaceElementEditor")
                                            end
        
                                            if imgui.Checkbox(u8"������� �����", checkboxes.roundedRadar) then
                                                preset["Radar"]["roundedRadar"] = checkboxes.roundedRadar[0]
                                                saveJson("preset")
                                                gotofunc("InterfaceElementEditor")
                                            end

                                            if imgui.Checkbox(u8"������� ������� ������", checkboxes.radar_color_fix) then
                                                preset["Radar"]["radar_color_fix"] = checkboxes.radar_color_fix[0]
                                                saveJson("preset")
                                                gotofunc("InterfaceElementEditor")
                                            end

                                            imgui.PushItemWidth(430)
                                                if preset["Radar"]["roundedRadar"] then
                                                    if imgui.SliderFloat(u8"##������ ������", sliders.roundedRadarSize, 0.50, 2.50, u8"������ ������: %0.2f") then
                                                        preset["Radar"]["roundedRadarSize"] = ("%.2f"):format(sliders.roundedRadarSize[0])
                                                        saveJson("preset")
                                                        gotofunc("InterfaceElementEditor")
                                                    end
                                                end
                                                
                                                
                                                if not preset["Radar"]["roundedRadar"] then
                                                    if imgui.DragFloat(u8"##������ ������", sliders.radarw, 0.2, 50.00, 100.00, u8"������ ������: %0.2f") then
                                                        preset["Radar"]["radarWidth"] = ("%.2f"):format(sliders.radarw[0])
                                                        saveJson("preset")
                                                        gotofunc("InterfaceElementEditor")
                                                    end
                                                    imgui.SameLine()
                                                    if imgui.Button(u8'��������##r1', imgui.ImVec2(70, 25)) then
                                                        preset["Radar"]["radarWidth"] = 76.0
                                                        saveJson("preset")
                                                        sliders.radarw[0] = preset["Radar"]["radarWidth"]
                                                        gotofunc("InterfaceElementEditor")
                                                    end
                                                    
                                                    if imgui.DragFloat(u8"##������ ������", sliders.radarh, 0.2, 50.00, 100.00, u8"������ ������: %0.2f") then
                                                        preset["Radar"]["radarHeight"] = ("%.2f"):format(sliders.radarh[0])
                                                        saveJson("preset")
                                                        gotofunc("InterfaceElementEditor")
                                                    end
                                                    imgui.SameLine()
                                                    if imgui.Button(u8'��������##r2', imgui.ImVec2(70, 25)) then
                                                        preset["Radar"]["radarHeight"] = 94.0
                                                        saveJson("preset")
                                                        sliders.radarh[0] = preset["Radar"]["radarHeight"]
                                                        gotofunc("InterfaceElementEditor")
                                                    end
                                                    
                                                end
                                                if imgui.DragFloat(u8"##��������� ������ �� X", sliders.radarposx, 0.2, 0.00, 600.00, u8"��������� ������ �� X: %0.2f") then
                                                    preset["Radar"]["radarPosX"] = ("%.2f"):format(sliders.radarposx[0])
                                                    saveJson("preset")
                                                    gotofunc("InterfaceElementEditor")
                                                end
                                                imgui.SameLine()
                                                if imgui.Button(u8'��������##r3', imgui.ImVec2(70, 25)) then
                                                    preset["Radar"]["radarPosX"] = 40.0
                                                    saveJson("preset")
                                                    sliders.radarposx[0] = preset["Radar"]["radarPosX"]
                                                    gotofunc("InterfaceElementEditor")
                                                end
                                                if imgui.DragFloat(u8"##��������� ������ �� Y", sliders.radarposy, 0.2, 80.00, 555.00, u8"��������� ������ �� Y: %0.2f") then
                                                    preset["Radar"]["radarPosY"] = ("%.2f"):format(sliders.radarposy[0])
                                                    saveJson("preset")
                                                    gotofunc("InterfaceElementEditor")
                                                end
                                                imgui.SameLine()
                                                if imgui.Button(u8'��������##r4', imgui.ImVec2(70, 25)) then
                                                    preset["Radar"]["radarPosY"] = 104.0
                                                    saveJson("preset")
                                                    sliders.radarposy[0] = preset["Radar"]["radarPosY"]
                                                    gotofunc("InterfaceElementEditor")
                                                end
                                            imgui.PopItemWidth()
                                        end
                                        
                                        if imgui.Checkbox(u8"��������� ������ ������", checkboxes.radrarnorth) then
                                            preset["Radar"]["radrarnorth"] = checkboxes.radrarnorth[0]
                                            saveJson("preset")
                                            gotofunc("InterfaceElementEditor")
                                        end
                                        if imgui.Checkbox(u8"����������� ������ �� ������", checkboxes.smalliconsradar) then
                                            preset["Radar"]["smalliconsradar"] = checkboxes.smalliconsradar[0]
                                            saveJson("preset")
                                            gotofunc("InterfaceElementEditor")
                                        end
                                
                                        if preset["Radar"]["smalliconsradar"] then
                                            imgui.PushItemWidth(425)
                                            if imgui.SliderFloat(u8"##���������� ������", sliders.quadro_icon_size, 0.5, 3.0, u8"���������� ������: %0.2f") then
                                                preset["Radar"]["quadro_icon_size"] = sliders.quadro_icon_size[0]
                                                saveJson("preset")
                                                gotofunc("InterfaceElementEditor")
                                            end
                                            if imgui.SliderFloat(u8"##���������� ������ �������", sliders.quadro_icon_border, 0.5, 3.0, u8"���������� ������ �������: %0.2f") then
                                                preset["Radar"]["quadro_icon_border"] = sliders.quadro_icon_border[0]
                                                saveJson("preset")
                                                gotofunc("InterfaceElementEditor")
                                            end
                                            if imgui.SliderFloat(u8"##����������� ������ �����", sliders.trianglev_icon_size, 0.5, 3.0, u8"�����. ������ �����: %0.2f") then
                                                preset["Radar"]["trianglev_icon_size"] = sliders.trianglev_icon_size[0]
                                                saveJson("preset")
                                                gotofunc("InterfaceElementEditor")
                                            end
                                            if imgui.SliderFloat(u8"##����������� ������ ����� �������", sliders.trianglev_icon_border, 0.5, 3.0, u8"�����. ������ ����� �������: %0.2f") then
                                                preset["Radar"]["trianglev_icon_border"] = sliders.trianglev_icon_border[0]
                                                saveJson("preset")
                                                gotofunc("InterfaceElementEditor")
                                            end
                                            if imgui.SliderFloat(u8"##����������� ������ ����", sliders.trianglen_icon_size, 0.5, 3.0, u8"�����. ������ ����: %0.2f") then
                                                preset["Radar"]["trianglen_icon_size"] = sliders.trianglen_icon_size[0]
                                                saveJson("preset")
                                                gotofunc("InterfaceElementEditor")
                                            end
                                            if imgui.SliderFloat(u8"##����������� ������ ���� �������", sliders.trianglen_icon_border, 0.5, 3.0, u8"�����. ������ ���� �������: %0.2f") then
                                                preset["Radar"]["trianglen_icon_border"] = sliders.trianglen_icon_border[0]
                                                saveJson("preset")
                                                gotofunc("InterfaceElementEditor")
                                            end
                                            if imgui.SliderFloat(u8"##������ ������", sliders.player_icon_size, 3.0, 10.0, u8"������ ������: %0.2f") then
                                                preset["Radar"]["player_icon_size"] = sliders.player_icon_size[0]
                                                saveJson("preset")
                                                gotofunc("InterfaceElementEditor")
                                            end
                                            if imgui.SliderFloat(u8"##������ ������ �� ����� � ����", sliders.arrowmap_size, 0.0, 30.0, u8"������ ������ �� ����� � ����: %0.2f") then
                                                preset["Radar"]["arrowmap_size"] = sliders.arrowmap_size[0]
                                                saveJson("preset")
                                                gotofunc("InterfaceElementEditor")
                                            end
                                            if imgui.SliderFloat(u8"##�������� ������", sliders.osnov_icon, 3.0, 10.0, u8"�������� ������: %0.2f") then
                                                preset["Radar"]["osnov_icon"] = sliders.osnov_icon[0]
                                                saveJson("preset")
                                                gotofunc("InterfaceElementEditor")
                                            end
                                            imgui.PopItemWidth()
                                        end
                                    elseif navigations.activeTab.gameinterface[0] == 5 then
                                        if imgui.Checkbox(u8"��������� ������ arrow � ����", checkboxes.arrowicon_menu) then
                                            preset["MenuPause"]["arrowicon_menu"] = checkboxes.arrowicon_menu[0]
                                            saveJson("preset")
                                            gotofunc("InterfaceElementEditor")
                                        end
                                        if imgui.Checkbox(u8"�������� ������ ����������� � ����", checkboxes.fullmenuimage) then
                                            preset["MenuPause"]["fullmenuimage"] = checkboxes.fullmenuimage[0]
                                            saveJson("preset")
                                            gotofunc("MenuImage")
                                        end
                                        imgui.PushItemWidth(60)
                                        if imgui.InputFloat(u8"������", buffers.fullmenuwidth, 0, 10000, "%0.1f") then
                                            preset["MenuPause"]["fullmenuwidth"] = buffers.fullmenuwidth[0]
                                            saveJson("preset")
                                            gotofunc("MenuImage")
                                        end
                                        imgui.SameLine()
                                        if imgui.InputFloat(u8"������", buffers.fullmenuheight, 0, 10000, "%0.1f") then
                                            preset["MenuPause"]["fullmenuheight"] = buffers.fullmenuheight[0]
                                            saveJson("preset")
                                            gotofunc("MenuImage")
                                        end
                                        imgui.PopItemWidth()
                                        if imgui.Checkbox(u8"�������������� ��������������� �����", checkboxes.mapzoom) then
                                            preset["MenuPause"]["mapzoom"] = checkboxes.mapzoom[0]
                                            saveJson("preset")
                                            gotofunc("InterfaceElementEditor")
                                        end
                                        imgui.Hint(u8"�������� / ��������� �������������� ��������� ����� � ���� ESC", 0.3)
                                        imgui.Text(u8"������� ��������� ����� [�� 300.00 �� 1000.00]")
                                        if imgui.DragFloat(u8"##mapzoomvalue", sliders.mapzoomvalue, 0.2, 300.00, 1000.00, "%.2f") then
                                            if preset["MenuPause"]["mapzoom"] then
                                                preset["MenuPause"]["mapzoomvalue"] = ("%.2f"):format(sliders.mapzoomvalue[0])
                                                saveJson("preset")
                                                memory.setfloat(5719357, preset["MenuPause"]["mapzoomvalue"], true)
                                            else
                                                memory.setfloat(5719357, 1000.00, true)
                                            end
                                        end
                                        if imgui.Checkbox(u8"��������� ��������� � ���� (ESC)", checkboxes.helptext) then
                                            preset["MenuPause"]["helptext"] = checkboxes.helptext[0]
                                            saveJson("preset")
                                            gotofunc("HelpText")
                                        end
                                        if imgui.Checkbox(u8"��������� ��������� � ���� (ESC)", checkboxes.beginmenu) then
                                            preset["MenuPause"]["beginmenu"] = checkboxes.beginmenu[0]
                                            saveJson("preset")
                                            gotofunc("BeginMenu")
                                        end
        
                                        if imgui.SliderFloat(u8"##speedinputsmap", sliders.speedinputsmap, 7.00, 50.00, u8"�������� ����������� � �����: %.2f") then
                                            preset["MenuPause"]["speedinputsmap"] = ("%.2f"):format(sliders.speedinputsmap[0])
                                            saveJson("preset")
                                            gotofunc("InterfaceElementEditor")
                                        end
        
                                        imgui.PushItemWidth(165)
                                        if imgui.Combo(u8"����� ��������� ������ ����", fontmenubasestylevar, fontstylechar, #fontstyletext) then
                                            preset["MenuPause"]["fontmenubasestyle"] = fontmenubasestylevar[0]
                                            saveJson("preset")
                                            gotofunc("InterfaceElementEditor")
                                        end
                                        if imgui.Combo(u8"����� ������ ���������� ����", fontmenuheaderstylevar, fontstylechar, #fontstyletext) then
                                            preset["MenuPause"]["fontmenuheaderstyle"] = fontmenuheaderstylevar[0]
                                            saveJson("preset")
                                            gotofunc("InterfaceElementEditor")
                                        end
                                        if imgui.Combo(u8"����� ������ ON - OFF (��������) ����", fontmenutumblerstylevar, fontstylechar, #fontstyletext) then
                                            preset["MenuPause"]["fontmenutumblerstyle"] = fontmenutumblerstylevar[0]
                                            saveJson("preset")
                                            gotofunc("InterfaceElementEditor")
                                        end
                                        imgui.PopItemWidth()
                                        
                                    elseif navigations.activeTab.gameinterface[0] == 6 then
                                        
                                        if imgui.SliderFloat(u8"##sizecr", sliders.crosshairSize, 0.0, 3.0, u8"������ �������: %.3f") then
                                            preset["Crosshair"]["crosshairSize"] = ("%.3f"):format(sliders.crosshairSize[0])
                                            saveJson("preset")
                                            gotofunc("EditCrosshair")
                                        end
                                        
                                        if imgui.Checkbox(u8"��������� ��������� ������� ������� ��� ��������", checkboxes.nocrosshaireditsize) then
                                            preset["Crosshair"]["nocrosshaireditsize"] = checkboxes.nocrosshaireditsize[0]
                                            saveJson("preset")
                                            gotofunc("EditCrosshair")
                                        end
                                        imgui.Hint(u8"�� ������ �� ������� ����, ����������� ������ ����� ������� �������.")
                                        imgui.PopItemWidth()
                                    elseif navigations.activeTab.gameinterface[0] == 7 then
                                        if imgui.Checkbox(u8"�������� �������� ���������", checkboxes.EditBreath) then
                                            preset["Breath"]["EditBreath"] = checkboxes.EditBreath[0]
                                            saveJson("preset")
                                            gotofunc("InterfaceElementEditor")
                                        end
        
                                        if preset["Breath"]["EditBreath"] then
                                            if imgui.Checkbox(u8"�������� ������ ��������", checkboxes.eternalBreath) then
                                                preset["Breath"]["eternalBreath"] = checkboxes.eternalBreath[0]
                                                saveJson("preset")
                                                gotofunc("InterfaceElementEditor")
                                            end
                                            if imgui.Checkbox(u8"���������� ������� ������� ���������", checkboxes.breathborder) then
                                                preset["Breath"]["breathborder"] = checkboxes.breathborder[0]
                                                saveJson("preset")
                                                gotofunc("InterfaceElementEditor")
                                            end
        
                                            if imgui.DragFloat(u8"##������� ��������� X", sliders.posBreathX, 0.2, -660.0, -40.0, u8"������� ��������� X: %.2f") then
                                                preset["Breath"]["posBreathX"] = ("%.2f"):format(sliders.posBreathX[0])
                                                saveJson("preset")
                                                gotofunc("InterfaceElementEditor")
                                            end
                                            imgui.SameLine()
                                            if imgui.Button(u8'��������##9', imgui.ImVec2(70, 25)) then
                                                preset["Breath"]["posBreathX"] = -94.0
                                                saveJson("preset")
                                                sliders.posBreathX[0] = preset["Breath"]["posBreathX"]
                                                gotofunc("InterfaceElementEditor")
                                            end
        
                                            if imgui.DragFloat(u8"##������� ��������� Y", sliders.posBreathY, 0.2, 0.0, 445.0, u8"������� ��������� Y: %.2f") then
                                                preset["Breath"]["posBreathY"] = ("%.2f"):format(sliders.posBreathY[0])
                                                saveJson("preset")
                                                gotofunc("InterfaceElementEditor")
                                            end
                                            imgui.SameLine()
                                            if imgui.Button(u8'��������##10', imgui.ImVec2(70, 25)) then
                                                preset["Breath"]["posBreathY"] = 62.0
                                                saveJson("preset")
                                                sliders.posBreathY[0] = preset["Breath"]["posBreathY"]
                                                gotofunc("InterfaceElementEditor")
                                            end
        
                                            if imgui.DragFloat(u8"##������ ��������� X", sliders.sizeBreathX, 0.1, 0.01, 150.0, u8"������ ��������� X: %.2f") then
                                                preset["Breath"]["sizeBreathX"] = ("%.2f"):format(sliders.sizeBreathX[0])
                                                saveJson("preset")
                                                gotofunc("InterfaceElementEditor")
                                            end
                                            imgui.SameLine()
                                            if imgui.Button(u8'��������##11', imgui.ImVec2(70, 25)) then
                                                preset["Breath"]["sizeBreathX"] = 62.0
                                                saveJson("preset")
                                                sliders.sizeBreathX[0] = preset["Breath"]["sizeBreathX"]
                                                gotofunc("InterfaceElementEditor")
                                            end
        
                                        
                                            if imgui.DragFloat(u8"##������ ��������� Y", sliders.sizeBreathY, 0.1, 0.01, 50.0, u8"������ ��������� Y: %.2f") then
                                                preset["Breath"]["sizeBreathY"] = ("%.2f"):format(sliders.sizeBreathY[0])
                                                saveJson("preset")
                                                gotofunc("InterfaceElementEditor")
                                            end
                                            imgui.SameLine()
                                            if imgui.Button(u8'��������##12', imgui.ImVec2(70, 25)) then
                                                preset["Breath"]["sizeBreathY"] = 9.0
                                                saveJson("preset")
                                                sliders.sizeBreathY[0] = preset["Breath"]["sizeBreathY"]
                                                gotofunc("InterfaceElementEditor")
                                            end
        
                                            
        
                                        end
                                    
                                    elseif navigations.activeTab.gameinterface[0] == 8 then
                                        if imgui.Checkbox(u8"�������� �������� �����", checkboxes.EditArmor) then
                                            preset["Armor"]["EditArmor"] = checkboxes.EditArmor[0]
                                            saveJson("preset")
                                            gotofunc("InterfaceElementEditor")
                                        end
        
                                        if preset["Armor"]["EditArmor"] then
                                            if imgui.Checkbox(u8"�������� ������ �����", checkboxes.eternalArmor) then
                                                preset["Armor"]["eternalArmor"] = checkboxes.eternalArmor[0]
                                                saveJson("preset")
                                                gotofunc("InterfaceElementEditor")
                                            end
                                            if imgui.Checkbox(u8"���������� ������� ������� �����", checkboxes.armorborder) then
                                                preset["Armor"]["armorborder"] = checkboxes.armorborder[0]
                                                saveJson("preset")
                                                gotofunc("InterfaceElementEditor")
                                            end
        
                                            if imgui.DragFloat(u8"##������� ����� X", sliders.posArmorX, 0.2, -660.0, -1.0, u8"������� ����� X: %.2f") then
                                                preset["Armor"]["posArmorX"] = ("%.2f"):format(sliders.posArmorX[0])
                                                saveJson("preset")
                                                gotofunc("InterfaceElementEditor")
                                            end
                                            imgui.SameLine()
                                            if imgui.Button(u8'��������##13', imgui.ImVec2(70, 25)) then
                                                preset["Armor"]["posArmorX"] = -94.0
                                                saveJson("preset")
                                                sliders.posArmorX[0] = preset["Armor"]["posArmorX"]
                                                gotofunc("InterfaceElementEditor")
                                            end
        
                                            if imgui.DragFloat(u8"##������� ����� Y", sliders.posArmorY, 0.2, 0.0, 445.0, u8"������� ����� Y: %.2f") then
                                                preset["Armor"]["posArmorY"] = ("%.2f"):format(sliders.posArmorY[0])
                                                saveJson("preset")
                                                gotofunc("InterfaceElementEditor")
                                            end
                                            imgui.SameLine()
                                            if imgui.Button(u8'��������##14', imgui.ImVec2(70, 25)) then
                                                preset["Armor"]["posArmorY"] = 48.0
                                                saveJson("preset")
                                                sliders.posArmorY[0] = preset["Armor"]["posArmorY"]
                                                gotofunc("InterfaceElementEditor")
                                            end
        
                                            if imgui.DragFloat(u8"##������ ����� X", sliders.sizeArmorX, 0.1, 0.01, 150.0, u8"������ ����� X: %.2f") then
                                                preset["Armor"]["sizeArmorX"] = ("%.2f"):format(sliders.sizeArmorX[0])
                                                saveJson("preset")
                                                gotofunc("InterfaceElementEditor")
                                            end
                                            imgui.SameLine()
                        
                                            if imgui.Button(u8'��������##15', imgui.ImVec2(70, 25)) then
                                                preset["Armor"]["sizeArmorX"] = 62.0
                                                saveJson("preset")
                                                sliders.sizeArmorX[0] = preset["Armor"]["sizeArmorX"]
                                                gotofunc("InterfaceElementEditor")
                                            end
        
                                        
                                            if imgui.DragFloat(u8"##������ ����� Y", sliders.sizeArmorY, 0.1, 0.01, 50.0, u8"������ ����� Y: %.2f") then
                                                preset["Armor"]["sizeArmorY"] = ("%.2f"):format(sliders.sizeArmorY[0])
                                                saveJson("preset")
                                                gotofunc("InterfaceElementEditor")
                                            end
                                            imgui.SameLine()
                                            if imgui.Button(u8'��������##16', imgui.ImVec2(70, 25)) then
                                                preset["Armor"]["sizeArmorY"] = 9.0
                                                saveJson("preset")
                                                sliders.sizeArmorY[0] = preset["Armor"]["sizeArmorY"]
                                                gotofunc("InterfaceElementEditor")
                                            end
        
                                           
                                        end
        
                                    elseif navigations.activeTab.gameinterface[0] == 9 then
                                        if imgui.Checkbox(u8"�������� �������� ������", checkboxes.EditWeapon) then
                                            preset["Weapon"]["EditWeapon"] = checkboxes.EditWeapon[0]
                                            saveJson("preset")
                                            gotofunc("InterfaceElementEditor")
                                        end
                                        if preset["Weapon"]["EditWeapon"] then
                                            if imgui.DragFloat(u8"##������� ������ X", sliders.posWeaponX, 0.2, -530.0, 70.0, u8"������� ������ X: %.2f") then
                                                preset["Weapon"]["posWeaponX"] = ("%.2f"):format(sliders.posWeaponX[0])
                                                saveJson("preset")
                                                gotofunc("InterfaceElementEditor")
                                            end
                                            imgui.SameLine()
                                            if imgui.Button(u8'��������##17', imgui.ImVec2(70, 25)) then
                                                preset["Weapon"]["posWeaponX"] = -32.0
                                                saveJson("preset")
                                                sliders.posWeaponX[0] = preset["Weapon"]["posWeaponX"]
                                                gotofunc("InterfaceElementEditor")
                                            end
        
                                            if imgui.DragFloat(u8"##������� ������ Y", sliders.posWeaponY, 0.2, 0.0, 400.0, u8"������� ������ Y: %.2f") then
                                                preset["Weapon"]["posWeaponY"] = ("%.2f"):format(sliders.posWeaponY[0])
                                                saveJson("preset")
                                                gotofunc("InterfaceElementEditor")
                                            end
                                            imgui.SameLine()
                                            if imgui.Button(u8'��������##18', imgui.ImVec2(70, 25)) then
                                                preset["Weapon"]["posWeaponY"] = 20.0
                                                saveJson("preset")
                                                sliders.posWeaponY[0] = preset["Weapon"]["posWeaponY"]
                                                gotofunc("InterfaceElementEditor")
                                            end
        
                                            if imgui.DragFloat(u8"##������ ������ X", sliders.sizeWeaponX, 0.1, 0.01, 400.0, u8"������ ������ X: %.2f") then
                                                preset["Weapon"]["sizeWeaponX"] = ("%.2f"):format(sliders.sizeWeaponX[0])
                                                saveJson("preset")
                                                gotofunc("InterfaceElementEditor")
                                            end
                                            imgui.SameLine()
                                            if imgui.Button(u8'��������##19', imgui.ImVec2(70, 25)) then
                                                preset["Weapon"]["sizeWeaponX"] = 47.0
                                                saveJson("preset")
                                                sliders.sizeWeaponX[0] = preset["Weapon"]["sizeWeaponX"]
                                                gotofunc("InterfaceElementEditor")
                                            end
        
                                            if imgui.DragFloat(u8"##������ ������ Y", sliders.sizeWeaponY, 0.1, 0.01, 400.0, u8"������ ������ Y: %.2f") then
                                                preset["Weapon"]["sizeWeaponY"] = ("%.2f"):format(sliders.sizeWeaponY[0])
                                                saveJson("preset")
                                                gotofunc("InterfaceElementEditor")
                                            end
                                            imgui.SameLine()
                                            if imgui.Button(u8'��������##20', imgui.ImVec2(70, 25)) then
                                                preset["Weapon"]["sizeWeaponY"] = 58.0
                                                saveJson("preset")
                                                sliders.sizeWeaponY[0] = preset["Weapon"]["sizeWeaponY"]
                                                gotofunc("InterfaceElementEditor")
                                            end
                                        end
                                    elseif navigations.activeTab.gameinterface[0] == 10 then
                                        if imgui.Checkbox(u8"�������� �������� �������", checkboxes.EditWanted) then
                                            preset["Wanted"]["EditWanted"] = checkboxes.EditWanted[0]
                                            saveJson("preset")
                                            gotofunc("InterfaceElementEditor")
                                        end
                                        if preset["Wanted"]["EditWanted"] then
                                            if imgui.Checkbox(u8"�������� ������ ������", checkboxes.eternalwanted) then
                                                preset["Wanted"]["eternalwanted"] = checkboxes.eternalwanted[0]
                                                saveJson("preset")
                                                gotofunc("InterfaceElementEditor")
                                            end
                                            if imgui.DragFloat(u8"##��������", sliders.spaceWanted, 0.1, -50.0, 50.0, u8"��������: %.2f") then
                                                preset["Wanted"]["spaceWanted"] = ("%.2f"):format(sliders.spaceWanted[0])
                                                saveJson("preset")
                                                gotofunc("InterfaceElementEditor")
                                            end
                                            imgui.SameLine()
                                            if imgui.Button(u8'��������##��������', imgui.ImVec2(70, 25)) then
                                                preset["Wanted"]["spaceWanted"] = 18.0
                                                saveJson("preset")
                                                sliders.spaceWanted[0] = preset["Wanted"]["spaceWanted"]
                                                gotofunc("InterfaceElementEditor")
                                            end
        
                                            if imgui.DragFloat(u8"##������� ������� X", sliders.posWantedX, 0.2, -530.0, 70.0, u8"������� ������� X: %.2f") then
                                                preset["Wanted"]["posWantedX"] = ("%.2f"):format(sliders.posWantedX[0])
                                                saveJson("preset")
                                                gotofunc("InterfaceElementEditor")
                                            end
                                            imgui.SameLine()
                                            if imgui.Button(u8'��������##21', imgui.ImVec2(70, 25)) then
                                                preset["Wanted"]["posWantedX"]  = -29.0
                                                saveJson("preset")
                                                sliders.posWantedX[0] = preset["Wanted"]["posWantedX"]
                                                gotofunc("InterfaceElementEditor")
                                            end
        
                                            if imgui.DragFloat(u8"##������� ������� Y", sliders.posWantedY, 0.2, 15.0, 440.0, u8"������� ������� Y: %.2f") then
                                                preset["Wanted"]["posWantedY"] = ("%.2f"):format(sliders.posWantedY[0])
                                                saveJson("preset")
                                                gotofunc("InterfaceElementEditor")
                                            end
                                            imgui.SameLine()
                                            if imgui.Button(u8'��������##22', imgui.ImVec2(70, 25)) then
                                                preset["Wanted"]["posWantedY"] = 114.0
                                                saveJson("preset")
                                                sliders.posWantedY[0] = preset["Wanted"]["posWantedY"]
                                                gotofunc("InterfaceElementEditor")
                                            end
        
                                            if imgui.DragFloat(u8"##������ ������� X", sliders.sizeWantedX, 0.01, 0.01, 1.0, u8"������ ������� X: %.2f") then
                                                preset["Wanted"]["sizeWantedX"] = ("%.2f"):format(sliders.sizeWantedX[0])
                                                saveJson("preset")
                                                gotofunc("InterfaceElementEditor")
                                            end
                                            imgui.SameLine()
                                            if imgui.Button(u8'��������##23', imgui.ImVec2(70, 25)) then
                                                preset["Wanted"]["sizeWantedX"] = 0.60
                                                saveJson("preset")
                                                sliders.sizeWantedX[0] = preset["Wanted"]["sizeWantedX"]
                                                gotofunc("InterfaceElementEditor")
                                            end
        
                                            if imgui.DragFloat(u8"##������ ������� Y", sliders.sizeWantedY, 0.01, 0.01, 1.5, u8"������ ������� Y: %.2f") then
                                                preset["Wanted"]["sizeWantedY"] = ("%.2f"):format(sliders.sizeWantedY[0])
                                                saveJson("preset")
                                                gotofunc("InterfaceElementEditor")
                                            end
                                            imgui.SameLine()
                                            if imgui.Button(u8'��������##24', imgui.ImVec2(70, 25)) then
                                                preset["Wanted"]["sizeWantedY"] = 1.21
                                                saveJson("preset")
                                                sliders.sizeWantedY[0] = preset["Wanted"]["sizeWantedY"]
                                                gotofunc("InterfaceElementEditor")
                                            end
        
                                        end
                                    elseif navigations.activeTab.gameinterface[0] == 11 then
                                        if imgui.Checkbox(u8"�������� �������� �����", checkboxes.EditClock) then
                                            preset["Clock"]["EditClock"] = checkboxes.EditClock[0]
                                            saveJson("preset")
                                            gotofunc("InterfaceElementEditor")
                                        end
                                        if preset["Clock"]["EditClock"] then
                                            if imgui.Checkbox(u8"�������� ����������� ����� �� ��������� ����", checkboxes.DrawClock) then
                                                preset["Clock"]["DrawClock"] = checkboxes.DrawClock[0]
                                                saveJson("preset")
                                                gotofunc("InterfaceElementEditor")
                                            end
                                            imgui.PushItemWidth(165)
                                            if imgui.Combo(u8"����� ������ �����", fontstyleclockvar, fontstylechar, #fontstyletext) then
                                                preset["Clock"]["fontstyleclock"] = fontstyleclockvar[0]
                                                saveJson("preset")
                                                gotofunc("InterfaceElementEditor")
                                            end
                                            if imgui.Combo(u8"������� ������� ������ �����", fontoutlineclockvar, fontoutlineclockchar, #fontmoneybordertext) then
                                                preset["Clock"]["fontoutlineclock"] = fontoutlineclockvar[0]
                                                saveJson("preset")
                                                gotofunc("InterfaceElementEditor")
                                            end
                                            imgui.PopItemWidth()
                                            if imgui.DragFloat(u8"##������� ����� X", sliders.posClockX, 0.2, -580.0, -0.0, u8"������� ����� X: %.2f") then
                                                preset["Clock"]["posClockX"] = ("%.2f"):format(sliders.posClockX[0])
                                                saveJson("preset")
                                                gotofunc("InterfaceElementEditor")
                                            end
                                            imgui.SameLine()
                                            if imgui.Button(u8'��������##25', imgui.ImVec2(70, 25)) then
                                                preset["Clock"]["posClockX"] = -32.0
                                                saveJson("preset")
                                                sliders.posClockX[0] = preset["Clock"]["posClockX"]
                                                gotofunc("InterfaceElementEditor")
                                            end
        
                                            if imgui.DragFloat(u8"##������� ����� Y", sliders.posClockY, 0.2, 0.0, 427.0, u8"������� ����� Y: %.2f") then
                                                preset["Clock"]["posClockY"] = ("%.2f"):format(sliders.posClockY[0])
                                                saveJson("preset")
                                                gotofunc("InterfaceElementEditor")
                                            end
                                            imgui.SameLine()
                                            if imgui.Button(u8'��������##26', imgui.ImVec2(70, 25)) then
                                                preset["Clock"]["posClockY"] = 22.0
                                                saveJson("preset")
                                                sliders.posClockY[0] = preset["Clock"]["posClockY"]
                                                gotofunc("InterfaceElementEditor")
                                            end
        
                                            if imgui.DragFloat(u8"##������ ����� X", sliders.sizeClockX, 0.01, 0.0, 3.0, u8"������ ����� X: %.2f") then
                                                preset["Clock"]["sizeClockX"] = ("%.2f"):format(sliders.sizeClockX[0])
                                                saveJson("preset")
                                                gotofunc("InterfaceElementEditor")
                                            end
                                            imgui.SameLine()
                                            if imgui.Button(u8'��������##27', imgui.ImVec2(70, 25)) then
                                                preset["Clock"]["sizeClockX"] = 0.55
                                                saveJson("preset")
                                                sliders.sizeClockX[0] = preset["Clock"]["sizeClockX"]
                                                gotofunc("InterfaceElementEditor")
                                            end
        
                                            if imgui.DragFloat(u8"##������ ����� Y", sliders.sizeClockY, 0.01, 0.0, 3.0, u8"������ ����� Y: %.2f") then
                                                preset["Clock"]["sizeClockY"] = ("%.2f"):format(sliders.sizeClockY[0])
                                                saveJson("preset")
                                                gotofunc("InterfaceElementEditor")
                                            end
                                            imgui.SameLine()
                                            if imgui.Button(u8'��������##28', imgui.ImVec2(70, 25)) then
                                                preset["Clock"]["sizeClockY"] = 1.1
                                                saveJson("preset")
                                                sliders.sizeClockY[0] = preset["Clock"]["sizeClockY"]
                                                gotofunc("InterfaceElementEditor")
                                            end
        
                                        end
                                    end
                                imgui.EndChild()
                            elseif navigations.current_elemets == 2 then
                                imgui.PushStyleColor(imgui.Col.Border, ini.borderchild.draw and imgui.GetStyle().Colors[imgui.Col.PlotHistogram] or imgui.ImVec4(0,0,0,0)) -- ����
                                imgui.BeginChild("##rightmenugg", imgui.ImVec2(imgui.GetWindowSize().x - 45, imgui.GetWindowSize().y - 118), true)
                                imgui.PopStyleColor()
                                if imgui.Checkbox(u8"�������� �������", checkboxes.recolorer) then
                                    preset["Recolorer"]["Recolorer"] = checkboxes.recolorer[0]
                                    saveJson("preset")
                                    gotofunc("Recolorer")
                                end
                                if preset["Recolorer"]["Recolorer"] then
                                    if imgui.ColorEdit3(u8"##������", icolors.RECOLORER_HEALTH, imgui.ColorEditFlags.AlphaBar + imgui.ColorEditFlags.NoInputs) then
                                        local r, g, b = tonumber(("%.3f"):format(icolors.RECOLORER_HEALTH[0])), tonumber(("%.3f"):format(icolors.RECOLORER_HEALTH[1])), tonumber(("%.3f"):format(icolors.RECOLORER_HEALTH[2]))
                                        preset["Recolorer"]["Health"] = join_argb(255, r * 255, g * 255, b * 255)
                                        saveJson("preset")
                                        gotofunc("Recolorer")
                                    end
                                    imgui.SameLine() imgui.Text(u8"���� ������� ��������")
                                    if imgui.ColorEdit3(u8"##���� ������� �����", icolors.RECOLORER_ARMOUR, imgui.ColorEditFlags.AlphaBar + imgui.ColorEditFlags.NoInputs) then
                                        local r, g, b = tonumber(("%.3f"):format(icolors.RECOLORER_ARMOUR[0])), tonumber(("%.3f"):format(icolors.RECOLORER_ARMOUR[1])), tonumber(("%.3f"):format(icolors.RECOLORER_ARMOUR[2]))
                                        preset["Recolorer"]["Armor"] = join_argb(255, r * 255, g * 255, b * 255)
                                        saveJson("preset")
                                        gotofunc("Recolorer")
                                    end
                                    imgui.SameLine() imgui.Text(u8"���� ������� �����") 
                                    if imgui.ColorEdit3(u8"##���� �����", icolors.RECOLORER_MONEY, imgui.ColorEditFlags.AlphaBar + imgui.ColorEditFlags.NoInputs) then
                                        local r, g, b = tonumber(("%.3f"):format(icolors.RECOLORER_MONEY[0])), tonumber(("%.3f"):format(icolors.RECOLORER_MONEY[1])), tonumber(("%.3f"):format(icolors.RECOLORER_MONEY[2]))
                                        preset["Recolorer"]["Money"] = join_argb(255, r * 255, g * 255, b * 255)
                                        saveJson("preset")
                                        gotofunc("Recolorer")
                                    end
                                    imgui.SameLine() imgui.Text(u8"���� �����") 
                                    if imgui.ColorEdit3(u8"##���� �����", icolors.RECOLORER_STARS, imgui.ColorEditFlags.AlphaBar + imgui.ColorEditFlags.NoInputs) then
                                        local r, g, b = tonumber(("%.3f"):format(icolors.RECOLORER_STARS[0])), tonumber(("%.3f"):format(icolors.RECOLORER_STARS[1])), tonumber(("%.3f"):format(icolors.RECOLORER_STARS[2]))
                                        preset["Recolorer"]["Stars"] = join_argb(255, r * 255, g * 255, b * 255)
                                        saveJson("preset")
                                        gotofunc("Recolorer")
                                    end
                                    imgui.SameLine() imgui.Text(u8"���� �����") 
                                    if imgui.ColorEdit3(u8"##���� ��������", icolors.RECOLORER_PATRONS, imgui.ColorEditFlags.AlphaBar + imgui.ColorEditFlags.NoInputs) then
                                        local r, g, b = tonumber(("%.3f"):format(icolors.RECOLORER_PATRONS[0])), tonumber(("%.3f"):format(icolors.RECOLORER_PATRONS[1])), tonumber(("%.3f"):format(icolors.RECOLORER_PATRONS[2]))
                                        preset["Recolorer"]["Patrons"] = join_argb(255, r * 255, g * 255, b * 255)
                                        saveJson("preset")
                                        gotofunc("Recolorer")
                                    end
                                    imgui.SameLine() imgui.Text(u8"���� ���-�� ��������")
                                    if imgui.ColorEdit3(u8"##���� �� �������", icolors.RECOLORER_PLAYERHEALTH, imgui.ColorEditFlags.AlphaBar + imgui.ColorEditFlags.NoInputs) then
                                        local r, g, b = tonumber(("%.3f"):format(icolors.RECOLORER_PLAYERHEALTH[0])), tonumber(("%.3f"):format(icolors.RECOLORER_PLAYERHEALTH[1])), tonumber(("%.3f"):format(icolors.RECOLORER_PLAYERHEALTH[2]))
                                        preset["Recolorer"]["PlayerHealth"] = join_argb(255, r * 255, g * 255, b * 255)
                                        saveJson("preset")
                                        gotofunc("Recolorer")
                                    end
                                    imgui.SameLine() imgui.Text(u8"���� ������� �� �������")
                                    if imgui.ColorEdit3(u8"##���� �� ������� ���", icolors.RECOLORER_PLAYERHEALTH2, imgui.ColorEditFlags.AlphaBar + imgui.ColorEditFlags.NoInputs) then
                                        local r, g, b = tonumber(("%.3f"):format(icolors.RECOLORER_PLAYERHEALTH2[0])), tonumber(("%.3f"):format(icolors.RECOLORER_PLAYERHEALTH2[1])), tonumber(("%.3f"):format(icolors.RECOLORER_PLAYERHEALTH2[2]))
                                        preset["Recolorer"]["PlayerHealth2"] = join_argb(255, r * 255, g * 255, b * 255)
                                        saveJson("preset")
                                        gotofunc("Recolorer")
                                    end
                                    imgui.SameLine() imgui.Text(u8"���� ������� �� ������� ���")
                                    if imgui.ColorEdit3(u8"##���� ����� �������", icolors.RECOLORER_PLAYERARMOR, imgui.ColorEditFlags.AlphaBar + imgui.ColorEditFlags.NoInputs) then
                                        local r, g, b = tonumber(("%.3f"):format(icolors.RECOLORER_PLAYERARMOR[0])), tonumber(("%.3f"):format(icolors.RECOLORER_PLAYERARMOR[1])), tonumber(("%.3f"):format(icolors.RECOLORER_PLAYERARMOR[2]))
                                        preset["Recolorer"]["PlayerArmor"] = join_argb(255, r * 255, g * 255, b * 255)
                                        saveJson("preset")
                                        gotofunc("Recolorer")
                                    end
                                    imgui.SameLine() imgui.Text(u8"���� ������� ����� �������")
                                    if imgui.ColorEdit3(u8"##���� ����� ������� ���", icolors.RECOLORER_PLAYERARMOR2, imgui.ColorEditFlags.AlphaBar + imgui.ColorEditFlags.NoInputs) then
                                        local r, g, b = tonumber(("%.3f"):format(icolors.RECOLORER_PLAYERARMOR2[0])), tonumber(("%.3f"):format(icolors.RECOLORER_PLAYERARMOR2[1])), tonumber(("%.3f"):format(icolors.RECOLORER_PLAYERARMOR2[2]))
                                        preset["Recolorer"]["PlayerArmor2"] = join_argb(255, r * 255, g * 255, b * 255)
                                        saveJson("preset")
                                        gotofunc("Recolorer")
                                    end
                                    imgui.SameLine() imgui.Text(u8"���� ������� ����� ������� ���")
                                end
                                imgui.EndChild()
                            elseif navigations.current_elemets == 3 then
                                imgui.PushStyleColor(imgui.Col.Border, ini.borderchild.draw and imgui.GetStyle().Colors[imgui.Col.PlotHistogram] or imgui.ImVec4(0,0,0,0)) -- ����
                                imgui.BeginChild("##rightmenugg", imgui.ImVec2(imgui.GetWindowSize().x - 45, imgui.GetWindowSize().y - 118), true)
                                imgui.PopStyleColor()
                                imgui.BeginTitleChild(u8"��������� ��������", imgui.ImVec2(450, 270), 6, 150)
                                    if imgui.Checkbox(u8"�������� ���������", checkboxes.hphud) then
                                        preset["HPHud"]["Status"] = checkboxes.hphud[0]
                                        saveJson("preset")
                                    end
                                    if preset["HPHud"]["Status"] then
                                        if imgui.Checkbox(u8"�������� ������� HP", checkboxes.hpt) then
                                            preset["HPHud"]["hptext"] = checkboxes.hpt[0]
                                            saveJson("preset")
                                        end
                                        imgui.PushItemWidth(330)
                                        if imgui.DragFloat(u8"##��������� ����������: X", sliders.hpposX, 0.2, 0.0, 625.0, u8"��������� X: %.2f") then
                                            preset["HPHud"]["posX"] = ("%.2f"):format(sliders.hpposX[0])
                                            saveJson("preset")
                                        end imgui.SameLine()
                                        if imgui.Button(u8"��������##hpposx", imgui.ImVec2(80, 25)) then
                                            preset["HPHud"]["posX"] = 610.50
                                            saveJson("preset")
                                            sliders.hpposX[0] = 610.50
                                        end
                                        if imgui.DragFloat(u8"##��������� ����������: Y", sliders.hpposY, 0.2, 0.0, 440.0, u8"��������� Y: %.2f") then
                                            preset["HPHud"]["posY"]  = ("%.2f"):format(sliders.hpposY[0])
                                            saveJson("preset")
                                        end imgui.SameLine()
                                        if imgui.Button(u8"��������##hpposy", imgui.ImVec2(80, 25)) then
                                            preset["HPHud"]["posY"] = 66.0
                                            saveJson("preset")
                                            sliders.hpposY[0] = 66.0
                                        end
                                        if imgui.DragFloat(u8"##������ ���������� ��: X", sliders.hpSizeX, 0.01, 0.0, 440.0, u8"������ X: %.2f") then
                                            preset["HPHud"]["sizeX"] = ("%.2f"):format(sliders.hpSizeX[0])
                                            saveJson("preset")
                                        end imgui.SameLine()
                                        if imgui.Button(u8"��������##hpSizeX", imgui.ImVec2(80, 25)) then
                                            preset["HPHud"]["sizeX"] = 0.25
                                            saveJson("preset")
                                            sliders.hpSizeX[0] = 0.25
                                        end
                                        if imgui.DragFloat(u8"##������ ���������� ��: Y", sliders.hpSizeY, 0.01, 0.0, 440.0, u8"������ Y: %.2f") then
                                            preset["HPHud"]["sizeY"] = ("%.2f"):format(sliders.hpSizeY[0])
                                            saveJson("preset")
                                        end imgui.SameLine()
                                        if imgui.Button(u8"��������##hpSizeY", imgui.ImVec2(80, 25)) then
                                            preset["HPHud"]["sizeY"] = 0.95
                                            saveJson("preset")
                                            sliders.hpSizeY[0] = 0.95
                                        end
                                        imgui.PopItemWidth()
                                        imgui.PushItemWidth(170)
                                        if imgui.Combo(u8"����� ������##hp", fontstylehpvar, fontstylechar, #fontstyletext) then
                                            preset["HPHud"]["fonts"] = fontstylehpvar[0]
                                            saveJson("preset")
                                        end
                                        imgui.PopItemWidth()
                                        
                                        imgui.Text(u8"���� ����������:") imgui.SameLine() if imgui.ColorEdit4(u8"##���� ����������##hp", icolors.IndicatorHP_color, imgui.ColorEditFlags.NoInputs) then
                                            local r, g, b, a = tonumber(("%.3f"):format(icolors.IndicatorHP_color[0])), tonumber(("%.3f"):format(icolors.IndicatorHP_color[1])), tonumber(("%.3f"):format(icolors.IndicatorHP_color[2]))
                                            preset["HPHud"]["Color"] = join_argb(255, r * 255, g * 255, b * 255)
                                            saveJson("preset")
                                        end


                                        
                                    end
                                imgui.EndChild()
                                
                                imgui.NewLine()

                                imgui.BeginTitleChild(u8"��������� �����", imgui.ImVec2(450, 270), 6, 150)
                                    if imgui.Checkbox(u8"�������� ���������##�����", checkboxes.armorhud) then
                                        preset["ArmorHud"]["Status"] = checkboxes.armorhud[0]
                                        saveJson("preset")
                                    end
                                    if preset["ArmorHud"]["Status"] then
                                        if imgui.Checkbox(u8"�������� ������� AR", checkboxes.armortext) then
                                            preset["ArmorHud"]["armortext"] = checkboxes.armortext[0]
                                            saveJson("preset")
                                        end
                                        imgui.PushItemWidth(330)
                                        if imgui.DragFloat(u8"##��������� ����������: X##arm", sliders.armorhudPosX, 0.2, 0.0, 625.0, u8"��������� X: %.2f") then
                                            preset["ArmorHud"]["posX"] = ("%.2f"):format(sliders.armorhudPosX[0])
                                            saveJson("preset")
                                        end imgui.SameLine()
                                        if imgui.Button(u8"��������##hpposx", imgui.ImVec2(80, 25)) then
                                            preset["ArmorHud"]["posX"] = 610.50
                                            saveJson("preset")
                                            sliders.armorhudPosX[0] = 610.50
                                        end
                                        if imgui.DragFloat(u8"##��������� ����������: Y##arm", sliders.armorhudPosY, 0.2, 0.0, 440.0, u8"��������� Y: %.2f") then
                                            preset["ArmorHud"]["posY"] = ("%.2f"):format(sliders.armorhudPosY[0])
                                            saveJson("preset")
                                        end imgui.SameLine()
                                        if imgui.Button(u8"��������##armorhudPosY", imgui.ImVec2(80, 25)) then
                                            preset["ArmorHud"]["posY"] = 44.30
                                            saveJson("preset")
                                            sliders.armorhudPosY[0] = 44.30
                                        end
                                        if imgui.DragFloat(u8"##������ ����������: X##arm", sliders.armorhudSizeX, 0.01, 0.0, 440.0, u8"������ X: %.2f") then
                                            preset["ArmorHud"]["sizeX"] = ("%.2f"):format(sliders.armorhudSizeX[0])
                                            saveJson("preset")
                                        end imgui.SameLine()
                                        if imgui.Button(u8"��������##armSizeX", imgui.ImVec2(80, 25)) then
                                            preset["ArmorHud"]["sizeX"] = 0.25
                                            saveJson("preset")
                                            sliders.armorhudSizeX[0] = 0.25
                                        end
                                        if imgui.DragFloat(u8"##������ ����������: Y##arm", sliders.armorhudSizeY, 0.01, 0.0, 440.0, u8"������ Y: %.2f") then
                                            preset["ArmorHud"]["sizeY"] = ("%.2f"):format(sliders.armorhudSizeY[0])
                                            saveJson("preset")
                                        end imgui.SameLine()
                                        if imgui.Button(u8"��������##hpSizeY", imgui.ImVec2(80, 25)) then
                                            preset["ArmorHud"]["sizeY"] = 0.95
                                            saveJson("preset")
                                            sliders.armorhudSizeY[0] = 0.95
                                        end
                                        imgui.PopItemWidth()
                                        imgui.PushItemWidth(170)
                                        if imgui.Combo(u8"����� ������##arm", fontstylearmvar, fontstylechar, #fontstyletext) then
                                            preset["ArmorHud"]["fonts"] = fontstylearmvar[0]
                                            saveJson("preset")
                                        end
                                        imgui.PopItemWidth()
                                        
                                        imgui.Text(u8"���� ����������:") imgui.SameLine() if imgui.ColorEdit4(u8"##���� ����������##arm", icolors.IndicatorARMOR_color, imgui.ColorEditFlags.NoInputs) then
                                            local r, g, b, a = tonumber(("%.3f"):format(icolors.IndicatorARMOR_color[0])), tonumber(("%.3f"):format(icolors.IndicatorARMOR_color[1])), tonumber(("%.3f"):format(icolors.IndicatorARMOR_color[2]))
                                            preset["ArmorHud"]["Color"]= join_argb(255, r * 255, g * 255, b * 255)
                                            saveJson("preset")
                                        end


                                        
                                    end
                                imgui.EndChild()
                                imgui.EndChild()
                            elseif navigations.current_elemets == 4 then
                                imgui.PushStyleColor(imgui.Col.Border, ini.borderchild.draw and imgui.GetStyle().Colors[imgui.Col.PlotHistogram] or imgui.ImVec4(0,0,0,0)) -- ����
                                imgui.BeginChild("##rightmenugg", imgui.ImVec2(imgui.GetWindowSize().x - 45, imgui.GetWindowSize().y - 118), true)
                                imgui.PopStyleColor()
                                    drawFileSelection()
                                    imgui.SameLine()
                                    imgui.PushItemWidth(120)
                                    imgui.Text(u8"�������� �������:")
                                    imgui.SameLine()
                                    imgui.InputText(u8'##������� �������� �������:', buffers.IEpresetName, ffi.sizeof(buffers.IEpresetName))
                                    imgui.PopItemWidth()
                                    imgui.SameLine()
                                    if imgui.Button(u8"�������", imgui.ImVec2(88, 23)) then
                                        if u8:decode(ffi.string(buffers.IEpresetName)) ~= nil and u8:decode(ffi.string(buffers.IEpresetName)) ~= "" then
                                            txtFiles = {}
                                            if not doesFileExist(getWorkingDirectory().."\\GameTweaker\\IE-presets\\"..u8:decode(ffi.string(buffers.IEpresetName))..".json") then
                                                local file = io.open(getWorkingDirectory().."\\GameTweaker\\IE-presets\\"..u8:decode(ffi.string(buffers.IEpresetName))..".json", "a+") -- ��������� � ������� ����
                                                file:close() -- ���������, ��� ���� �� ����� ����� �� �� ��������. �� �� ��� ���������!
                                                sampAddChatMessage("����: "..u8:decode(ffi.string(buffers.IEpresetName))..".json ������� ������!", -1)
                                                local file = io.open(getWorkingDirectory().."\\GameTweaker\\IE-presets\\"..u8:decode(ffi.string(buffers.IEpresetName))..".json", "w")
                                      
                                                file:write(formatterJson(IEPresets))
                                                file:flush() -- ���������
                                                file:close() -- ���������
                                                buffers.IEpresetName = new.char[128]()
                                                txtFilesInCurrentDirectory = getTxtFilesInDirectory(getGameDirectory().."\\moonloader\\GameTweaker\\IE-presets")  -- ��������� ������ ������
                                            else
                                                sampAddChatMessage("���� � ����� ��������� ��� ����������", -1)
                                                buffers.IEpresetName = new.char[128]()
                                            end
                                        end
                                    end
                                imgui.EndChild()
                            elseif navigations.current_elemets == 5 then
                                imgui.PushStyleColor(imgui.Col.Border, ini.borderchild.draw and imgui.GetStyle().Colors[imgui.Col.PlotHistogram] or imgui.ImVec4(0,0,0,0)) -- ����
                                imgui.BeginChild("##rightmenugg", imgui.ImVec2(imgui.GetWindowSize().x - 45, imgui.GetWindowSize().y - 118), true)
                                imgui.PopStyleColor()
                                    if imgui.Checkbox(u8"������ ���", checkboxes.showchat) then
                                        preset["Other"]["showchat"] = checkboxes.showchat[0]
                                        saveJson("preset")
                                        gotofunc("ShowCHAT")
                                    end
                                    if imgui.Checkbox(u8"������ ���", checkboxes.showhud) then
                                        preset["Other"]["showhud"] = checkboxes.showhud[0]
                                        saveJson("preset")
                                        gotofunc("ShowHUD")
                                    end
                                    
                                    if imgui.Checkbox(u8"������ �� �������", checkboxes.targetblip) then
                                        preset["Other"]["targetblip"] = checkboxes.targetblip[0]
                                        saveJson("preset")
                                        gotofunc("TargetBlip")
                                    end
                                    imgui.Hint(u8"�������� / ��������� ����������� ��� �������� ����� �� � ��� ��������", 0.3)
                                imgui.EndChild()
                            end
                        
                    
                    elseif navigations.activeTab.home[0] == 7 then

                        imgui.SetCursorPos(imgui.ImVec2(imgui.GetWindowSize().x / 90, imgui.GetCursorPosY() + 16))
                        imgui.PushFont(fonts[50])
                        imgui.TextColored(imgui.ImVec4(ini.BeginColor.r, ini.BeginColor.g, ini.BeginColor.b, ini.BeginColor.a), u8"COMMANDS")
                        imgui.PopFont()
                        imgui.PushStyleColor(imgui.Col.Border, ini.borderchild.draw and imgui.GetStyle().Colors[imgui.Col.PlotHistogram] or imgui.ImVec4(0,0,0,0)) -- ����
                        imgui.SetCursorPos(imgui.ImVec2(imgui.GetCursorPosX() - 1, imgui.GetCursorPosY() - 8))
                        imgui.BeginChild("##rightmenugg", imgui.ImVec2(imgui.GetWindowSize().x - 45, imgui.GetWindowSize().y - 85), true)
                            imgui.PopStyleColor(1)
                            imgui.SetCursorPosX(10)
                            imgui.NewInputText('##SearchBar', buffers.search_cmd, 300, u8'����� �� ������', 2)
                            imgui.PushItemWidth(130)
                            for k, v in orderedPairs(imguiInputsCmdEditor) do
                                if str(buffers.search_cmd) ~= "" then
                                    if k:find(str(buffers.search_cmd)) or str(v.var):find(str(buffers.search_cmd)) then
                                        if imgui.InputText(k, v.var, sizeof(v.var)) then
                                            local cmd = string.lower(str(v.var))
                                            ini.commands[v.cfg] = cmd
                                            save()
                                        end
                                    end
                                else
                                    if imgui.InputText(k, v.var, sizeof(v.var)) then
                                        local cmd = string.lower(str(v.var))
                                        ini.commands[v.cfg] = cmd
                                        save()
                                    end
                                end
                            end
                            imgui.PopItemWidth()
                        imgui.EndChild()

                    elseif navigations.activeTab.home[0] == 8 then
                        imgui.SetCursorPos(imgui.ImVec2(imgui.GetWindowSize().x / 90, imgui.GetCursorPosY() + 16))
                        imgui.PushFont(fonts[50])
                        imgui.TextColored(imgui.ImVec4(ini.BeginColor.r, ini.BeginColor.g, ini.BeginColor.b, ini.BeginColor.a), u8"DESIGN")
                        imgui.PopFont()
                        imgui.PushStyleColor(imgui.Col.Border, ini.borderchild.draw and imgui.GetStyle().Colors[imgui.Col.PlotHistogram] or imgui.ImVec4(0,0,0,0)) -- ����
                        imgui.SetCursorPos(imgui.ImVec2(imgui.GetCursorPosX() - 1, imgui.GetCursorPosY() - 8))
                        imgui.BeginChild("##rightmenugg", imgui.ImVec2(imgui.GetWindowSize().x - 45, imgui.GetWindowSize().y - 85), true)
                        imgui.PopStyleColor(1)
                            

                            

                       
                            imgui.SetCursorPos(imgui.ImVec2(360, 5))
                            
                            --imgui.BeginTitleChild(u8"����� ����� ������", imgui.ImVec2(300, 200), 7, 90, false)
                            imgui.BeginChild(u8"����� ����� ������", imgui.ImVec2(300, 200), false)
                                imgui.Text(u8"���� �������� ������� ����� ����:") imgui.SameLine()
                                imgui.SetCursorPosX(250)
                                if imgui.ColorEdit4("##Color Panel Left Up", icolors.PLeftUp, imgui.ColorEditFlags.AlphaBar + imgui.ColorEditFlags.NoInputs) then
                                    ini.PLeftUp.r, ini.PLeftUp.g, ini.PLeftUp.b, ini.PLeftUp.a = tonumber(("%.3f"):format(icolors.PLeftUp[0])), tonumber(("%.3f"):format(icolors.PLeftUp[1])), tonumber(("%.3f"):format(icolors.PLeftUp[2])), tonumber(("%.3f"):format(icolors.PLeftUp[3]))
                                    save() 
                                end
                                imgui.Text(u8"���� �������� ������� ����� ���:") imgui.SameLine()
                                imgui.SetCursorPosX(250)
                                if imgui.ColorEdit4("##Color Panel Left Down", icolors.PLeftDown, imgui.ColorEditFlags.AlphaBar + imgui.ColorEditFlags.NoInputs) then
                                    ini.PLeftDown.r, ini.PLeftDown.g, ini.PLeftDown.b, ini.PLeftDown.a = tonumber(("%.3f"):format(icolors.PLeftDown[0])), tonumber(("%.3f"):format(icolors.PLeftDown[1])), tonumber(("%.3f"):format(icolors.PLeftDown[2])), tonumber(("%.3f"):format(icolors.PLeftDown[3]))
                                    save() 
                                end
                                imgui.Text(u8"���� �������� ������� ������ ����:") imgui.SameLine()
                                imgui.SetCursorPosX(250)
                                if imgui.ColorEdit4("##Color Panel Right Up", icolors.PRightUp, imgui.ColorEditFlags.AlphaBar + imgui.ColorEditFlags.NoInputs) then
                                    ini.PRightUp.r, ini.PRightUp.g, ini.PRightUp.b, ini.PRightUp.a = tonumber(("%.3f"):format(icolors.PRightUp[0])), tonumber(("%.3f"):format(icolors.PRightUp[1])), tonumber(("%.3f"):format(icolors.PRightUp[2])), tonumber(("%.3f"):format(icolors.PRightUp[3]))
                                    save() 
                                end
                                imgui.Text(u8"���� �������� ������� ������ ���:") imgui.SameLine()
                                imgui.SetCursorPosX(250)
                                if imgui.ColorEdit4("##Color Panel Right Down", icolors.PRightDown, imgui.ColorEditFlags.AlphaBar + imgui.ColorEditFlags.NoInputs) then
                                    ini.PRightDown.r, ini.PRightDown.g, ini.PRightDown.b, ini.PRightDown.a = tonumber(("%.3f"):format(icolors.PRightDown[0])), tonumber(("%.3f"):format(icolors.PRightDown[1])), tonumber(("%.3f"):format(icolors.PRightDown[2])), tonumber(("%.3f"):format(icolors.PRightDown[3]))
                                    save() 
                                end
                                imgui.Text(u8"���� ��������� ������:") imgui.SameLine()
                                imgui.SetCursorPosX(250)
                                if imgui.ColorEdit4("##ActiveText", icolors.ActiveText,  imgui.ColorEditFlags.AlphaBar + imgui.ColorEditFlags.NoInputs) then
                                    ini.ActiveText.r, ini.ActiveText.g, ini.ActiveText.b, ini.ActiveText.a = tonumber(("%.3f"):format(icolors.ActiveText[0])), tonumber(("%.3f"):format(icolors.ActiveText[1])), tonumber(("%.3f"):format(icolors.ActiveText[2])), tonumber(("%.3f"):format(icolors.ActiveText[3]))
                                    save()
                                    SwitchTheStyle()
                                end
                                imgui.Text(u8"���� ���������� ������:") imgui.SameLine()
                                imgui.SetCursorPosX(250)
                                if imgui.ColorEdit4("##PassiveText", icolors.PassiveText, imgui.ColorEditFlags.AlphaBar + imgui.ColorEditFlags.NoInputs) then
                                    ini.PassiveText.r, ini.PassiveText.g, ini.PassiveText.b, ini.PassiveText.a = tonumber(("%.3f"):format(icolors.PassiveText[0])), tonumber(("%.3f"):format(icolors.PassiveText[1])), tonumber(("%.3f"):format(icolors.PassiveText[2])), tonumber(("%.3f"):format(icolors.PassiveText[3]))
                                    save()
                                    SwitchTheStyle()
                                end
                            imgui.EndChild()
                            imgui.SetCursorPosY(5)
                            imgui.Text(u8"�������� ����:") imgui.SameLine()
                            imgui.SetCursorPosX(240)
                            if imgui.ColorEdit4("##WindowBG", icolors.WindowBG,  imgui.ColorEditFlags.AlphaBar + imgui.ColorEditFlags.NoInputs) then
                                ini.WindowBG.r, ini.WindowBG.g, ini.WindowBG.b, ini.WindowBG.a = tonumber(("%.3f"):format(icolors.WindowBG[0])), tonumber(("%.3f"):format(icolors.WindowBG[1])), tonumber(("%.3f"):format(icolors.WindowBG[2])), tonumber(("%.3f"):format(icolors.WindowBG[3]))
                                save()
                                SwitchTheStyle()
                            end
                            --[[imgui.Text(u8"���� ���� �����������:") imgui.SameLine()
                            imgui.SetCursorPosX(240)
                            if imgui.ColorEdit4("##�olorFoneImg", icolors.�olorFoneImg,  imgui.ColorEditFlags.AlphaBar + imgui.ColorEditFlags.NoInputs) then
                                ini.�olorFoneImg.r, ini.�olorFoneImg.g, ini.�olorFoneImg.b, ini.�olorFoneImg.a = tonumber(("%.3f"):format(icolors.�olorFoneImg[0])), tonumber(("%.3f"):format(icolors.�olorFoneImg[1])), tonumber(("%.3f"):format(icolors.�olorFoneImg[2])), tonumber(("%.3f"):format(icolors.�olorFoneImg[3]))
                                save()
                                SwitchTheStyle()
                            end]]
                            imgui.Text(u8"���� �����:") imgui.SameLine()
                            imgui.SetCursorPosX(240)
                            if imgui.ColorEdit4("##ColorNavi", icolors.ColorNavi,  imgui.ColorEditFlags.AlphaBar + imgui.ColorEditFlags.NoInputs) then
                                ini.ColorNavi.r, ini.ColorNavi.g, ini.ColorNavi.b, ini.ColorNavi.a = tonumber(("%.3f"):format(icolors.ColorNavi[0])), tonumber(("%.3f"):format(icolors.ColorNavi[1])), tonumber(("%.3f"):format(icolors.ColorNavi[2])), tonumber(("%.3f"):format(icolors.ColorNavi[3]))
                                save()
                                SwitchTheStyle()
                            end
                            imgui.Text(u8"���� ������:") imgui.SameLine()
                            imgui.SetCursorPosX(240)
                            if imgui.ColorEdit4("##ColorText", icolors.ColorText, imgui.ColorEditFlags.AlphaBar + imgui.ColorEditFlags.NoInputs) then
                                ini.ColorText.r, ini.ColorText.g, ini.ColorText.b, ini.ColorText.a = tonumber(("%.3f"):format(icolors.ColorText[0])), tonumber(("%.3f"):format(icolors.ColorText[1])), tonumber(("%.3f"):format(icolors.ColorText[2])), tonumber(("%.3f"):format(icolors.ColorText[3]))
                                save()
                                SwitchTheStyle()
                            end
                            imgui.Text(u8"���� ��������:") imgui.SameLine()
                            imgui.SetCursorPosX(240)
                            if imgui.ColorEdit4("##LogoColor", icolors.LogoColor, imgui.ColorEditFlags.AlphaBar + imgui.ColorEditFlags.NoInputs) then
                                ini.logocolor.r, ini.logocolor.g, ini.logocolor.b, ini.logocolor.a = tonumber(("%.3f"):format(icolors.LogoColor[0])), tonumber(("%.3f"):format(icolors.LogoColor[1])), tonumber(("%.3f"):format(icolors.LogoColor[2])), tonumber(("%.3f"):format(icolors.LogoColor[3]))
                                save()
                                SwitchTheStyle()
                            end
                            imgui.Text(u8"���� ����������:") imgui.SameLine()
                            imgui.SetCursorPosX(240)
                            if imgui.ColorEdit4("##BeginColor", icolors.BeginColor, imgui.ColorEditFlags.AlphaBar + imgui.ColorEditFlags.NoInputs) then
                                ini.BeginColor.r, ini.BeginColor.g, ini.BeginColor.b, ini.BeginColor.a = tonumber(("%.3f"):format(icolors.BeginColor[0])), tonumber(("%.3f"):format(icolors.BeginColor[1])), tonumber(("%.3f"):format(icolors.BeginColor[2])), tonumber(("%.3f"):format(icolors.BeginColor[3]))
                                save()
                            end
                            imgui.Text(u8"���� ����� � ����:") imgui.SameLine()
                            imgui.SetCursorPosX(240)
                            if imgui.ColorEdit4("##colorchildmenu", icolors.�olorChildMenu,  imgui.ColorEditFlags.AlphaBar + imgui.ColorEditFlags.NoInputs) then
                                ini.�olorChildMenu.r, ini.�olorChildMenu.g, ini.�olorChildMenu.b, ini.�olorChildMenu.a = tonumber(("%.3f"):format(icolors.�olorChildMenu[0])), tonumber(("%.3f"):format(icolors.�olorChildMenu[1])), tonumber(("%.3f"):format(icolors.�olorChildMenu[2])), tonumber(("%.3f"):format(icolors.�olorChildMenu[3]))
                                save()
                                SwitchTheStyle()
                            end
                            if imgui.Checkbox(u8'����������� ����� � ����', checkboxes.borderchild_draw) then
                                ini.borderchild.draw = not ini.borderchild.draw
                                save()
                            end
                        imgui.EndChild()
                        
                    end
                    imgui.PopFont()
                imgui.EndChild()
            imgui.EndChild()
        imgui.End()
        imgui.PopStyleVar()
    end
)


function imgui.TextColoredRGB(text)
    local style = imgui.GetStyle()
    local colors = style.Colors
    local ImVec4 = imgui.ImVec4

    local explode_argb = function(argb)
        local a = bit.band(bit.rshift(argb, 24), 0xFF)
        local r = bit.band(bit.rshift(argb, 16), 0xFF)
        local g = bit.band(bit.rshift(argb, 8), 0xFF)
        local b = bit.band(argb, 0xFF)
        return a, r, g, b
    end

    local getcolor = function(color)
        if color:sub(1, 6):upper() == 'SSSSSS' then
            local r, g, b = colors[1].x, colors[1].y, colors[1].z
            local a = tonumber(color:sub(7, 8), 16) or colors[1].w * 255
            return ImVec4(r, g, b, a / 255)
        end
        local color = type(color) == 'string' and tonumber(color, 16) or color
        if type(color) ~= 'number' then return end
        local r, g, b, a = explode_argb(color)
        return imgui.ImVec4(r/255, g/255, b/255, a/255)
    end

    local render_text = function(text_)
        for w in text_:gmatch('[^\r\n]+') do
            local text, colors_, m = {}, {}, 1
            w = w:gsub('{(......)}', '{%1FF}')
            while w:find('{........}') do
                local n, k = w:find('{........}')
                local color = getcolor(w:sub(n + 1, k - 1))
                if color then
                    text[#text], text[#text + 1] = w:sub(m, n - 1), w:sub(k + 1, #w)
                    colors_[#colors_ + 1] = color
                    m = n
                end
                w = w:sub(1, n - 1) .. w:sub(k + 1, #w)
            end
            if text[0] then
                for i = 0, #text do
                    imgui.TextColored(colors_[i] or colors[1], u8(text[i]))
                    imgui.SameLine(nil, 0)
                end
                imgui.NewLine()
            else imgui.Text(u8(w)) end
        end
    end

    render_text(text)
end

--==========================================[ Custom NameTags ] ========================================
function explode_argb(argb)
    local a = bit.band(bit.rshift(argb, 24), 0xFF)
    local r = bit.band(bit.rshift(argb, 16), 0xFF)
    local g = bit.band(bit.rshift(argb, 8), 0xFF)
    local b = bit.band(argb, 0xFF)
    return a, r, g, b
end



function join_argb(a, r, g, b)
    local argb = b  -- b
    argb = bit.bor(argb, bit.lshift(g, 8))  -- g
    argb = bit.bor(argb, bit.lshift(r, 16)) -- r
    argb = bit.bor(argb, bit.lshift(a, 24)) -- a
    return argb
end

function getBodyPartCoordinates(id, handle)
	local pedptr = getCharPointer(handle)
	local vec = ffi.new("float[3]")
	getBonePosition(ffi.cast("void*", pedptr), vec, id, true)
	return vec[0], vec[1], vec[2]
end

function cntfont()
    CNTrenderFont = renderCreateFont(ini.custom_nametags.fontName, ini.custom_nametags.fontSize, ini.custom_nametags.fontFlag)
end
--===============================================================================================================================================

function get_samp_version()
    if samp_base == nil or samp_base == 0 then 
        samp_base = getModuleHandle("samp.dll") 
    end 

    if samp_base ~= 0 then 
        local e_lfanew = ffi.cast("long*", samp_base + 60)[0] 
        local nt_header = samp_base + e_lfanew 
        local entry_point_addr = ffi.cast("unsigned int*", nt_header + 40)[0] 
        local versions = {
            [0x31DF13] = "r1",
            [0x3195DD] = "r2",
            [0xCC4D0] = "r3",
            [0xCBCB0] = "r4",
            [0xFDB60] = "dl"
        }
        return versions[entry_point_addr] or "unknown"
    end 

    return "unknown" 
end


----------------------------------- [ugenrl] ------------------------------------------------------------
function getListOfSounds(name)
    local soundFiles = {}
    for file in lfs.dir(soundsDir) do
        if file:match(name) then
            table.insert(soundFiles, file)
        end
    end
    return soundFiles
end

function loadSounds()
	deagleSounds = getListOfSounds('Deagle')
	shotgunSounds = getListOfSounds('Shotgun')
    rifleSounds = getListOfSounds('Rifle')
	m4Sounds = getListOfSounds('M4')
    mp5Sounds = getListOfSounds('MP5')
    uziSounds = getListOfSounds('Uzi')
    Pistol9mmSounds = getListOfSounds('Pistol9mm')
    MinigunSounds = getListOfSounds('Minigun')
    AKSounds = getListOfSounds('AK')
	hitSounds = getListOfSounds('Bell')
	painSounds = getListOfSounds('Pain')
    explSounds = getListOfSounds('Explosion')
end

function changeSound(id, name)
	playSound(name, ini.ugenrl_volume.weapon)
	ini.ugenrl_sounds[id] = name
	save()
end

function getNumberSounds(id, name)
    for i, v in ipairs(name) do
        if v == ini.ugenrl_sounds[id] then
            n = i
        end
    end
    return n
end

function playSound(soundFile, soundVol, charHandle)
	if not soundFile or not doesFileExist(soundsDir..soundFile) then return false end
	if audio then collectgarbage() end
	if charHandle == nil then
		audio = loadAudioStream(soundsDir..soundFile)
    elseif charHandle ~= nil then
		audio = load3dAudioStream(soundsDir..soundFile) 
		setPlay3dAudioStreamAtChar(audio, charHandle)
	end
	setAudioStreamVolume(audio, soundVol)
	setAudioStreamState(audio, 1)
	clearSound(audio)
end

function clearSound(audio)
	lua_thread.create(function()
		while getAudioStreamState(audio) == 1 do wait(50) end
		collectgarbage()
	end)
end

function isExpl()
    return readMemory(0xC88950 + 0x28, 1, true) == 1
end


function onSendRpc(id, bs, priority, reliability, orderingChannel, shiftTs)
	if ini.ugenrl_main.enable then
		if id == 115 then
			local act = raknetBitStreamReadBool(bs)
			dmgId = raknetBitStreamReadInt16(bs)
			dmgValue = raknetBitStreamReadFloat(bs)
			dmgWeaponId = raknetBitStreamReadInt32(bs)
			dmgBodypart = raknetBitStreamReadInt32(bs)
			if ini.ugenrl_main.pain and act then 
				playPain = true 
			end
			if ini.ugenrl_main.hit and not act then 
				playHit = true 
			end
		end
	end
    if id == 50 then
        local cmd_len = raknetBitStreamReadInt32(bs)
        local cmd = raknetBitStreamReadString(bs, cmd_len)
        cmd = string.lower(cmd)

        if cmd:find("^"..ini.commands.openmenu.."$") then
            gotofunc("OpenMenu")
            return false
        elseif cmd:find("^"..ini.commands.tws.."$") then
            gotofunc("OpenTws")
            return false
        elseif cmd:find("^"..ini.commands.opentimecyccreator.."$") then
            gotofunc("OpenTimecycCreator")
            return false
        elseif cmd:find("^/gtunload$") then
            sampAddChatMessage(script_name.." {FFFFFF}������ ��������! ��� ������������ �����������: {dc4747}CTRL + R", 0x73b461)
            thisScript():unload()
            return false
        elseif cmd:find("^"..ini.commands.settime.." .+") or cmd:find("^"..ini.commands.settime.."$") then
            local hours = cmd:match(ini.commands.settime.." (%d+)")
            local min = cmd:match(ini.commands.settime.." %d+%s(%d+)")
            if min == nil then min = 0 end
            hours = tonumber(hours)
            min = tonumber(min)
            if ini.settings.blocktime then
                if type(hours) ~= 'number' or hours < 0 or hours > 23 or type(min) ~= 'number' or min < 0 or min > 59 then
                    sampAddChatMessage(script_name.." {FFFFFF}�����������: {dc4747}"..ini.commands.settime.." [0-23 - ����] [0-59 - ������]", 0x73b461)
                    sampAddChatMessage(script_name.." {FFFFFF}������� ��������: {dc4747}"..ini.settings.hours..":"..("%02d"):format(ini.settings.min), 0x73b461)
                else
                    ini.settings.hours = hours
                    ini.settings.min = min
                    save()
                    sliders.hours[0] = ini.settings.hours
                    sliders.min[0] = ini.settings.min
                    gotofunc("SetTime")
                    sampAddChatMessage(script_name.." {FFFFFF}����������� �����: {dc4747}"..ini.settings.hours..":"..("%02d"):format(ini.settings.min), 0x73b461)
                end
            else
                sampAddChatMessage(script_name.." {FFFFFF}� ��� ����� ������ �� ��������� �������, �������: {dc4747}"..ini.commands.blockservertime, 0x73b461)
            end
            return false
        elseif cmd:find("^"..ini.commands.setweather.." .+") or cmd:find("^"..ini.commands.setweather.."$") then
            local weather = cmd:match(ini.commands.setweather.."(.+)")
            weather = tonumber(weather)
            if ini.settings.blockweather then
                if type(weather) ~= 'number' or weather < 0 or weather > 45 then
                    sampAddChatMessage(script_name.." {FFFFFF}�����������: {dc4747}"..ini.commands.setweather.." [0-45]", 0x73b461)
                    sampAddChatMessage(script_name.." {FFFFFF}������� ��������: {dc4747}"..ini.settings.weather, 0x73b461)
                else
                    ini.settings.weather = weather
                    save()
                    sliders.weather[0] = ini.settings.weather
                    gotofunc("SetWeather")
                    sampAddChatMessage(script_name.." {FFFFFF}����������� ������: {dc4747}"..ini.settings.weather, 0x73b461)
                end
            else
                sampAddChatMessage(script_name.." {FFFFFF}� ��� ����� ������ �� ��������� ������, �������: {dc4747}"..ini.commands.blockserverweather, 0x73b461)
            end
            return false
        elseif cmd:find("^"..ini.commands.blockservertime.."$") then
            ini.settings.blocktime = not ini.settings.blocktime
            save()
            checkboxes.blocktime[0] = ini.settings.blocktime
            gotofunc("BlockTime")
            gotofunc("SetTime")
            sampAddChatMessage(ini.settings.blocktime and script_name..' {FFFFFF}������ ������ {dc4747}�� ����� {FFFFFF} ������ ��� �����' or script_name..' {FFFFFF}������ ������ {73b461}����� {FFFFFF} ������ ��� �����', 0x73b461)
            return false
        elseif cmd:find("^"..ini.commands.blockserverweather.."$") then
            ini.settings.blockweather = not ini.settings.blockweather
            save()
            checkboxes.blockweather[0] = ini.settings.blockweather
            gotofunc("BlockWeather")
            gotofunc("SetWeather")
            sampAddChatMessage(ini.settings.blockweather and script_name..' {FFFFFF}������ ������ {dc4747}�� ����� {FFFFFF} ������ ��� ������' or script_name..' {FFFFFF}������ ������ {73b461}����� {FFFFFF} ������ ��� ������', 0x73b461)
            return false
        elseif cmd:find("^"..ini.commands.givemedist.."$") then
            ini.settings.givemedist = not ini.settings.givemedist
            sampAddChatMessage(ini.settings.givemedist and script_name..' {FFFFFF}����������� ������ ���������� {73b461}��������' or script_name..' {FFFFFF}����������� ������ ���������� {dc4747}���������', 0x73b461)
            save()
            gotofunc("GivemeDist")
            return false
        elseif cmd:find("^"..ini.commands.givemedistobj.."$") then
            ini.settings.givemedistobj = not ini.settings.givemedistobj
            sampAddChatMessage(ini.settings.givemedistobj and script_name..' {FFFFFF}����������� ������ ��������� ��������� �������� {dc4747}���������' or script_name..' {FFFFFF}����������� ������ ��������� ��������� �������� {73b461}��������', 0x73b461)
            save()
            gotofunc("SetDistObjects")
            return false
        elseif cmd:find("^"..ini.commands.drawdistance.." .+") or cmd:find("^"..ini.commands.drawdistance.."$") then
            local drawdist = cmd:match(ini.commands.drawdistance.." (.+)")
            drawdist = tonumber(drawdist)
            if ini.settings.givemedist then
                if type(drawdist) ~= 'number' or drawdist > 2000 or drawdist < 35 then
                    sampAddChatMessage(script_name.." {FFFFFF}�����������: {dc4747}"..ini.commands.drawdistance.." [35-2000]", 0x73b461)
                    sampAddChatMessage(script_name.." {FFFFFF}������� ��������: {dc4747}"..ini.settings.drawdist, 0x73b461)
                else
                    ini.settings.drawdist = ("%.1f"):format(drawdist)
                    save()
                    sliders.drawdist[0] = tonumber(ini.settings.drawdist)
                    sampAddChatMessage(script_name.." {FFFFFF}����������� ��������� ����������: {dc4747}"..ini.settings.drawdist, 0x73b461)
                end
            else
                sampAddChatMessage(script_name.." {FFFFFF}� ��� ��������� ����������� ������ ����������, �������� �: {dc4747}"..ini.commands.givemedist, 0x73b461)
            end
            return false
        elseif cmd:find("^"..ini.commands.drawdistanceair.." .+") or cmd:find("^"..ini.commands.drawdistanceair.."$") then
            local drawdistair = cmd:match(ini.commands.drawdistanceair.." (.+)")
            drawdistair = tonumber(drawdistair)
            if ini.settings.givemedist then
                if type(drawdistair) ~= 'number' or drawdistair > 2000 or drawdistair < 35 then
                    sampAddChatMessage(script_name.." {FFFFFF}�����������: {dc4747}"..ini.commands.drawdistanceair.." [35-2000]", 0x73b461)
                    sampAddChatMessage(script_name.." {FFFFFF}������� ��������: {dc4747}"..ini.settings.drawdistair, 0x73b461)
                else
                    ini.settings.drawdistair = ("%.1f"):format(drawdistair)
                    save()
                    sliders.drawdistair[0] = tonumber(ini.settings.drawdistair)
                    sampAddChatMessage(script_name.." {FFFFFF}��������� ���������� � ��������� ���������� ����������� ��: {dc4747}"..ini.settings.drawdistair, 0x73b461)
                end
            else
                sampAddChatMessage(script_name.." {FFFFFF}� ��� ��������� ����������� ������ ����������, �������� �: {dc4747}"..ini.commands.givemedist, 0x73b461)
            end
            return false
        elseif cmd:find("^"..ini.commands.drawdistancepara.." .+") or cmd:find("^"..ini.commands.drawdistancepara.."$") then
            local drawdistpara = cmd:match(ini.commands.drawdistancepara.." (.+)")
            drawdistpara = tonumber(drawdistpara)
            if ini.settings.givemedist then
                if type(drawdistpara) ~= 'number' or drawdistpara > 2000 or drawdistpara < 35 then
                    sampAddChatMessage(script_name.." {FFFFFF}�����������: {dc4747}"..ini.commands.drawdistancepara.." [35-2000]", 0x73b461)
                    sampAddChatMessage(script_name.." {FFFFFF}������� ��������: {dc4747}"..ini.settings.drawdistpara, 0x73b461)
                else
                    ini.settings.drawdistpara = ("%.1f"):format(drawdistpara)
                    save()
                    sliders.drawdistpara[0] = tonumber(ini.settings.drawdistpara)
                    sampAddChatMessage(script_name.." {FFFFFF}��������� ���������� ��� ������������� �������� ����������� ��: {dc4747}"..ini.settings.drawdistpara, 0x73b461)
                end
            else
                sampAddChatMessage(script_name.." {FFFFFF}� ��� ��������� ����������� ������ ����������, �������� �: {dc4747}"..ini.commands.givemedist, 0x73b461)
            end
            return false
        elseif cmd:find("^"..ini.commands.fogdistance.." .+") or cmd:find("^"..ini.commands.fogdistance.."$") then
            local fogdist = cmd:match(ini.commands.fogdistance.." (.+)")
            fogdist = tonumber(fogdist)
            if ini.settings.givemedist then
                if type(fogdist) ~= 'number' or fogdist > 2000 or fogdist < -1000 then
                    sampAddChatMessage(script_name.." {FFFFFF}�����������: {dc4747}"..ini.commands.fogdistance.." [-1000 - 2000]", 0x73b461)
                    sampAddChatMessage(script_name.." {FFFFFF}������� ��������: {dc4747}"..ini.settings.fog, 0x73b461)
                else
                    ini.settings.fog = ("%.1f"):format(fogdist)
                    save()
                    sliders.fog[0] = tonumber(ini.settings.fog)
                    memory.setfloat(13210352, ini.settings.fog, true)
                    sampAddChatMessage(script_name.." {FFFFFF}����������� ��������� ������: {dc4747}"..ini.settings.fog, 0x73b461)
                end
            else
                sampAddChatMessage(script_name.." {FFFFFF}� ��� ��������� ����������� ������ ����������, �������� �: {dc4747}"..ini.commands.givemedist, 0x73b461)
            end
            return false
        elseif cmd:find("^"..ini.commands.loddistance.." .+") or cmd:find("^"..ini.commands.loddistance.."$") then
            local loddist = cmd:match(ini.commands.loddistance.." (.+)")
            loddist = tonumber(loddist)
            if ini.settings.givemedist then
                if type(loddist) ~= 'number' or loddist > 1000 or loddist < 0 then
                    sampAddChatMessage(script_name.." {FFFFFF}�����������: {dc4747}"..ini.commands.loddistance.." [0-1000]", 0x73b461)
                    sampAddChatMessage(script_name.." {FFFFFF}������� ��������: {dc4747}"..ini.settings.lod, 0x73b461)
                else
                    ini.settings.lod = ("%.1f"):format(loddist)
                    save()
                    sliders.lod[0] = tonumber(ini.settings.lod)
                    gotofunc("LodDist")
                    sampAddChatMessage(script_name.." {FFFFFF}����������� ��������� �����: {dc4747}"..ini.settings.lod, 0x73b461)
                end
            else
                sampAddChatMessage(script_name.." {FFFFFF}� ��� ��������� ����������� ������ ����������, �������� �: {dc4747}"..ini.commands.givemedist, 0x73b461)
            end
            return false
        elseif cmd:find("^"..ini.commands.tiretracks.."$") then
            ini.effects_manager.tiretracks = not ini.effects_manager.tiretracks
            gotofunc("EffectsManager")
            save()
            sampAddChatMessage(ini.settings.tiretracks and script_name..' {FFFFFF}����� ��� {dc4747}���������' or script_name..' {FFFFFF}����� ��� {73b461}��������', 0x73b461)
            return false
        elseif cmd:find("^"..ini.commands.shownicks.."$") then
            ini.settings.shownicks = not ini.settings.shownicks
            gotofunc("ShowNICKS")
            save()
            sampAddChatMessage(ini.settings.shownicks and script_name..' {FFFFFF}���� ������� {dc4747}���������' or script_name..' {FFFFFF}���� ������� {73b461}��������', 0x73b461)
            return false
        elseif cmd:find("^"..ini.commands.showhp.."$") then
            ini.settings.showhp = not ini.settings.showhp
            save()
            sampAddChatMessage(ini.settings.showhp and script_name..' {FFFFFF}������� �� ������� {dc4747}���������' or script_name..' {FFFFFF}������� �� ������� {73b461}��������', 0x73b461)
            gotofunc("ShowHP")
            return false
        elseif cmd:find("^"..ini.commands.offradio.."$") then
            ini.settings.noradio = not ini.settings.noradio
            save()
            sampAddChatMessage(ini.settings.noradio and script_name..' {FFFFFF}����� � ���������� {73b461}��������' or script_name..' {FFFFFF}����� � ���������� {dc4747}���������', 0x73b461)
            gotofunc("NoRadio")
            return false
        elseif cmd:find("^"..ini.commands.showchat.."$") then
            preset["Other"]["showchat"] = not preset["Other"]["showchat"]
            sampAddChatMessage(preset["Other"]["showchat"] and script_name..' {FFFFFF}��� {dc4747}��������' or script_name..' {FFFFFF}��� {73b461}�������', 0x73b461)
            saveJson("preset")
            gotofunc("ShowCHAT")
            return false
        elseif cmd:find("^"..ini.commands.showhud.."$") then
            preset["Other"]["showhud"] = not preset["Other"]["showhud"]
            sampAddChatMessage(preset["Other"]["showhud"] and script_name..' {FFFFFF}HUD {dc4747}��������' or script_name..' {FFFFFF}HUD {73b461}�������', 0x73b461)
            saveJson("preset")
            gotofunc("ShowHUD")
            return false
        elseif cmd:find("^"..ini.commands.animmoney.." .+") or cmd:find("^"..ini.commands.animmoney.."$") then
            local param = cmd:match(ini.commands.animmoney.." (.+)")
            param = tonumber(param)
            if type(param) ~= 'number' or param > 2 or param < 0 then
                sampAddChatMessage(script_name.." {FFFFFF}�����������: {DC4747}"..ini.commands.animmoney.." [0-2]", 0x73b461)
            else
                ini.settings.animmoney = param
                save()
                ivar = new.int(ini.settings.animmoney)
                if ini.settings.animmoney == 0 then
                    sampAddChatMessage(script_name.." {FFFFFF}�������� ��������� ���-�� ����� �������� ��: {DC4747}�������", 0x73b461)
                elseif ini.settings.animmoney == 1 then
                    sampAddChatMessage(script_name.." {FFFFFF}�������� ��������� ���-�� ����� �������� ��: {DC4747}��� ��������", 0x73b461)
                elseif ini.settings.animmoney == 2 then
                    sampAddChatMessage(script_name.." {FFFFFF}�������� ��������� ���-�� ����� �������� ��: {DC4747}�����������", 0x73b461)
                end
            end
            return false
        elseif cmd:find("^"..ini.commands.fpslock.."$") then
            ini.settings.unlimitfps = not ini.settings.unlimitfps
            sampAddChatMessage(ini.settings.unlimitfps and script_name..' {FFFFFF}FPS unlock {73b461}�������' or script_name..' {FFFFFF}FPS unlock {dc4747}��������', 0x73b461)
            save()
            gotofunc("FPSUnlock")
            return false
        elseif cmd:find("^"..ini.commands.postfx.."$") then
            ini.effects_manager.postfx = not ini.effects_manager.postfx
            sampAddChatMessage(ini.effects_manager.postfx and script_name..' {FFFFFF}����-��������� {dc4747}���������' or script_name..' {FFFFFF}����-��������� {73b461}��������', 0x73b461)
            save()
            gotofunc("EffectsManager")
            return false
        elseif cmd:find("^"..ini.commands.antiblockedplayer.."$") then
            ini.settings.antiblockedplayer = not ini.settings.antiblockedplayer
            checkboxes.antiblockedplayer[0] = ini.settings.antiblockedplayer
            save()
            sampAddChatMessage(ini.settings.antiblockedplayer and script_name..' {FFFFFF}����������� ����������� � ������ ������� ��� ������ {73b461}��������' or script_name..' {FFFFFF}����������� ����������� � ������ ������� ��� ������ {dc4747}���������', 0x73b461)
            return false
        elseif cmd:find("^"..ini.commands.chatopenfix.."$") then
            ini.settings.chatt = not ini.settings.chatt
            checkboxes.chatt[0] = ini.settings.chatt
            save()
            sampAddChatMessage(ini.settings.chatt and script_name..' {FFFFFF}�������� ���� �� � {73b461}��������' or script_name..' {FFFFFF}�������� ���� �� � {dc4747}���������', 0x73b461)
            return false
        elseif cmd:find("^"..ini.commands.nolimitmoneyhud.."$") then
            preset["Money"]["nolimitmoneyhud"] = not preset["Money"]["nolimitmoneyhud"]
            saveJson("preset")
            sampAddChatMessage(preset["Money"]["nolimitmoneyhud"] and script_name..' {FFFFFF}����� �� ���������� ����� � ���� {73b461}�������' or script_name..' {FFFFFF}����� �� ���������� ����� � ���� {dc4747}��������', 0x73b461)
            gotofunc("NoLimitMoneyHud")
            return false
        elseif cmd:find("^"..ini.commands.autocleaner.."$") then
            ini.cleaner.autoclean = not ini.cleaner.autoclean
            save()
            sampAddChatMessage((script_name.."{FFFFFF} �������������� ������� ������ %s"):format(ini.cleaner.autoclean and "{73b461}��������" or "{dc4747}���������"), 0x73b461)
            return false
        elseif cmd:find("^"..ini.commands.cleanmemory.."$") then
            gotofunc("CleanMemory")
            return false
        elseif cmd:find("^"..ini.commands.cleaninfo.."$") then
            ini.cleaner.cleaninfo = not ini.cleaner.cleaninfo
            save()
            checkboxes.cleaninfo[0] = ini.cleaner.cleaninfo
            sampAddChatMessage(ini.cleaner.cleaninfo and script_name..' {FFFFFF}��������� �� ������� ������ {73b461}��������' or script_name..' {FFFFFF}��������� �� ������� ������ {dc4747}���������', 0x73b461)
            return false
        elseif cmd:find("^"..ini.commands.setmbforautocleaner.." .+") or cmd:find("^"..ini.commands.setmbforautocleaner.."$") then
            local setccl = cmd:match(ini.commands.setmbforautocleaner.." (.+)")
            setccl = tonumber(setccl)
            if type(setccl) ~= 'number' or setccl > 3000 or setccl < 0 then
                sampAddChatMessage(script_name.." {FFFFFF}�����������: {dc4747}"..ini.commands.setmbforautocleaner.." [0-3000 ��]", 0x73b461)
                sampAddChatMessage(script_name.." {FFFFFF}������� ��������: {dc4747}"..ini.cleaner.limit.." ��", 0x73b461)
            else
                ini.cleaner.limit = setccl
                save()
                sampAddChatMessage(script_name.." {FFFFFF}����-������� ������ ����������� ��: {dc4747}"..ini.cleaner.limit.." ��", 0x73b461)
            end
            return false
        elseif cmd:find("^"..ini.commands.brightness.." .+") or cmd:find("^"..ini.commands.brightness.."$") then
            local param = cmd:match(ini.commands.brightness.." (.+)")
            param = tonumber(param)
            if type(param) ~= 'number' or param > 600 or param < 0 then
                sampAddChatMessage(script_name.." {FFFFFF}�����������: {dc4747}"..ini.commands.brightness.." [0-600]", 0x73b461)
                sampAddChatMessage(script_name.." {FFFFFF}������� ��������: {dc4747}"..ini.settings.brightness, 0x73b461)
            else
                ini.settings.brightness = param
                save()
                sliders.brightness[0] = ini.settings.brightness
                gotofunc("SetBrightness")
                sampAddChatMessage(script_name.." {FFFFFF}������� ����������� ��: {dc4747}"..ini.settings.brightness, 0x73b461)
            end
            return false
        elseif cmd:find("^"..ini.commands.ntgs.." .+") or cmd:find("^"..ini.commands.ntgs.."$") then
            local param = cmd:match(ini.commands.ntgs.." (.+)")
            param = tonumber(param)
            if ini.settings.givemedistnames then
                if memory.read(0xFFFC90, 4, true) ~= 697076735 then
                    if type(param) ~= 'number' or param > tonumber(memory.getfloat(0xFFFC90, true)) or param < 0 then
                        sampAddChatMessage(script_name.." {FFFFFF}�����������: {dc4747}"..ini.commands.ntgs.." [0-"..tonumber(memory.getfloat(0xFFFC90, true)).."]", 0x73b461)
                        sampAddChatMessage(ini.settings.nickdistance >= tonumber(memory.getfloat(0xFFFC90, true)) and script_name.." {FFFFFF}������� ��������: {dc4747}��������� ��������" or script_name.." {FFFFFF}������� ��������: {dc4747}"..ini.settings.nickdistance, 0x73b461)
                    else
                        ini.settings.nickdistance = param
                        save()
                        sliders.nickdistance[0] = ini.settings.nickdistance
                        gotofunc("SetDistNickNames")
                        sampAddChatMessage(script_name.." {FFFFFF}��������� ���������� ��������� ����������� ��: {dc4747}"..ini.settings.nickdistance, 0x73b461)
                    end
                else
                    sampAddChatMessage(script_name.." {FFFFFF}�� �������� ��������� �������. {dc4747}���������������� � �������!", 0x73b461)
                end
            else
                sampAddChatMessage(script_name.." {FFFFFF}� ��� �� �������� �������. �������: {dc4747}/givemedistnames", 0x73b461)
            end
            return false
        elseif cmd:find("^"..ini.commands.givemedistnames.."$") then
            ini.settings.givemedistnames = not ini.settings.givemedistnames
            save()
            sampAddChatMessage(ini.settings.givemedistnames and script_name..' {FFFFFF}����������� ������ ���������� ��������� {73b461}��������' or script_name..' {FFFFFF}����������� ������ ���������� ��������� {dc4747}���������', 0x73b461)
            gotofunc("SetDistNickNames")
            return false
        elseif cmd:find("^"..ini.commands.nobirds.."$") then
            ini.settings.nobirds = not ini.settings.nobirds
            save()
            sampAddChatMessage(ini.settings.nobirds and script_name..' {FFFFFF}����� {dc4747}���������' or script_name..' {FFFFFF}����� {73b461}��������', 0x73b461)
            gotofunc("NoBirds")
            return false
        elseif cmd:find("^"..ini.commands.fixtimecyc.."$") then
            ini.fixtimecyc.active = not ini.fixtimecyc.active
            sampAddChatMessage(ini.fixtimecyc.active and script_name..' {FFFFFF}����������� ������� ��������� ��� ����������� ����-��������� {73b461}��������' or script_name..' {FFFFFF}����������� ������� ��������� ��� ����������� ����-��������� {dc4747}���������', 0x73b461)
            save()
            checkboxes.fixtimecyc[0] = ini.fixtimecyc.active
            gotofunc("FixTimecyc")
            return false
        elseif cmd:find("^"..ini.commands.aamb.." .+") or cmd:find("^"..ini.commands.aamb.."$") then
            local param = cmd:match(ini.commands.aamb.." (.+)")
            param = tonumber(param)
            if ini.fixtimecyc.active then
                if type(param) ~= 'number' or param < -1.000 or param > 1.000 then
                    sampAddChatMessage(script_name.." {FFFFFF}�����������: {dc4747}"..ini.commands.aamb.." [�� -1.000 �� 1.000]", 0x73b461)
                    sampAddChatMessage(script_name.." {FFFFFF}������� ��������: {dc4747}"..ini.fixtimecyc.allambient, 0xd73b461)
                else
                    ini.fixtimecyc.allambient = param
                    save()
                    gotofunc("FixTimecyc")
                    sampAddChatMessage(script_name.." {FFFFFF}����� ��������� ����������� ��: {dc4747}"..ini.fixtimecyc.allambient, 0xd73b461)
                end
            else
                sampAddChatMessage(script_name.." {FFFFFF}� ��� ��������� ����������� ���������, �������� ���: {dc4747}"..ini.commands.fixtimecyc, 0x73b461)
            end
            return false
        elseif cmd:find("^"..ini.commands.oamb.." .+") or cmd:find("^"..ini.commands.oamb.."$") then
            local param = cmd:match(ini.commands.oamb.." (.+)")
            param = tonumber(param)
            if ini.fixtimecyc.active then
                if type(param) ~= 'number' or param < -1.000 or param > 1.000 then
                    sampAddChatMessage(script_name.." {FFFFFF}�����������: {dc4747}"..ini.commands.oamb.." [�� -1.000 �� 1.000]", 0x73b461)
                    sampAddChatMessage(script_name.." {FFFFFF}������� ��������: {dc4747}"..ini.fixtimecyc.objambient, 0xd73b461)
                else
                    ini.fixtimecyc.objambient = param
                    save()
                    gotofunc("FixTimecyc")
                    sampAddChatMessage(script_name.." {FFFFFF}��������� �������� � ����� ����������� ��: {dc4747}"..ini.fixtimecyc.objambient, 0xd73b461)
                end
            else
                sampAddChatMessage(script_name.." {FFFFFF}� ��� ��������� ����������� ���������, �������� ���: {dc4747}"..ini.commands.fixtimecyc, 0x73b461)
            end
            return false
        elseif cmd:find("^"..ini.commands.wamb.." .+") or cmd:find("^"..ini.commands.wamb.."$") then
            local R = cmd:match(ini.commands.wamb.." (.+)%s.+%s.+")
            local G = cmd:match(ini.commands.wamb.." .+%s(.+)%s.+")
            local B = cmd:match(ini.commands.wamb..".+%s.+%s(.+)")
            R = tonumber(R)
            G = tonumber(G)
            B = tonumber(B)
            if ini.fixtimecyc.active then
                if type(R) ~= 'number' or type(G) ~= 'number' or type(B) ~= 'number' or R > 1.000 or R < -1.000 or G > 1.000 or G < -1.000 or B > 1.000 or B < -1.000 then
                    sampAddChatMessage(script_name.." {FFFFFF}�����������: {dc4747}"..ini.commands.wamb.." [R �� -1.000 �� 1.000] [G �� -1.000 �� 1.000] [B �� -1.000 �� 1.000]", 0xd73b461)
                    sampAddChatMessage(script_name.." {FFFFFF}������� ���������: {dc4747}R: "..ini.fixtimecyc.worldambientR.." G: "..ini.fixtimecyc.worldambientG.." B: "..ini.fixtimecyc.worldambientB, 0xd73b461)
                else
                    ini.fixtimecyc.worldambientR = R
                    ini.fixtimecyc.worldambientG = G
                    ini.fixtimecyc.worldambientB = B
                    save()
                    gotofunc("FixTimecyc")
                    sampAddChatMessage(script_name.." {FFFFFF}��������� ���� ����������� ��: {dc4747}R: "..ini.fixtimecyc.worldambientR.." G: "..ini.fixtimecyc.worldambientG.." B: "..ini.fixtimecyc.worldambientB, 0xd73b461)
                end
            else
                sampAddChatMessage(script_name.." {FFFFFF}� ��� ��������� ����������� ���������, �������� ���: {dc4747}"..ini.commands.fixtimecyc, 0x73b461)
            end
            return false
        elseif cmd:find("^"..ini.commands.editcrosshair.." .+") or cmd:find("^"..ini.commands.editcrosshair.."$") then
            local sizecr = cmd:match(ini.commands.editcrosshair.." (.+)")
            sizecr = tonumber(sizecr)
            if type(sizecr) ~= 'number' or sizecr > 5.0 or sizecr < 0.0 then
                sampAddChatMessage(script_name.." {FFFFFF}�����������: {dc4747}"..ini.commands.editcrosshair.." [0.0 - 5.0]", 0x73b461)
                sampAddChatMessage(script_name.." {FFFFFF}������� ��������: {dc4747}"..preset["Crosshair"]["crosshairSize"], 0x73b461)
            else
                preset["Crosshair"]["crosshairSize"] = sizecr
                saveJson("preset")
                sliders.crosshairSize[0] = preset["Crosshair"]["crosshairSize"]
                gotofunc("EditCrosshair")
                sampAddChatMessage(script_name.." {FFFFFF}���������� ������ �������: {dc4747}"..preset["Crosshair"]["crosshairSize"], 0x73b461)
            end
            return false
        elseif cmd:find("^"..ini.commands.shadowedit.."$") then
            ini.settings.shadowedit = not ini.settings.shadowedit
            save()
            sampAddChatMessage(ini.settings.shadowedit and script_name..' {FFFFFF}����������� ������ ���� {73b461}��������' or script_name..' {FFFFFF}����������� ������ ���� {dc4747}���������', 0x73b461)
            gotofunc("ShadowEdit")
            return false
        elseif cmd:find("^"..ini.commands.nocloudbig.."$") then
            ini.effects_manager.nocloudbig = not ini.effects_manager.nocloudbig
            save()
            sampAddChatMessage(ini.effects_manager.nocloudbig and script_name..' {FFFFFF}������� ������ {dc4747}���������' or script_name..' {FFFFFF}������� ������ {73b461}��������', 0x73b461)
            gotofunc("EffectsManager")
            return false
        elseif cmd:find("^"..ini.commands.nocloudsmall.."$") then
            ini.effects_manager.nocloudsmall = not ini.effects_manager.nocloudsmall
            save()
            sampAddChatMessage(ini.effects_manager.nocloudsmall and script_name..' {FFFFFF}������ ������ {dc4747}���������' or script_name..' {FFFFFF}������ ������ {73b461}��������', 0x73b461)
            gotofunc("EffectsManager")
            return false
        elseif cmd:find("^"..ini.commands.nocloudhorizont.."$") then
            ini.effects_manager.nocloudhorizont = not ini.effects_manager.nocloudhorizont
            save()
            sampAddChatMessage(ini.effects_manager.nocloudhorizont and script_name..' {FFFFFF}������ �� ��������� {dc4747}���������' or script_name..' {FFFFFF}������ �� ��������� {73b461}��������', 0x73b461)
            gotofunc("EffectsManager")
            return false
        elseif cmd:find("^"..ini.commands.noshadows.."$") then
            ini.settings.noshadows = not ini.settings.noshadows
            save()
            sampAddChatMessage(ini.settings.noshadows and script_name..' {FFFFFF}���� {dc4747}���������' or script_name..' {FFFFFF}���� {73b461}��������', 0x73b461)
            gotofunc("NoShadows")
            return false
        elseif cmd:find("^"..ini.commands.fixcrosshair.."$") then
            ini.settings.fixcrosshair = not ini.settings.fixcrosshair
            save()
            sampAddChatMessage(ini.settings.fixcrosshair and script_name..' {FFFFFF}����������� ����� ����� �� ������� {73b461}��������' or script_name..' {FFFFFF}����������� ����� ����� �� ������� {dc4747}���������', 0x73b461)
            gotofunc("FixCrosshair")
            return false
        elseif cmd:find("^"..ini.commands.intrun.."$") then
            ini.settings.intrun = not ini.settings.intrun
            save()
            sampAddChatMessage(ini.settings.intrun and script_name..' {FFFFFF}����������� ���� � ���������� {73b461}��������' or script_name..' {FFFFFF}����������� ���� � ���������� {dc4747}���������', 0x73b461)
            gotofunc("InteriorRun")
            return false
        elseif cmd:find("^"..ini.commands.waterfixquadro.."$") then
            ini.settings.waterfixquadro = not ini.settings.waterfixquadro
            save()
            sampAddChatMessage(ini.settings.waterfixquadro and script_name..' {FFFFFF}����������� ���������� ���� {73b461}��������' or script_name..' {FFFFFF}����������� ���������� ���� {dc4747}���������', 0x73b461)
            gotofunc("FixWaterQuadro")
            return false
        elseif cmd:find("^"..ini.commands.longarmfix.."$") then
            ini.settings.longarmfix = not ini.settings.longarmfix
            save()
            sampAddChatMessage(ini.settings.longarmfix and script_name..' {FFFFFF}����������� ������� ��� ��� ���� �� 2-� �������� ���������� {73b461}��������' or script_name..' {FFFFFF}����������� ������� ��� ��� ���� �� 2-� �������� ���������� {dc4747}���������', 0x73b461)
            gotofunc("FixLongArm")
            return false
        elseif cmd:find("^"..ini.commands.fixblackroads.."$") then
            ini.settings.fixblackroads = not ini.settings.fixblackroads
            save()
            sampAddChatMessage(ini.settings.fixblackroads and script_name..' {FFFFFF}����������� ������ ����� {73b461}��������' or script_name..' {FFFFFF}����������� ������ ����� {dc4747}���������', 0x73b461)
            gotofunc("FixBlackRoads")
            return false
        elseif cmd:find("^"..ini.commands.sensfix.."$") then
            ini.settings.sensfix = not ini.settings.sensfix
            save()
            sampAddChatMessage(ini.settings.sensfix and script_name..' {FFFFFF}����������� ���������������� ����� �� ���� X � Y {73b461}��������' or script_name..' {FFFFFF}����������� ���������������� ����� �� ���� X � Y {dc4747}���������', 0x73b461)
            gotofunc("FixSensitivity")
            return false
        elseif cmd:find("^"..ini.commands.audiostream.."$") then
            ini.settings.audiostream = not ini.settings.audiostream
            save()
            sampAddChatMessage(ini.settings.audiostream and script_name..' {FFFFFF}���������� {73b461}�������' or script_name..' {FFFFFF}���������� {dc4747}��������', 0x73b461)
            gotofunc("AudioStream")
            return false
        elseif cmd:find("^"..ini.commands.intmusic.."$") then
            ini.settings.intmusic = not ini.settings.intmusic
            save()
            sampAddChatMessage(ini.settings.intmusic and script_name..' {FFFFFF}������ � ���������� {73b461}��������' or script_name..' {FFFFFF}������ � ���������� {dc4747}���������', 0x73b461)
            gotofunc("InteriorMusic")
            return false
        elseif cmd:find("^"..ini.commands.sounds.."$") then
            ini.settings.sounds = not ini.settings.sounds
            save()
            sampAddChatMessage(ini.settings.sounds and script_name..' {FFFFFF}����� ���� {73b461}��������' or script_name..' {FFFFFF}����� ���� {dc4747}���������', 0x73b461)
            gotofunc("NoSounds")
            return false
        elseif cmd:find("^"..ini.commands.noplaneline.."$") then
            ini.effects_manager.noplaneline = not ini.effects_manager.noplaneline
            save()
            sampAddChatMessage(ini.effects_manager.noplaneline and script_name..' {FFFFFF}������ �� ��������� �� ���� {dc4747}���������' or script_name..' {FFFFFF}������ �� ��������� �� ���� {73b461}��������', 0x73b461)
            gotofunc("EffectsManager")
            return false
        elseif cmd:find("^"..ini.commands.sunfix.."$") then
            ini.settings.sunfix = not ini.settings.sunfix
            save()
            sampAddChatMessage(ini.settings.sunfix and script_name..' {FFFFFF}������ {73b461}��������' or script_name..' {FFFFFF}������ {dc4747}���������', 0x73b461)
            gotofunc("SunFix")
            return false
        elseif cmd:find("^"..ini.commands.targetblip.."$") then
            ini.settings.targetblip = not ini.settings.targetblip
            save()
            sampAddChatMessage(ini.settings.targetblip and script_name..' {FFFFFF}������ �� ������� {73b461}�������' or script_name..' {FFFFFF}������ �� ������� {dc4747}��������', 0x73b461)
            gotofunc("TargetBlip")
            return false
        elseif cmd:find("^"..ini.commands.radarfix.."$")then
            ini.settings.radarfix = not ini.settings.radarfix
            save()
            sampAddChatMessage(ini.settings.radarfix and script_name..' {FFFFFF}�������� ������ {73b461}��������' or script_name..' {FFFFFF}�������� ������ {dc4747}���������', 0x73b461)
            gotofunc("InterfaceElementEditor")
            return false
        elseif cmd:find("^"..ini.commands.dual_monitor_fix.."$")then
            ini.settings.dual_monitor_fix = not ini.settings.dual_monitor_fix
            save()
            checkboxes.dual_monitor_fix[0] = ini.settings.dual_monitor_fix
            sampAddChatMessage(ini.settings.dual_monitor_fix and script_name..' {FFFFFF}����������� ������ ����� �� ������ ������� {73b461}��������' or script_name..' {FFFFFF}����������� ������ ����� �� ������ ������� {dc4747}���������', 0x73b461)
            return false
        elseif cmd:find("^"..ini.commands.radarWidth.." .+") or cmd:find("^"..ini.commands.radarWidth.."$")then
            local param = cmd:match(ini.commands.radarWidth.." (.+)")
            param = tonumber(param)
            if type(param) ~= 'number' then
                sampAddChatMessage(script_name.." {FFFFFF}�����������: {dc4747}"..ini.commands.radarWidth.." [�����]", 0x73b461)
                sampAddChatMessage(script_name.." {FFFFFF}������� ��������: {dc4747}"..ini.settings.radarWidth, 0x73b461)
            else
                ini.settings.radarWidth = param
                save()
                sliders.radarw[0] = ini.settings.radarWidth
                gotofunc("InterfaceElementEditor")
                sampAddChatMessage(script_name.." {FFFFFF}������ ������ ����������� ��: {dc4747}"..ini.settings.radarWidth, 0x73b461)
            end
            return false
        elseif cmd:find("^"..ini.commands.radarHeight.." .+") or cmd:find("^"..ini.commands.radarHeight.."$")then
            local param = cmd:match(ini.commands.radarHeight.." (.+)")
            param = tonumber(param)
            if type(param) ~= 'number' then
                sampAddChatMessage(script_name.." {FFFFFF}�����������: {dc4747}"..ini.commands.radarHeight.." [�����]", 0x73b461)
                sampAddChatMessage(script_name.." {FFFFFF}������� ��������: {dc4747}"..ini.settings.radarHeight, 0x73b461)
            else
                ini.settings.radarHeight = param
                save()
                sliders.radarh[0] = ini.settings.radarHeight
                gotofunc("InterfaceElementEditor")
                sampAddChatMessage(script_name.." {FFFFFF}������ ������ ����������� ��: {dc4747}"..ini.settings.radarHeight, 0x73b461)
            end
            return false
        elseif cmd:find("^"..ini.commands.radarx.." .+") or cmd:find("^"..ini.commands.radarx.."$")then
            local param = cmd:match(ini.commands.radarx.." (.+)")
            param = tonumber(param)
            if type(param) ~= 'number' then
                sampAddChatMessage(script_name.." {FFFFFF}�����������: {dc4747}"..ini.commands.radarx.." [�����]", 0x73b461)
                sampAddChatMessage(script_name.." {FFFFFF}������� ��������: {dc4747}"..ini.settings.radarPosX, 0x73b461)
            else
                ini.settings.radarPosX = param
                save()
                sliders.radarposx[0] = ini.settings.radarPosX
                gotofunc("InterfaceElementEditor")
                sampAddChatMessage(script_name.." {FFFFFF}������� ������ �� X ����������� ��: {dc4747}"..ini.settings.radarPosX, 0x73b461)
            end
            return false
        elseif cmd:find("^"..ini.commands.radary.." .+") or cmd:find("^"..ini.commands.radary.."$")then
            local param = cmd:match(ini.commands.radary.." (.+)")
            param = tonumber(param)
            if type(param) ~= 'number' then
                sampAddChatMessage(script_name.." {FFFFFF}�����������: {dc4747}"..ini.commands.radary.." [�����]", 0x73b461)
                sampAddChatMessage(script_name.." {FFFFFF}������� ��������: {dc4747}"..ini.settings.radarPosY, 0x73b461)
            else
                ini.settings.radarPosY = param
                save()
                sliders.radarposy[0] = ini.settings.radarPosY
                gotofunc("InterfaceElementEditor")
                sampAddChatMessage(script_name.." {FFFFFF}������� ������ �� Y ����������� ��: {dc4747}"..ini.settings.radarPosY, 0x73b461)
            end
            return false
        elseif cmd:find("^"..ini.commands.ugenrl.."$")then
            ini.ugenrl_main.enable = not ini.ugenrl_main.enable
            checkboxes.ugenrl_enable[0] = ini.ugenrl_main.enable
            if ini.ugenrl_main.enable then
                ini.settings.sounds = false
            else
                ini.settings.sounds = true
            end
            save()
            gotofunc("NoSounds")
            sampAddChatMessage(ini.ugenrl_main.enable and script_name.." {FFFFFF}Ultimate Genrl {73b461}�������" or script_name.." {FFFFFF}Ultimate Genrl {dc4747}��������", 0x73b461)
            return false
        elseif cmd:find("^"..ini.commands.uds.." .+") or cmd:find("^"..ini.commands.uds.."$")then
            local param = cmd:match(ini.commands.uds.." (.+)")
            param = tonumber(param)
            if type(param) ~= 'number' or param < 1 or param > tonumber(#deagleSounds) then
                sampAddChatMessage(script_name.." {FFFFFF}�����������: {dc4747}"..ini.commands.uds.." [1-"..#deagleSounds.."]", 0x73b461)
                sampAddChatMessage(script_name.." {FFFFFF}������� ��������: {dc4747}"..getNumberSounds(24, deagleSounds), 0x73b461)
            else
                changeSound(24, deagleSounds[param])
                save()
                sampAddChatMessage(script_name.." {FFFFFF}���� deagle ���������� ��: {dc4747}"..param, 0x73b461)
            end
            return false
        elseif cmd:find("^"..ini.commands.uss.." .+") or cmd:find("^"..ini.commands.uss.."$")then
            local param = cmd:match(ini.commands.uss.." (.+)")
            param = tonumber(param)
            if type(param) ~= 'number' or param < 1 or param > tonumber(#shotgunSounds) then
                sampAddChatMessage(script_name.." {FFFFFF}�����������: {dc4747}"..ini.commands.uss.." [1-"..#shotgunSounds.."]", 0x73b461)
                sampAddChatMessage(script_name.." {FFFFFF}������� ��������: {dc4747}"..getNumberSounds(25, shotgunSounds), 0x73b461)
            else
                changeSound(25, shotgunSounds[param])
                save()
                sampAddChatMessage(script_name.." {FFFFFF}���� shotgun ���������� ��: {dc4747}"..param, 0x73b461)
            end
            return false
        elseif cmd:find("^"..ini.commands.ums.." .+") or cmd:find("^"..ini.commands.ums.."$")then
            local param = cmd:match(ini.commands.ums.." (.+)")
            param = tonumber(param)
            if type(param) ~= 'number' or param < 1 or param > tonumber(#m4Sounds) then
                sampAddChatMessage(script_name.." {FFFFFF}�����������: {dc4747}"..ini.commands.ums.." [1-"..#m4Sounds.."]", 0x73b461)
                sampAddChatMessage(script_name.." {FFFFFF}������� ��������: {dc4747}"..getNumberSounds(31, m4Sounds), 0x73b461)
            else
                changeSound(31, m4Sounds[param])
                save()
                sampAddChatMessage(script_name.." {FFFFFF}���� m4 ���������� ��: {dc4747}"..param, 0x73b461)
            end
            return false
        elseif cmd:find("^"..ini.commands.urs.." .+") or cmd:find("^"..ini.commands.urs.."$")then
            local param = cmd:match(ini.commands.urs.." (.+)")
            param = tonumber(param)
            if type(param) ~= 'number' or param < 1 or param > tonumber(#rifleSounds) then
                sampAddChatMessage(script_name.." {FFFFFF}�����������: {dc4747}"..ini.commands.urs.." [1-"..#rifleSounds.."]", 0x73b461)
                sampAddChatMessage(script_name.." {FFFFFF}������� ��������: {dc4747}"..getNumberSounds(33, rifleSounds), 0x73b461)
            else
                changeSound(33, rifleSounds[param])
                save()
                sampAddChatMessage(script_name.." {FFFFFF}���� rifle ���������� ��: {dc4747}"..param, 0x73b461)
            end
            return false
        elseif cmd:find("^"..ini.commands.uuzi.." .+") or cmd:find("^"..ini.commands.uuzi.."$")then
            local param = cmd:match(ini.commands.uuzi.." (.+)")
            param = tonumber(param)
            if type(param) ~= 'number' or param < 1 or param > tonumber(#uziSounds) then
                sampAddChatMessage(script_name.." {FFFFFF}�����������: {dc4747}"..ini.commands.uuzi.." [1-"..#uziSounds.."]", 0x73b461)
                sampAddChatMessage(script_name.." {FFFFFF}������� ��������: {dc4747}"..getNumberSounds(28, uziSounds), 0x73b461)
            else
                changeSound(28, uziSounds[param])
                save()
                sampAddChatMessage(script_name.." {FFFFFF}���� uzi ���������� ��: {dc4747}"..param, 0x73b461)
            end
            return false
        elseif cmd:find("^"..ini.commands.ump5.." .+") or cmd:find("^"..ini.commands.ump5.."$")then
            local param = cmd:match(ini.commands.ump5.." (.+)")
            param = tonumber(param)
            if type(param) ~= 'number' or param < 1 or param > tonumber(#mp5Sounds) then
                sampAddChatMessage(script_name.." {FFFFFF}�����������: {dc4747}"..ini.commands.ump5.." [1-"..#mp5Sounds.."]", 0x73b461)
                sampAddChatMessage(script_name.." {FFFFFF}������� ��������: {dc4747}"..getNumberSounds(29, mp5Sounds), 0x73b461)
            else
                changeSound(29, mp5Sounds[param])
                save()
                sampAddChatMessage(script_name.." {FFFFFF}���� mp5 ���������� ��: {dc4747}"..param, 0x73b461)
            end
            return false
        elseif cmd:find("^"..ini.commands.ubs.." .+") or cmd:find("^"..ini.commands.ubs.."$")then
            local param = cmd:match(ini.commands.ubs.." (.+)")
            param = tonumber(param)
            if type(param) ~= 'number' or param < 1 or param > tonumber(#hitSounds) then
                sampAddChatMessage(script_name.." {FFFFFF}�����������: {dc4747}"..ini.commands.ubs.." [1-"..#hitSounds.."]", 0x73b461)
                sampAddChatMessage(script_name.." {FFFFFF}������� ��������: {dc4747}"..getNumberSounds("hit", hitSounds), 0x73b461)
            else
                changeSound("hit", hitSounds[param])
                save()
                sampAddChatMessage(script_name.." {FFFFFF}���� ��������� ���������� ��: {dc4747}"..param, 0x73b461)
            end
            return false
        elseif cmd:find("^"..ini.commands.ups.." .+") or cmd:find("^"..ini.commands.ups.."$")then
            local param = cmd:match(ini.commands.ups.." (.+)")
            param = tonumber(param)
            if type(param) ~= 'number' or param < 1 or param > tonumber(#painSounds) then
                sampAddChatMessage(script_name.." {FFFFFF}�����������: {dc4747}"..ini.commands.ups.." [1-"..#painSounds.."]", 0x73b461)
                sampAddChatMessage(script_name.." {FFFFFF}������� ��������: {dc4747}"..getNumberSounds("pain", painSounds), 0x73b461)
            else
                changeSound("pain", painSounds[param])
                save()
                sampAddChatMessage(script_name.." {FFFFFF}���� ��������� ���������� ��: {dc4747}"..param, 0x73b461)
            end
            return false
        elseif cmd:find("^"..ini.commands.ugd.." .+") or cmd:find("^"..ini.commands.ugd.."$")then
            local param = cmd:match(ini.commands.ugd.." (.+)")
            param = tonumber(param)
            if type(param) ~= 'number' or param < 0 or param > 100 then
                sampAddChatMessage(script_name.." {FFFFFF}�����������: {dc4747}"..ini.commands.ugd.." [0-100]", 0x73b461)
                sampAddChatMessage(script_name.." {FFFFFF}������� ��������: {dc4747}"..ini.ugenrl_main.enemyWeaponDist, 0x73b461)
            else
                ini.ugenrl_main.enemyWeaponDist = param
                save()
                sampAddChatMessage(script_name.." {FFFFFF}��������� ������ ��������� ������� ����������� ��: {dc4747}"..ini.ugenrl_main.enemyWeaponDist, 0x73b461)
            end
            return false
        elseif cmd:find("^"..ini.commands.ugvw.." .+") or cmd:find("^"..ini.commands.ugvw.."$")then
            local param = cmd:match(ini.commands.ugvw.." (.+)")
            param = tonumber(param)
            if type(param) ~= 'number' or param < 0.00 or param > 1.00 then
                sampAddChatMessage(script_name.." {FFFFFF}�����������: {dc4747}"..ini.commands.ugvw.." [0.0-1.00]", 0x73b461)
                sampAddChatMessage(script_name.." {FFFFFF}������� ��������: {dc4747}"..ini.ugenrl_volume.weapon, 0x73b461)
            else
                ini.ugenrl_volume.weapon = param
                save()
                sampAddChatMessage(script_name.." {FFFFFF}��������� ����� ��������� ����������� ��: {dc4747}"..ini.ugenrl_volume.weapon, 0x73b461)
            end
            return false
        elseif cmd:find("^"..ini.commands.ugvh.." .+") or cmd:find("^"..ini.commands.ugvh.."$")then
            local param = cmd:match(ini.commands.ugvh.." (.+)")
            param = tonumber(param)
            if type(param) ~= 'number' or param < 0.00 or param > 1.00 then
                sampAddChatMessage(script_name.." {FFFFFF}�����������: {dc4747}"..ini.commands.ugvh.." [0.0-1.00]", 0x73b461)
                sampAddChatMessage(script_name.." {FFFFFF}������� ��������: {dc4747}"..ini.ugenrl_volume.hit, 0x73b461)
            else
                ini.ugenrl_volume.hit = param
                save()
                sampAddChatMessage(script_name.." {FFFFFF}��������� ����� ��������� ����������� ��: {dc4747}"..ini.ugenrl_volume.hit, 0x73b461)
            end
            return false
        elseif cmd:find("^"..ini.commands.ugvp.." .+") or cmd:find("^"..ini.commands.ugvp.."$")then
            local param = cmd:match(ini.commands.ugvp.." (.+)")
            param = tonumber(param)
            if type(param) ~= 'number' or param < 0.00 or param > 1.00 then
                sampAddChatMessage(script_name.." {FFFFFF}�����������: {dc4747}"..ini.commands.ugvp.." [0.0-1.00]", 0x73b461)
                sampAddChatMessage(script_name.." {FFFFFF}������� ��������: {dc4747}"..ini.ugenrl_volume.pain, 0x73b461)
            else
                ini.ugenrl_volume.pain = param
                save()
                sampAddChatMessage(script_name.." {FFFFFF}��������� ����� ���� ����������� ��: {dc4747}"..ini.ugenrl_volume.pain, 0x73b461)
            end
            return false
        elseif cmd:find("^"..ini.commands.forceaniso.."$")then
            ini.settings.forceaniso = not ini.settings.forceaniso
            save()
            sampAddChatMessage(ini.settings.forceaniso and script_name..' {FFFFFF}������������ ���������� ������� {73b461}��������' or script_name..' {FFFFFF}������������ ���������� ������� {dc4747}���������', 0x73b461)
            gotofunc("ForceAniso")
            return false
        elseif cmd:find("^"..ini.commands.moneyzerofix.."$")then
            ini.settings.moneyzerofix = not ini.settings.moneyzerofix
            save()
            sampAddChatMessage(ini.settings.moneyzerofix and script_name..' {FFFFFF}����������� ������� ����������� ����� {73b461}��������' or script_name..' {FFFFFF}����������� ������� ����������� ����� {dc4747}���������', 0x73b461)
            gotofunc("MoneyZeroFix")
            return false
        elseif cmd:find("^"..ini.commands.mapzoomfixer.."$")then
            ini.settings.mapzoomfixer = not ini.settings.mapzoomfixer
            checkboxes.mapzoomfixer[0] = ini.settings.mapzoomfixer
            save()
            sampAddChatMessage(ini.settings.mapzoomfixer and script_name..' {FFFFFF}����������� ������ ���������������� ��� ���� ����� {73b461}��������' or script_name..' {FFFFFF}����������� ������ ���������������� ��� ���� ����� {dc4747}���������', 0x73b461)
            return false
        elseif cmd:find("^"..ini.commands.shadowcp.." .+") or cmd:find("^"..ini.commands.shadowcp.."$")then
            local param = cmd:match(ini.commands.shadowcp.." (.+)")
            param = tonumber(param)
            if ini.settings.shadowedit then
                if type(param) ~= 'number' or param < 0 or param > 255 then
                    sampAddChatMessage(script_name.." {FFFFFF}�����������: {dc4747}"..ini.commands.shadowcp.." [0-255]", 0x73b461)
                    sampAddChatMessage(script_name.." {FFFFFF}������� ��������: {dc4747}"..ini.settings.shadowcp, 0x73b461)
                else
                    ini.settings.shadowcp = param
                    save()
                    sliders.shadowcp[0] = ini.settings.shadowcp
                    gotofunc("ShadowEdit")
                    sampAddChatMessage(script_name.." {FFFFFF}�������� ���� ����������� ��: {dc4747}"..ini.settings.shadowcp, 0x73b461)
                end
            else
                sampAddChatMessage(script_name.." {FFFFFF}� ��� ��������� ����������� ������ ����, �������� �: {dc4747}"..ini.commands.shadowedit, 0x73b461)
            end
            return false
        elseif cmd:find("^"..ini.commands.shadowlight.." .+") or cmd:find("^"..ini.commands.shadowlight.."$")then
            local param = cmd:match(ini.commands.shadowlight.." (.+)")
            param = tonumber(param)
            if ini.settings.shadowedit then
                if type(param) ~= 'number' or param < 0 or param > 255 then
                    sampAddChatMessage(script_name.." {FFFFFF}�����������: {dc4747}"..ini.commands.shadowlight.." [0-255]", 0x73b461)
                    sampAddChatMessage(script_name.." {FFFFFF}������� ��������: {dc4747}"..ini.settings.shadowlight, 0x73b461)
                else
                    ini.settings.shadowlight = param
                    save()
                    sliders.shadowlight[0] = ini.settings.shadowlight
                    gotofunc("ShadowEdit")
                    sampAddChatMessage(script_name.." {FFFFFF}���� ������� ����������� ��: {dc4747}"..ini.settings.shadowlight, 0x73b461)
                end
            else
                sampAddChatMessage(script_name.." {FFFFFF}� ��� ��������� ����������� ������ ����, �������� �: {dc4747}"..ini.commands.shadowedit, 0x73b461)
            end
            return false
        elseif cmd:find("^"..ini.commands.setfps.." .+") or cmd:find("^"..ini.commands.setfps.."$")then
            local param = cmd:match(ini.commands.setfps.." (.+)")
            param = tonumber(param)
            if type(param) ~= 'number' or param < 5 or param > 300 then
                sampAddChatMessage(script_name.." {FFFFFF}�����������: {dc4747}"..ini.commands.setfps.." [5-300]", 0x73b461)
                sampAddChatMessage(script_name.." {FFFFFF}������� ��������: {dc4747}"..ini.smart_fps.pedfps, 0x73b461)
            else
                ini.smart_fps.pedfps = param
                save()
                sliders.pedfps[0] = ini.smart_fps.pedfps
                sampAddChatMessage(script_name.." {FFFFFF}��� � ��� ���������� ��: {dc4747}"..ini.smart_fps.pedfps, 0x73b461)
            end
            return false
        elseif cmd:find("^"..ini.commands.vehfps.." .+") or cmd:find("^"..ini.commands.vehfps.."$")then
            local param = cmd:match(ini.commands.vehfps.." (.+)")
            param = tonumber(param)
            if type(param) ~= 'number' or param < 5 or param > 300 then
                sampAddChatMessage(script_name.." {FFFFFF}�����������: {dc4747}"..ini.commands.vehfps.." [5-300]", 0x73b461)
                sampAddChatMessage(script_name.." {FFFFFF}������� ��������: {dc4747}"..ini.smart_fps.vehfps, 0x73b461)
            else
                ini.smart_fps.vehfps = param
                save()
                sliders.vehfps[0] = ini.smart_fps.vehfps
                sampAddChatMessage(script_name.." {FFFFFF}��� � ���� ���������� ��: {dc4747}"..ini.smart_fps.vehfps, 0x73b461)
            end
            return false
        elseif cmd:find("^"..ini.commands.motofps.." .+") or cmd:find("^"..ini.commands.motofps.."$")then
            local param = cmd:match(ini.commands.motofps.." (.+)")
            param = tonumber(param)
            if type(param) ~= 'number' or param < 5 or param > 300 then
                sampAddChatMessage(script_name.." {FFFFFF}�����������: {dc4747}"..ini.commands.motofps.." [5-300]", 0x73b461)
                sampAddChatMessage(script_name.." {FFFFFF}������� ��������: {dc4747}"..ini.smart_fps.motofps, 0x73b461)
            else
                ini.smart_fps.motofps = param
                save()
                sliders.motofps[0] = ini.smart_fps.motofps
                sampAddChatMessage(script_name.." {FFFFFF}��� � ���������� ���������� ��: {dc4747}"..ini.smart_fps.motofps, 0x73b461)
            end
            return false
        elseif cmd:find("^"..ini.commands.bikefps.." .+") or cmd:find("^"..ini.commands.bikefps.."$")then
            local param = cmd:match(ini.commands.bikefps.." (.+)")
            param = tonumber(param)
            if type(param) ~= 'number' or param < 5 or param > 300 then
                sampAddChatMessage(script_name.." {FFFFFF}�����������: {dc4747}"..ini.commands.bikefps.." [5-300]", 0x73b461)
                sampAddChatMessage(script_name.." {FFFFFF}������� ��������: {dc4747}"..ini.smart_fps.bikefps, 0x73b461)
            else
                ini.smart_fps.bikefps = param
                save()
                sliders.bikefps[0] = ini.smart_fps.bikefps
                sampAddChatMessage(script_name.." {FFFFFF}��� � ����������� ���������� ��: {dc4747}"..ini.smart_fps.bikefps, 0x73b461)
            end
            return false
        elseif cmd:find("^"..ini.commands.boatfps.." .+") or cmd:find("^"..ini.commands.boatfps.."$")then
            local param = cmd:match(ini.commands.boatfps.." (.+)")
            param = tonumber(param)
            if type(param) ~= 'number' or param < 5 or param > 300 then
                sampAddChatMessage(script_name.." {FFFFFF}�����������: {dc4747}"..ini.commands.boatfps.." [5-300]", 0x73b461)
                sampAddChatMessage(script_name.." {FFFFFF}������� ��������: {dc4747}"..ini.smart_fps.boatfps, 0x73b461)
            else
                ini.smart_fps.boatfps = param
                save()
                sliders.boatfps[0] = ini.smart_fps.boatfps
                sampAddChatMessage(script_name.." {FFFFFF}��� � ������ ���������� ��: {dc4747}"..ini.smart_fps.boatfps, 0x73b461)
            end
            return false
        elseif cmd:find("^"..ini.commands.planefps.." .+") or cmd:find("^"..ini.commands.planefps.."$")then
            local param = cmd:match(ini.commands.planefps.." (.+)")
            param = tonumber(param)
            if type(param) ~= 'number' or param < 5 or param > 300 then
                sampAddChatMessage(script_name.." {FFFFFF}�����������: {dc4747}"..ini.commands.planefps.." [5-300]", 0x73b461)
                sampAddChatMessage(script_name.." {FFFFFF}������� ��������: {dc4747}"..ini.smart_fps.planefps, 0x73b461)
            else
                ini.smart_fps.planefps = param
                save()
                sliders.planefps[0] = ini.smart_fps.planefps
                sampAddChatMessage(script_name.." {FFFFFF}��� � ��������� ���������� ��: {dc4747}"..ini.smart_fps.planefps, 0x73b461)
            end
            return false
        elseif cmd:find("^"..ini.commands.helifps.." .+") or cmd:find("^"..ini.commands.helifps.."$")then
            local param = cmd:match(ini.commands.helifps.." (.+)")
            param = tonumber(param)
            if type(param) ~= 'number' or param < 5 or param > 300 then
                sampAddChatMessage(script_name.." {FFFFFF}�����������: {dc4747}"..ini.commands.helifps.." [5-300]", 0x73b461)
                sampAddChatMessage(script_name.." {FFFFFF}������� ��������: {dc4747}"..ini.smart_fps.helifps, 0x73b461)
            else
                ini.smart_fps.helifps = param
                save()
                sliders.helifps[0] = ini.smart_fps.helifps
                sampAddChatMessage(script_name.." {FFFFFF}��� � ��������� ���������� ��: {dc4747}"..ini.smart_fps.helifps, 0x73b461)
            end
            return false
        elseif cmd:find("^"..ini.commands.swimfps.." .+") or cmd:find("^"..ini.commands.swimfps.."$")then
            local param = cmd:match(ini.commands.swimfps.." (.+)")
            param = tonumber(param)
            if type(param) ~= 'number' or param < 5 or param > 300 then
                sampAddChatMessage(script_name.." {FFFFFF}�����������: {dc4747}"..ini.commands.swimfps.." [5-300]", 0x73b461)
                sampAddChatMessage(script_name.." {FFFFFF}������� ��������: {dc4747}"..ini.smart_fps.swimfps, 0x73b461)
            else
                ini.smart_fps.swimfps = param
                save()
                sliders.swimfps[0] = ini.smart_fps.swimfps
                sampAddChatMessage(script_name.." {FFFFFF}��� �� ����� �������� ���������� ��: {dc4747}"..ini.smart_fps.swimfps, 0x73b461)
            end
            return false
        elseif cmd:find("^"..ini.commands.snipergunfps.." .+") or cmd:find("^"..ini.commands.snipergunfps.."$")then
            local param = cmd:match(ini.commands.snipergunfps.." (.+)")
            param = tonumber(param)
            if type(param) ~= 'number' or param < 5 or param > 300 then
                sampAddChatMessage(script_name.." {FFFFFF}�����������: {dc4747}"..ini.commands.snipergunfps.." [5-300]", 0x73b461)
                sampAddChatMessage(script_name.." {FFFFFF}������� ��������: {dc4747}"..ini.smart_fps.snipergunfps, 0x73b461)
            else
                ini.smart_fps.snipergunfps = param
                save()
                sliders.snipergunfps[0] = ini.smart_fps.snipergunfps
                sampAddChatMessage(script_name.." {FFFFFF}��� Sniper Gun ���������� ��: {dc4747}"..ini.smart_fps.snipergunfps, 0x73b461)
            end
            return false
        elseif cmd:find("^"..ini.commands.spraygunfps.." .+") or cmd:find("^"..ini.commands.spraygunfps.."$") then
            local param = cmd:match(ini.commands.spraygunfps.." (.+)")
            param = tonumber(param)
            if type(param) ~= 'number' or param < 5 or param > 300 then
                sampAddChatMessage(script_name.." {FFFFFF}�����������: {dc4747}"..ini.commands.spraygunfps.." [5-300]", 0x73b461)
                sampAddChatMessage(script_name.." {FFFFFF}������� ��������: {dc4747}"..ini.smart_fps.spraygunfps, 0x73b461)
            else
                ini.smart_fps.spraygunfps = param
                save()
                sliders.spraygunfps[0] = ini.smart_fps.spraygunfps
                sampAddChatMessage(script_name.." {FFFFFF}��� Spray Can ���������� ��: {dc4747}"..ini.smart_fps.spraygunfps, 0x73b461)
            end
            return false

        end
    end
end

chatBubbles = chatBubbles or {};

function onReceiveRpc(id, bs)
	if ini.settings.blocktime and (id == 29 or id == 94 or id == 30) then 
        return false 
   end
    if id == 152 and ini.settings.blockweather then
        return false
    end
    if id == 59 and ini.custom_nametags.status then
        local playerId = raknetBitStreamReadInt16(bs)
        local color = raknetBitStreamReadInt32(bs)
        local dist = raknetBitStreamReadFloat(bs)
        local time = raknetBitStreamReadInt32(bs)
        local len_text = raknetBitStreamReadInt8(bs)
        local text = raknetBitStreamReadString(bs, len_text)


            -- ������� ���������� ���-����
        for k, v in pairs(chatBubbles) do
            if v["playerid"] == playerId then
                table.remove(chatBubbles, k)
                break
            end
        end

        -- ������ ����� ���-����
        local tbl = {
            ["playerid"] = playerId,
            ["color"] = color,
            ["dist"] = dist,
            ["time"] = os.time() + time / 1000,
            ["text"] = text
        }
        table.insert(chatBubbles, tbl);
        return false
    end
end

function getMDO(id_obj) 
    return callFunction(0x403DA0, 1, 1, id_obj) + 24 -- get mem obj distance 
end


HeaderButton = function(bool, str_id)
    local DL = imgui.GetWindowDrawList()
    local ToU32 = imgui.ColorConvertFloat4ToU32
    local result = false
    local label = string.gsub(str_id, "##.*$", "")
    local duration = { 0.5, 0.3 }
    local cols = {
        idle = imgui.GetStyle().Colors[imgui.Col.TextDisabled],
        hovr = imgui.GetStyle().Colors[imgui.Col.Text],
        slct = imgui.GetStyle().Colors[imgui.Col.ButtonActive]
    }

    if not AI_HEADERBUT then AI_HEADERBUT = {} end
     if not AI_HEADERBUT[str_id] then
        AI_HEADERBUT[str_id] = {
            color = bool and cols.slct or cols.idle,
            clock = os.clock() + duration[1],
            h = {
                state = bool,
                alpha = bool and 1.00 or 0.00,
                clock = os.clock() + duration[2],
            }
        }
    end
    local pool = AI_HEADERBUT[str_id]

    local degrade = function(before, after, start_time, duration)
        local result = before
        local timer = os.clock() - start_time
        if timer >= 0.00 then
            local offs = {
                x = after.x - before.x,
                y = after.y - before.y,
                z = after.z - before.z,
                w = after.w - before.w
            }

            result.x = result.x + ( (offs.x / duration) * timer )
            result.y = result.y + ( (offs.y / duration) * timer )
            result.z = result.z + ( (offs.z / duration) * timer )
            result.w = result.w + ( (offs.w / duration) * timer )
        end
        return result
    end

    local pushFloatTo = function(p1, p2, clock, duration)
        local result = p1
        local timer = os.clock() - clock
        if timer >= 0.00 then
            local offs = p2 - p1
            result = result + ((offs / duration) * timer)
        end
        return result
    end

    local set_alpha = function(color, alpha)
        return imgui.ImVec4(color.x, color.y, color.z, alpha or 1.00)
    end

    imgui.BeginGroup()
        local pos = imgui.GetCursorPos()
        local p = imgui.GetCursorScreenPos()
      
        imgui.TextColored(pool.color, label)
        local s = imgui.GetItemRectSize()
        local hovered = imgui.IsItemHovered()
        local clicked = imgui.IsItemClicked()
      
        if pool.h.state ~= hovered and not bool then
            pool.h.state = hovered
            pool.h.clock = os.clock()
        end
      
        if clicked then
            pool.clock = os.clock()
            result = true
        end

        if os.clock() - pool.clock <= duration[1] then
            pool.color = degrade(
                imgui.ImVec4(pool.color),
                bool and cols.slct or (hovered and cols.hovr or cols.idle),
                pool.clock,
                duration[1]
            )
        else
            pool.color = bool and cols.slct or (hovered and cols.hovr or cols.idle)
        end

        if pool.h.clock ~= nil then
            if os.clock() - pool.h.clock <= duration[2] then
                pool.h.alpha = pushFloatTo(
                    pool.h.alpha,
                    pool.h.state and 1.00 or 0.00,
                    pool.h.clock,
                    duration[2]
                )
            else
                pool.h.alpha = pool.h.state and 1.00 or 0.00
                if not pool.h.state then
                    pool.h.clock = nil
                end
            end

            local max = s.x / 2
            local Y = p.y + s.y + 3
            local mid = p.x + max

            DL:AddLine(imgui.ImVec2(mid, Y), imgui.ImVec2(mid + (max * pool.h.alpha), Y), ToU32(set_alpha(pool.color, pool.h.alpha)), 3)
            DL:AddLine(imgui.ImVec2(mid, Y), imgui.ImVec2(mid - (max * pool.h.alpha), Y), ToU32(set_alpha(pool.color, pool.h.alpha)), 3)
        end

    imgui.EndGroup()
    return result
end

function gotofunc(fnc)
    ------------------------------------fixes and other-----------------------------
    if fnc == "all" then
        LoadPatch()
        callFunction(0x7469A0, 0, 0) --mousefix in pause
        --[[
            push = + 1 byte
            fld or fmul or fsub or fadd = + 2 byte
            lea + 3 adress
            
        ]]

        --fix bug photograph
        if getCurrentCharWeapon(PLAYER_PED) == 43 and readMemory(0x70476E, 4, true) == 2866 and readMemory(0x53E227, 1, true) ~= 233 then
            writeMemory(0x53E227, 1, 0xE9, true)
        elseif getCurrentCharWeapon(PLAYER_PED) ~= 43 and readMemory(0x53E227, 1, true) ~= 195 and readMemory(0x70476E, 4, true) == 2866 then
            writeMemory(0x53E227, 1, 0xC3, true)
        end
        --fix bug photograph


    

       



        memory.setint8(0x4414C0, 0xC3, false)--PassingOfTimeOnDeath
        memory.setint8(0x732F5D+1, 0, true) -- fog weapons fix (1 orig)
        memory.setuint32(0x736F88, 0, true)-- AirCraftExplosionFix
        memory.setuint8(0x8D37D0, 0, true) -- ���������� ������� FPS ����� ������ ���������� �� ����.
        
        --------[fix spawn bottle or smoke]----------
        memory.fill(0x4217F4, 0x90, 21, true)
        memory.fill(0x4218D8, 0x90, 17, true)
        memory.fill(0x5F80C0, 0x90, 10, true)
        memory.fill(0x5FBA47, 0x90, 10, true)
        ---------------------------------------------


        if get_samp_version() == "r1" then
            memory.write(sampGetBase() + 0x64ACA, 0xFB, 1, true) --Min FontSize -5
            memory.write(sampGetBase() + 0x64ACF, 0x07, 1, true) --Max FontSize 7
            memory.write(sampGetBase() + 0xD7B00, 0x7420352D, 4, true) --FontSize StringInfo
            memory.write(sampGetBase() + 0xD7B04, 0x37206F, 4, true) --FontSize StringInfo
            memory.write(sampGetBase() + 0x64A51, 0x32, 1, true) --PageSize MAX
            memory.write(sampGetBase() + 0xD7AD5, 0x35, 1, true) --PageSize StringInfo
        elseif get_samp_version() == "r3" then
            memory.write(sampGetBase() + 0x67F2A, 0xFB, 1, true) --Min FontSize -5 (����������� �������� ��� ������� /fontsize)
            memory.write(sampGetBase() + 0x67F2F, 0x07, 1, true) --Max FontSize 7 (������������ �������� ��� ������� /fontsize)
            memory.write(sampGetBase() + 0xE9DE0, 0x7420352D, 4, true) --FontSize StringInfo (������� ���� � ����������� �������� ��� ����� /fontsize)
            memory.write(sampGetBase() + 0xE9DE4, 0x37206F, 4, true) --FontSize StringInfo (������� ���� � ������������ �������� ��� ����� /fontsize)
            memory.write(sampGetBase() + 0x67EB1, 0x32, 1, true) --PageSize MAX (������������ ����� ��� /pagesize)
            memory.write(sampGetBase() + 0xE9DB5, 0x35, 1, true) --PageSize StringInfo (������� ���� � ������������ �������� ��� ����� /pagesize)
        end
        ----------------------------------------------------------------------------
    end
    -----------------------------------------------------------------------
    if fnc == "OpenMenu" then
        gfmenu.switch()
	end
    if fnc == "OpenTws" then
        twsmenu.switch()
	end
    if fnc == "OpenTimecycCreator" then
        timecyc_creator.switch()
	end

    if fnc == "GTATime" then
        writeMemory(0xB7015C, 4, 1000, true)--c ms time
        if ini.settings.gtatime then
            memory.hex2bin("56", 0x52CF10, 1)
        else
            memory.hex2bin("C3", 0x52CF10, 1)
        end
        setTimeOfDay(ini.settings.hours, ini.settings.min)
    end

    if fnc == "GTAWeather" then
        local function getMilliseconds()
            local _, b = math.modf(os.clock())
            return ("%03d"):format(b * 1000)
        end

        if ini.settings.gtaweather then
            writeMemory(0x72A510, 1, 0x66, false)
            -- ��������� ��������� ������
            if ini.settings.noRain then
                local offsets = {}
                -- �����
                offsets = {0x2C, 0x2D, 0x2E, 0x2F}
                for i = 1, 4 do memory.setint8(0x8D5EB0 + offsets[i], 15, true) end
                -- ��
                memory.setint8(0x8D5EF0 + 0x2E, 0, true)
                -- ��
                offsets = {0x12, 0x13, 0x2D, 0x2E}
                for i = 1, 4 do memory.setint8(0x8D5F30 + offsets[i], 7, true) end
            end
            -- ��������� �������� ������
            if ini.settings.noFog then
                local offsets = {}
                -- �����
                offsets = {0xA, 0xB, 0x29, 0x2A}
                for i = 1, 4 do memory.setint8(0x8D5EB0 + offsets[i], 15, true) end
                -- ��
                offsets = {0x7, 0x8, 0x1E, 0x1F, 0x31, 0x32}
                for i = 1, 6 do memory.setint8(0x8D5F30 + offsets[i], 7, true) end
            end
            -- ��������� ��������� ����
            if ini.settings.noSandstorm then
                local offsets = {0x3, 0x4, 0x25, 0x26, 0x27, 0x3C, 0x3D, 0x3E}
                for i = 1, 8 do memory.setint8(0x8D5FB0 + offsets[i], 18, true) end
            end
            CWeather__ReleaseWeather()
            math.randomseed(os.time() * getMilliseconds())
            memory.setint8(0xC81310, math.random(0, 63), false) -- CWeather::WeatherTypeInList
        else
            writeMemory(0x72A510, 1, 0xC3, false)
        end
    end

    
    if fnc == "BlockWeather" or fnc == "all" then
        if get_samp_version() == "r1" then
            if ini.settings.blockweather then
                writeMemory(sampGetBase() + 0x9C130, 4, 0x0004C2, true)
            else
                if fnc ~= "all" then
                    writeMemory(sampGetBase() + 0x9C130, 4, 0x5D418B, true)
                end
            end
        elseif get_samp_version() == "r3" then
            if ini.settings.blockweather then
                writeMemory(sampGetBase() + 0xA0430, 4, 0x0004C2, true)
            else
                if fnc ~= "all" then
                    writeMemory(sampGetBase() + 0xA0430, 4, 0x5D418B, true)
                end
            end
        end
    end
    
    if fnc == "SetTime" or fnc == "all" then
        Im.Hours = ini.settings.hours
        Im.Mins = ini.settings.min

        setTimeOfDay(ini.settings.hours, ini.settings.min)
	end
    if fnc == "SetWeather" or fnc == "all" then
        Im.CurrWeather[0] = ini.settings.weather
        forceWeatherNow(ini.settings.weather)
	end
    
    if fnc == "BlockTime" or fnc == "all" then
        if get_samp_version() == "r1" then
            if ini.settings.blocktime then
                writeMemory(sampGetBase() + 0x9C0A0, 4, 0x000008C2, true)
            else
                if fnc ~= "all" then
                    writeMemory(sampGetBase() + 0x9C0A0, 4, 0x0824448B, true)
                end
            end
        elseif get_samp_version() == "r3" then
            if ini.settings.blocktime then
                writeMemory(sampGetBase() + 0xA03A0, 4, 0x000008C2, true)
            else
                if fnc ~= "all" then
                    writeMemory(sampGetBase() + 0xA03A0, 4, 0x0824448B, true)
                end
            end
        end
    end

    if fnc == "FixTimecyc" or fnc == "all" then
        if ini.fixtimecyc.active then
            memory.write(6359759, 144, 1, false)-- ���
            memory.write(6359760, 144, 1, false)-- ���
            memory.write(6359761, 144, 1, false)-- ���
            memory.write(6359762, 144, 1, false)-- ���
            memory.write(6359763, 144, 1, false)-- ���
            memory.write(6359764, 144, 1, false)-- ���
            memory.write(6359778, 144, 1, false)-- ���
            memory.write(6359779, 144, 1, false)-- ���
            memory.write(6359780, 144, 1, false)-- ���
            memory.write(6359781, 144, 1, false)-- ���
            memory.write(6359782, 144, 1, false)-- ���
            memory.write(6359783, 144, 1, false)-- ���
            memory.write(6359784, 144, 1, false)-- ���
            memory.write(6359785, 144, 1, false)-- ���
            memory.write(6359786, 144, 1, false)-- ���
            memory.write(6359787, 144, 1, false)-- ���
            memory.write(5637016, 12044024, 4, false)-- ���
            memory.write(5637032, 12044024, 4, false)-- ���
            memory.write(5637048, 12044024, 4, false)-- ���
            memory.write(5636920, 12044048, 4, false)-- ���
            memory.write(5636936, 12044072, 4, false)-- ���
            memory.write(5636952, 12044096, 4, false)-- ���

            memory.setfloat(9228384, ini.fixtimecyc.allambient, false)
            memory.setfloat(12044024, ini.fixtimecyc.objambient, false)
            memory.setfloat(12044048, ini.fixtimecyc.worldambientR, false)
            memory.setfloat(12044072, ini.fixtimecyc.worldambientG, false)
            memory.setfloat(12044096, ini.fixtimecyc.worldambientB, false)
        else
            if fnc ~= "all" then
                memory.write(6359759, 217, 1, false)-- ����
                memory.write(6359760, 21, 1, false)-- ����
                memory.write(6359761, 96, 1, false)-- ����
                memory.write(6359762, 208, 1, false)-- ����
                memory.write(6359763, 140, 1, false)-- ����
                memory.write(6359764, 0, 1, false)-- ����
                memory.write(6359778, 199, 1, false)-- ����
                memory.write(6359779, 5, 1, false)-- ����
                memory.write(6359780, 96, 1, false)-- ����
                memory.write(6359781, 208, 1, false)-- ����
                memory.write(6359782, 140, 1, false)-- ����
                memory.write(6359783, 0, 1, false)-- ����
                memory.write(6359784, 0, 1, false)-- ����
                memory.write(6359785, 0, 1, false)-- ����
                memory.write(6359786, 128, 1, false)-- ����
                memory.write(6359787, 63, 1, false)-- ����
                memory.write(5637016, 12043448, 4, false)-- ����
                memory.write(5637032, 12043452, 4, false)-- ����
                memory.write(5637048, 12043456, 4, false)-- ����
                memory.write(5636920, 12043424, 4, false)-- ����
                memory.write(5636936, 12043428, 4, false)-- ����
                memory.write(5636952, 12043432, 4, false)-- ����
            end
        end
    end
    if fnc == "GivemeDist" or fnc == "all" then
        if ini.settings.givemedist then
            ---------------return original bytes-------
            memory.hex2bin("8B0DF0C4B700", 0x53EA93, 6)
            memory.hex2bin("DEC1D95E54", 0x55FCD9, 5)
            ------------------------------------------

            memory.write(0x53EA95, 0xB7C7F0, 4, true)-- ���
            memory.write(0x7FE621, 0xC99F68, 4, true)-- ���
        else
            if fnc ~= "all" then
                memory.write(0x53EA95, 0xB7C4F0, 4, true)-- ����
                memory.write(0x7FE621, 0xC992F0, 4, true)-- ����
            end
        end
	end
    if fnc == "LodDist" or fnc == "all" then
        if ini.settings.givemedist then
            memory.setfloat(0xCFFA11, ini.settings.lod, true)
            local aWrites = {
                [1] = 0x555172+2, [2] = 0x555198+2, [3] = 0x5551BB+2, [4] = 0x55522E+2, [5] = 0x555238+2,
                [6] = 0x555242+2, [7] = 0x5552F4+2, [8] = 0x5552FE+2, [9] = 0x555308+2, [10] = 0x555362+2,
                [11] = 0x55537A+2, [12] = 0x555388+2, [13] = 0x555A95+2, [14] = 0x555AB1+2, [15] = 0x555AFB+2,
                [16] = 0x555B05+2, [17] = 0x555B1C+2, [18] = 0x555B2A+2, [19] = 0x555B38+2, [20] = 0x555B82+2,
                [21] = 0x555B8C+2, [22] = 0x555B9A+2, [23] = 0x5545E6+2, [24] = 0x554600+2, [25] = 0x55462A+2,
                [26] = 0x5B527A+2,
            }
            for i = 0, #aWrites do
                writeMemory(aWrites[i], 4, 0xCFFA11, true)
            end
        end
    end
   
    if fnc == "ShadowEdit" or fnc == "all" then
        if ini.settings.shadowedit then
            memory.write(5635169, 0, 1, true)
            memory.write(5635259, 0, 1, true)
            memory.setint32(12043496, ini.settings.shadowcp, true)
            memory.setint32(12043500, ini.settings.shadowlight, true)
        else
            if fnc ~= "all" then
                memory.write(5635169, 72, 1, true)
                memory.write(5635259, 76, 1, true)
            end
        end
	end
    if fnc == "NoShadows" or fnc == "all" then
            if ini.settings.noshadows then
                memory.write(5497177, 195, 1, true)
                memory.fill(5489067, 144, 5, true)
                memory.write(6186889, 33807, 2, true)
                memory.fill(7388587, 144, 6, true)
                memory.fill(7391066, 144, 9, true)
            else
                if fnc ~= "all" then
                    memory.write(5497177, 233, 1, true)
                    memory.write(5489067, 492560616, 4, true)
                    memory.write(5489071, 0, 1, true)
                    memory.write(6186889, 59792, 2, true)
                    memory.write(7388587, 111379727, 4, true)
                    memory.write(7388591, 0, 2, true)
                    memory.write(7391066, 32081167, 4, true)
                    memory.write(7391070, -1869611008, 4, true)

                    memory.hex2bin('E838A21C00', 0x53E0C3, 5)
                    memory.hex2bin('E893C81C00', 0x53E0C8, 5)
                    memory.hex2bin('E87D9E1C00', 0x53E0BE, 5)
                end
            end
            if ini.settings.pedshadows then
                writeMemory(0x707B40, 1, 0xC3, true)--��������� ���� ��� ������
            else
                if fnc ~= "all" then
                    writeMemory(0x707B40, 1, 0x83, true)--�������� ���� ��� ������
                end
            end
            if ini.settings.vehshadows then
                --��������� ���� ��� �����������
                memory.fill(0x6ABCF5, 0x90, 5, true)
                memory.fill(0x6BD667, 0x90, 5, true)
                memory.fill(0x6C0B21, 0x90, 5, true)
                memory.fill(0x6C58A0, 0x90, 5, true)
                memory.fill(0x6CA73A, 0x90, 5, true)
            else
                if fnc ~= "all" then
                    memory.hex2bin('E8A6000600', 0x6ABCF5, 5)
                    memory.hex2bin('E834E70400', 0x6BD667, 5)
                    memory.hex2bin('E87AB20400', 0x6C0B21, 5)
                    memory.hex2bin('E8FB640400', 0x6C58A0, 5)
                    memory.hex2bin('E861160400', 0x6CA73A, 5)
                end
            end
            if ini.settings.poleshadows then
                writeMemory(0x70C750, 1, 0xC3, true)--��������� ���� ��� ��������
            else
                if fnc ~= "all" then
                    writeMemory(0x70C750, 1, 0x83, true)--�������� ���� ��� ��������
                end
            end
            if ini.settings.maxshadows then
                writeMemory(0x7113B0, 1, 0xC3, true)--���� �����, ������� � ������ �� ������� ����������
            else
                if fnc ~= "all" then
                    writeMemory(0x7113B0, 1, 0x83, true)--���� �����, ������� � ������ �� ������� ����������
                end
            end

	end

    if fnc == "FPSUnlock" or fnc == "all" then
        if get_samp_version() == "r1" then
            if ini.settings.unlimitfps then
                memory.write(sampGetBase() + 0x9D9D1, 0x8B, 1, true)
            else
                memory.write(sampGetBase() + 0x9D9D1, 0x9B, 1, true)
            end
        elseif get_samp_version() == "r3" then
            if ini.settings.unlimitfps then
                memory.write(sampGetBase() + 0xA1F60, 0x5051FF15, 4, true)
            else
                memory.write(sampGetBase() + 0xA1F60, 0xFFF57BE8, 4, true) 
            end
        end
	end

    
    if fnc == "EffectsManager" or fnc == "all" then

            memory.hex2bin(ini.effects_manager.MotionBlur and "E811E2FFFF" or "9090909090", 0x704E8A, 5)
            writeMemory(0x8D5104, 1, ini.effects_manager.MotionBlurIntensity, true)


            if ini.effects_manager.noplaneline then
                memory.fill(0x7178F0, 0x90, 5, true)
            else
                if fnc ~= "all" then
                    memory.hex2bin('E9ABFAFFFF', 0x7178F0, 5)
                end
            end

            if ini.effects_manager.fireworld then
                writeMemory(0x539F00, 4, 0x0024C2, true)-- ��������� �����, ��� 0x6C8B5551
            else
                if fnc ~= "all" then
                    writeMemory(0x539F00, 4, 0x6C8B5551, true)-- ��������� �����, ��� 0x6C8B5551
                end
            end

            if ini.effects_manager.tiretracks then
                memory.fill(0x53E175, 0x90, 5, true)
            else
                if fnc ~= "all" then
                    memory.hex2bin('E8C6241E00', 0x53E175, 5)
                end
            end

            if ini.effects_manager.nobirds then
                memory.fill(0x712833, 0x90, 2, true)
            else
                if fnc ~= "all" then
                    memory.hex2bin('3BC5', 0x712833, 2) --nobirds
                end
            end

            if ini.effects_manager.nocloudbig then
                memory.write(5497268, -1869574000, 4, true)--������� ������ ������ ����
                memory.write(5497272, 144, 1, true)--������� ������ ������ ����
            else
                if fnc ~= "all" then
                    memory.write(5497268, 495044584, 4, true)--������� ������ ������ ���
                    memory.write(5497272, 0, 1, true)--������� ������ ������ ���
                end
            end


            if ini.effects_manager.nocloudsmall then
                memory.fill(5497121, 144, 5, true)--������ ������ ����
            else
                if fnc ~= "all" then
                    memory.write(5497121, 494111464, 4, true)--������ ������ ���
                    memory.write(5497125, 0, 1, true)--������ ������ ���
                end
            end

            if ini.effects_manager.nocloudhorizont then
                writeMemory(0x70EAB0, 1, 0xC3, true)-- disable horizont clouds original byte 0x83
            else
                if fnc ~= "all" then
                    writeMemory(0x70EAB0, 1, 0x83, true)-- disable horizont clouds original byte 0x83
                end
            end

            if ini.effects_manager.postfx then
                memory.write(7358318, 2866, 4, true)--postfx off
                memory.write(7358314, -380152237, 4, true)--postfx off
                writeMemory(0x53E227, 1, 0xC3, true)
            else
                if fnc ~= "all" then
                    memory.write(7358318, 1448280247, 4, true)--postfx on
                    memory.write(7358314, -988281383, 4, true)--postfx on
                    writeMemory(0x53E227, 1, 0xE9, true)
                end
            end

            if ini.effects_manager.reflectionwater then
                memory.setfloat(0xCDFDDA, 0, true)
                writeMemory(0x6FBAE4+2, 4, 0xCDFDDA, true)
            else
                if fnc ~= "all" then
                    memory.setfloat(0xCDFDDA, 0.3, true)
                    writeMemory(0x6FBAE4+2, 4, 0xCDFDDA, true)
                end
            end
            if ini.effects_manager.nomorehaze then
                writeMemory(0x72C1B7, 1, 0xEB, true)
            else
                if fnc ~= "all" then
                    writeMemory(0x72C1B7, 1, 0x7C, true)
                end
            end
            if ini.effects_manager.nosparks then
                writeMemory(0x49F040, 4, 0x0028C2, true) -- ��������� �����
            else
                if fnc ~= "all" then
                    writeMemory(0x49F040, 4, 0xF683E7E9, true) -- �������� �����
                end
            end
            if ini.effects_manager.nowaterfog then
                writeMemory(0x6E7760, 1, 0xC3, true)
            else
                if fnc ~= "all" then
                    writeMemory(0x6E7760, 1, 0xA0, true)
                end
            end
            if ini.effects_manager.breakobject then
                writeMemory(0x59DE40, 4, 0x0010C2, true) -- ��������� ���� ��� ������� ��������
            else
                if fnc ~= "all" then
                    writeMemory(0x59DE40, 4, 0x5358EC83, true) -- �������� ���� ��� ������� ��������
                end
            end
            if ini.effects_manager.nogunfire then
                writeMemory(0x5DF340, 4, 0x0008C2, true)-- ��������� ����� ��� ���������
            else
                if fnc ~= "all" then
                    writeMemory(0x5DF340, 4, 0x8BF18B56, true)-- ������� ����� ��� ���������
                end
            end
            if ini.effects_manager.nogunsmoke then
                writeMemory(0x4A0DE0, 4, 0x0010C2, true) -- ��������� ��� ��� ��������
            else
                if fnc ~= "all" then
                    writeMemory(0x4A0DE0, 4, 0xB6F03CA1, true) -- �������� ��� ��� ��������
                end
            end
            if ini.effects_manager.nofxsystem then
                memory.fill(0x4A125D, 0x90, 8, true) -- 8B 4E 08 E8 47 91 00 00  FxSystem_c::Play(void)
            else
                if fnc ~= "all" then
                    memory.hex2bin('8B4E08E88B900000', 0x4A125D, 8) --FxSystem_c::Play(void)
                end
            end
            if ini.effects_manager.noblood then
                memory.fill(0x49EB23, 0x90, 2, true)-- blood particle
            else
                if fnc ~= "all" then
                    memory.hex2bin('EB05', 0x49EB23, 2)-- blood particle
                end
            end
            if ini.effects_manager.swim then
                memory.write(0x68AA70, 0x0004C2, 4, true) -- process swim effects ped
                memory.write(0x6C399F+1, 0, 4, true)--addsplashparticles
                memory.write(0x6C3606+1, 0, 4, true)-- ����� ��� ������
                memory.write(0x4A1144, 0x0004C2, 4, true)-- ������ ���� ����� � �� ��������
                memory.write(0x4A10D4, 0x0004C2, 4, true)-- water_splash
                memory.write(0x4A11B4, 0x0004C2, 4, true)

                writeMemory(0x6DD130, 4, 0x0004C2, true)-- boat splash ������ ���� �� ������� ����������
                writeMemory(0x6ED9A0, 4, 0xC3, true)--����� �� ������� ����������
            else
                if fnc ~= "all" then
                    memory.write(0x68AA70, -1587216534, 4, true)
                    memory.write(0x6C399F+1, 1053609165, 4, true)
                    memory.write(0x6C3606+1, 1045220557, 4, true)
                    memory.write(0x4A1144, 9603048, 4, true)-- ������ ���� ����� � �� ��������
                    memory.write(0x4A10D4, 9631720, 4, true)-- water_splash
                    memory.write(0x4A11B4, 9574376, 4, true)

                    writeMemory(0x6DD130, 4, 0x80EC81, true)-- boat splash ������ ���� �� ������� ����������
                    writeMemory(0x6ED9A0, 4, 0x83EC8B55, true)--����� �� ������� ����������
                end
            end
            if ini.effects_manager.noexhaust then
                writeMemory(0x6DE240, 1, 0xC3, true) -- ��� �� ���� ����������
            else
                if fnc ~= "all" then
                    writeMemory(0x6DE240, 1, 0x64, true) -- ��� �� ���� ����������
                end
            end
            if ini.effects_manager.wheelsand then
                writeMemory(0x4A06F5+1, 4, 0, true) -- ����� �� ��� �����
                memory.write(0x4A0630, 0x9090, 2, true)-- �����
            else
                if fnc ~= "all" then
                    writeMemory(0x4A0AA0+1, 4, 0x3F800000, true) -- ���� �� ��� �����
                    memory.write(0x4A0630, 0x05EB, 2, true)-- �����
                end
            end
            if ini.effects_manager.wheeldust then
                writeMemory(0x6DEF50+1, 4, 0, true) -- ���� �� ��� �����
                memory.write(0x4A09E0, 0x9090, 2, true)-- ����
            else
                if fnc ~= "all" then
                    writeMemory(0x6DEF50+1, 4, 0x9A99993E, true) -- ���� �� ��� �����
                    memory.write(0x4A09E0, 0x05EB, 2, true)-- ����
                end
            end
            if ini.effects_manager.wheelmud then
                writeMemory(0x4A0003+1, 4, 0, true) -- ����� �� ��� �����
                writeMemory(0x4A04A3+1, 4, 0, true) -- ����� �� ��� ����� x2
                memory.write(0x4A040E, 0x9090, 2, true) -- �����
            else
                if fnc ~= "all" then
                    writeMemory(0x4A0003+1, 4, 0x3F800000, true) -- ����� �� ��� �����
                    writeMemory(0x4A04A3+1, 4, 0x3F800000, true) -- ����� �� ��� ����� x2
                    memory.write(0x4A040E, 0x05EB, 2, true) -- �����
                end
            end
            if ini.effects_manager.wheelgravel then
                writeMemory(0x4A0253+1, 4, 0, true) -- ������ �� ��� �����
                memory.write(0x4A01BE, 0x9090, 2, true) -- ������
            else
                if fnc ~= "all" then
                    writeMemory(0x4A0253+1, 4, 0x3F800000, true) -- ������ �� ��� �����
                    memory.write(0x4A01BE, 0x05EB, 2, true) -- ������
                end
            end
            if ini.effects_manager.wheelgrass then
                memory.write(0x49FF6E, 0x9090, 2, true) -- �����
            else
                if fnc ~= "all" then
                    memory.write(0x49FF6E, 0x05EB, 2, true) -- �����
                end
            end
            if ini.effects_manager.wheelspray then
                memory.write(0x49FB50, 0x9090, 2, true) -- ���
                writeMemory(0x6DF1C3+1, 4, 0, true) -- ��� �� ��� �����
                writeMemory(0x6DF1BE+1, 4, 0, true) -- ��� �� ��� �����
                writeMemory(0x6DED24+1, 4, 0, true) -- ��� ��� ������, W+S
                writeMemory(0x6DED1A+1, 4, 0, true)
            else
                if fnc ~= "all" then
                    memory.write(0x49FB50, 0x05EB, 2, true) -- ���
                    writeMemory(0x6DF1C3+1, 4, 0x3F800000, true) -- ��� �� ��� �����
                    writeMemory(0x6DF1BE+1, 4, 0x3F000000, true) -- ��� �� ��� �����
                    writeMemory(0x6DED24+1, 4, 0x3F333333, true) -- ��� ��� ������, W+S
                    writeMemory(0x6DED1A+1, 4, 0x3E99999A, true)
                end
            end
            if ini.effects_manager.vehsparks then
                memory.setfloat(0xCB0870, -99.9, true) -- ����� ��� ��������� ����������
                memory.write(0x5458DA+2, 0xCB0870, 4, true)
            else
                if fnc ~= "all" then
                    memory.setfloat(0xCB0870, 0.0000118509, true) -- ����� ��� ��������� ����������
                    memory.write(0x5458DA+2, 0xCB0870, 4, true)
                end
            end
            if ini.effects_manager.vehdust then
                writeMemory(0x6C9FAF+1, 4, 0, true)-- ���� ��� ������ �� ���������� ����������� plane
                writeMemory(0x6C55F4+1, 4, 0, true)--���� ��� ������ �� ���������� ����������� heli
            else
                if fnc ~= "all" then
                    writeMemory(0x6C9FAF+1, 4, 0x40000000, true)-- ���� ��� ������ �� ���������� ����������� plane
                    writeMemory(0x6C55F4+1, 4, 0x3F800000, true)--���� ��� ������ �� ���������� ����������� heli
                end
            end
            if ini.effects_manager.vehdmgdust then
                writeMemory(0x6A6E93+1, 4, 0, true)--���� ��� ������������ ���������� � ���������
            else
                if fnc ~= "all" then
                    writeMemory(0x6A6E93+1, 4, 0x3DCCCCCD, true)--���� ��� ������������ ���������� � ���������
                end
            end
            if ini.effects_manager.footdust then
                writeMemory(0x5E3811+1, 4, 0, true)--foot dust
                writeMemory(0x5458E0+1, 4, 0, true)
            else
                if fnc ~= "all" then
                    writeMemory(0x5E3811+1, 4, 0x3E19999A, true)--foot dust
                    writeMemory(0x5458E0+1, 4, 0x3DCCCCCD, true)
                end
            end
            if ini.effects_manager.nodust then
                writeMemory(0x49F57D+1, 4, 0, true) -- ���� ��� �������� � �����
                writeMemory(0x49F49D+1, 4, 0, true) -- ���� ��� ������������ ���� � ������������, �����, ������ � �.�
            else
                if fnc ~= "all" then
                    writeMemory(0x49F57D+1, 4, 0x3ECCCCCD, true) -- ���� ��� �������� � �����
                    writeMemory(0x49F49D+1, 4, 0x3D99999A, true) -- ���� ��� ������������ ���� � ������������, �����, ������ � �.�
                end
            end
            if ini.effects_manager.gunshell then
                writeMemory(0x73A40A, 2, 0x9090, true)--������
            else
                if fnc ~= "all" then
                    writeMemory(0x73A40A, 2, 0x0375, true)--������
                end
            end
            if ini.effects_manager.teargas then
                writeMemory(0x00872BF0, 1, 0xC3, false)
            else
                if fnc ~= "all" then
                    writeMemory(0x00872BF0, 1, 0x74, false)
                end
            end
            if ini.effects_manager.footprints then
                writeMemory(0x005E559C+1, 4, -1, true)-- ����� ��� �� ����� (footprints in the sand)
            else
                if fnc ~= "all" then
                    writeMemory(0x005E559C+1, 4, 0x40800000, true)-- ����� ��� �� ����� (footprints in the sand)
                end
            end
            if ini.effects_manager.vehdmgsmoke then
                writeMemory(0x6D2A80, 4, 0xC3, true)--smoke dmg vehicles
            else
                if fnc ~= "all" then
                    writeMemory(0x6D2A80, 4, 0x5618EC83, true)--smoke dmg vehicles
                end
            end
            if ini.effects_manager.vehtaxilight then
                memory.write(12697552, 0, 1, true)--��������� �������� ����� �����
            else
                if fnc ~= "all" then
                    memory.write(12697552, 1, 1, true)--�������� �������� ����� �����
                end
            end
            checkboxes.vehtaxilight[0] = ini.effects_manager.vehtaxilight
    end
    if fnc == "ShowHUD" or fnc == "all" then
        if preset["Other"]["showhud"] then
            displayHud(false)
            memory.setint8(0xBA676C, 2)
        else
            if fnc ~= "all" then
                displayHud(true)
                memory.setint8(0xBA676C, 0)
            end
        end
	end
    if fnc == "ScreenOptions" or fnc == "all" then
        writeMemory(0xFCFAED, 4, representFloatAsInt(ini.settings.aspectratio, false))
        writeMemory(0x6FF43F+2, 4, 0xFCFAED, false)
        writeMemory(0x6FF43D, 2, 0x9090, false)


    end
    if fnc == "FixLoadMap" or fnc == "all" then
        --[[
        00584C6D  3B D0                                   cmp     edx, eax
        00584C6F  7C 64                                   jl      short loc_584CD5
        00584C71  41                                      inc     ecx
        00584C72  3B D1                                   cmp     edx, ecx
        00584C74  7F 5F                                   jg      short loc_584CD5
        00584C76  8B 44 24 1C                             mov     eax, [esp+14h+arg_4]
        00584C7A  8D 48 FF                                lea     ecx, [eax-1]
        00584C7D  3B D9                                   cmp     ebx, ecx
        00584C7F  7C 54                                   jl      short loc_584CD5
        00584C81  40                                      inc     eax
        00584C82  3B D8                                   cmp     ebx, eax
        00584C84  7F 4F
        ]]
        if preset["MenuPause"]["fixloadmap"] then
            memory.fill(0x584C6D, 0x90, 0x19, true)-- fixloadmap
        else
            if fnc ~= "all" then
                memory.hex2bin('3BD07C64413BD17F5F8B44241C8D48FF3BD97C54403BD87F4F', 0x584C6D, 0x19)
            end
        end
    end
    if fnc == "ShowCHAT" or fnc == "all" then
        if get_samp_version() == "r1" then
            if preset["Other"]["showchat"] then
                memory.write(sampGetBase() + 0x7140F, 1, 1, true)
                sampSetChatDisplayMode(0)
            else
                memory.write(sampGetBase() + 0x7140F, 0, 1, true)
                sampSetChatDisplayMode(3)
            end
        elseif get_samp_version() == "r3" then
            if preset["Other"]["showchat"] then
                memory.write(sampGetBase() + 0x752FF, 1, 1, true)
                sampSetChatDisplayMode(0)
            else
                memory.write(sampGetBase() + 0x752FF, 0, 1, true)
                sampSetChatDisplayMode(3)
            end
        end
	end
    if fnc == "ShowHP" or fnc == "all" then
        if get_samp_version() == "r1" then
            if ini.settings.showhp then
                memory.setint16(sampGetBase() + 0x6FC30, 0xC390, true)
            else
                memory.setint16(sampGetBase() + 0x6FC30, 0x8B55, true)
            end
        elseif get_samp_version() == "r3" then 
            if ini.settings.showhp then
                memory.setint16(sampGetBase() + 0x73B20, 0xC390, true)
            else
                memory.setint16(sampGetBase() + 0x73B20, 0x8B55, true)
            end
        end
	end
    if fnc == "ShowNICKS" or fnc == "all" then
        if get_samp_version() == "r1" then
            if ini.settings.shownicks then
                memory.setint16(sampGetBase() + 0x70D40, 0xC390, true)
            else
                memory.setint16(sampGetBase() + 0x70D40, 0x8B55, true)
            end
        elseif get_samp_version() == "r3" then
            if ini.settings.shownicks then
                memory.setint16(sampGetBase() + 0x74C30, 0xC390, true)
            else
                memory.setint16(sampGetBase() + 0x74C30, 0x8B55, true)
            end
        end
	end
    if fnc == "FixCrosshair" or fnc == "all" then
        if ini.settings.fixcrosshair then
            memory.write(0x058E280, 0xEB, 1, true)
        else
            if fnc ~= "all" then
                memory.write(0x058E280, 0x7A, 1, true)
            end
        end
        checkboxes.fixcrosshair[0] = ini.settings.fixcrosshair
	end
    if fnc == "InteriorRun" or fnc == "all" then
        if ini.settings.intrun then
            memory.write(5630064, -1027591322, 4, true)
            memory.write(5630068, 4, 2, true)
        else
            memory.write(5630064, 69485707, 4, true)
            memory.write(5630068, 1165, 2, true)
        end
        checkboxes.intrun[0] = ini.settings.intrun
	end
    if fnc == "FixWaterQuadro" or fnc == "all" then
        if ini.settings.waterfixquadro then
            memory.setfloat(13101856, 0.0, true)
            memory.write(7249056, 13101856, 4, true)
            memory.write(7249115, 13101856, 4, true)
            memory.write(7249175, 13101856, 4, true)
            memory.write(7249235, 13101856, 4, true)
        else
            memory.write(7249056, 8752012, 4, true)
            memory.write(7249115, 8752012, 4, true)
            memory.write(7249175, 8752012, 4, true)
            memory.write(7249235, 8752012, 4, true)
        end
        checkboxes.waterfixquadro[0] = ini.settings.waterfixquadro
	end
    if fnc == "FixLongArm" or fnc == "all" then
        if ini.settings.longarmfix then
            memory.write(7045634, 33807, 2, true)
            memory.write(7046489, 33807, 2, true)
        else
            memory.write(7045634, 59792, 2, true)
            memory.write(7046489, 59792, 2, true)
        end
        checkboxes.longarmfix[0] = ini.settings.longarmfix
	end
    if fnc == "FixBlackRoads" or fnc == "all" then
        if ini.settings.fixblackroads then
            memory.write(8931716, 0, 4, true)
        else
            memory.write(8931716, 2, 4, true)
        end
        checkboxes.fixblackroads[0] = ini.settings.fixblackroads
	end
    if fnc == "FixSensitivity" or fnc == "all" then
        if ini.settings.sensfix then
            memory.write(5382798, 11987996, 4, true)
            memory.write(5311528, 11987996, 4, true)
            memory.write(5316106, 11987996, 4, true)
        else
            memory.write(5382798, 11987992, 4, true)
            memory.write(5311528, 11987992, 4, true)
            memory.write(5316106, 11987992, 4, true)
        end
        checkboxes.sensfix[0] = ini.settings.sensfix
	end
    if fnc == "AudioStream" or fnc == "all" then
        if get_samp_version() == "r1" then
            if ini.settings.audiostream then
                memory.write(sampGetBase() + 104848, 9449, 2, true)-- �������� ����������
            else
                memory.write(sampGetBase() + 104848, 50064, 2, true)-- ��������� ����������
            end
        elseif get_samp_version() == "r3" then
            if ini.settings.audiostream then
                memory.write(sampGetBase() + 0x661F3, 14708, 2, true)-- �������� ����������
            else
                memory.write(sampGetBase() + 0x661F3, 50064, 2, true)-- ��������� ����������
            end
        end
	end
    if fnc == "InteriorMusic" or fnc == "all" then
        if ini.settings.intmusic then
            memory.write(5276752, -591647351, 4, true)
            memory.write(5276756, 182, 2, true)
            memory.write(5277719, -591647351, 4, true)
            memory.write(5277723, 182, 2, true)
        else
            memory.fill(5276752, 144, 6, true)
            memory.fill(5277719, 144, 6, true)
        end
	end
    if fnc == "NoSounds" or fnc == "all" then
        if ini.settings.sounds then
            writeMemory(0x4D89DB, 4, 0x498D03EB, true)--on sounds 
        else
            writeMemory(0x4D89DB, 4, 0x3B1E9, true)--off sounds
            local bs = raknetNewBitStream()
            raknetEmulRpcReceiveBitStream(42, bs)
            raknetDeleteBitStream(bs)
        end
    end
    if fnc == "NoRadio" or fnc == "all" then
        if ini.settings.noradio then
            memory.write(5159328, -1947628715, 4, true)
        else
            memory.write(5159328, -1962933054, 4, true)
        end
	end
    if fnc == "BlockSampKeys" or fnc == "all" then
        if ini.nop_samp_keys.key_F1 then
            writeMemory(sampGetBase() + ((get_samp_version() == "r1") and 0x713DF+1 or 0x752CF+1), 1, 0, true)--disa f1 0.3.7 R1 original byte 0x70
        else
            writeMemory(sampGetBase() + ((get_samp_version() == "r1") and 0x713DF+1 or 0x752CF+1), 1, 0x70, true)--disa f1 0.3.7 R1 original byte 0x70
        end

        if ini.nop_samp_keys.key_PgUp_PgDn then
            writeMemory(sampGetBase() + ((get_samp_version() == "r1") and 0x63700 or 0x66B50), 1, 0xC3, true)
        else
            writeMemory(sampGetBase() + ((get_samp_version() == "r1") and 0x63700 or 0x66B50), 1, 0x56, true)
        end

       
        if ini.nop_samp_keys.key_F4 then
            memory.setint8(sampGetBase() + ((get_samp_version() == "r1") and 0x797E or 0x79A4), 0, true)
        else
            memory.setint8(sampGetBase() + ((get_samp_version() == "r1") and 0x797E or 0x79A4), 115, true)
        end
        if ini.nop_samp_keys.key_F7 then
            memory.fill(sampGetBase() + ((get_samp_version() == "r1") and 0x5D8AD or 0x60C4D), 0xC3, 1, true)
        else
            memory.write(sampGetBase() + ((get_samp_version() == "r1") and 0x5D8AD or 0x60C4D), 0x8B, 1, true)
        end
        if ini.nop_samp_keys.key_T then
            memory.setint8(sampGetBase() + ((get_samp_version() == "r1") and 0x5DB04 or 0x60EA4), 0xC3, true)
            memory.setint8(sampGetBase() + ((get_samp_version() == "r1") and 0x5DAFA or 0x60E9A), 0xC3, true)
        else
            memory.setint8(sampGetBase() + ((get_samp_version() == "r1") and 0x5DB04 or 0x60EA4), 0x852F7574, true)
            memory.setint8(sampGetBase() + ((get_samp_version() == "r1") and 0x5DAFA or 0x60E9A), 0x900A7490, true)
        end
	end
    if fnc == "SunFix" or fnc == "all" then
        if ini.settings.sunfix then
            memory.hex2bin("E865041C00", 0x53C136, 5)
        else
            memory.fill(0x53C136, 0x90, 5, true)
        end
        checkboxes.sunfix[0] = ini.settings.sunfix
    end

    if fnc == "VehicleNames" or fnc == "all" then
        if ini.settings.vehiclenames then
            memory.hex2bin("E8B2B2FFFF", 0x58FBE9, 5) --return draw vehicle names
        else
            memory.hex2bin("9090909090", 0x58FBE9, 5) --return draw vehicle names
        end
    end

    if fnc == "AreaNames" or fnc == "all" then
        if ini.settings.areanames then
            memory.hex2bin('E876FEFFFF', 0x5720A5, 5)
            memory.setuint8(0x58D540, 0x74, true)
        else
            memory.hex2bin('9090909090', 0x5720A5, 5)
        end
    end

    if fnc == "TargetBlip" or fnc == "all" then
        if ini.settings.targetblip then
            memory.write(5497324, 116, 1, true)
        else
            memory.write(5497324, 235, 1, true)
        end
    end
    if fnc == "CleanMemory" then
        local oldram = ("%d"):format(tonumber(get_memory()))
        callFunction(0x53C500, 2, 2, 1, 1)
        --callFunction(0x40D7C0, 1, 1, -1) -- ��� ����-�� � ����� ���. �������� ��-�� ������.
        callFunction(0x53C810, 1, 1, 1)
        callFunction(0x40CF80, 0, 0)
        callFunction(0x4090A0, 0, 0)
        callFunction(0x5A18B0, 0, 0)
        callFunction(0x707770, 0, 0)
        callFunction(0x40CFD0, 0, 0)
        local newram = ("%d"):format(tonumber(get_memory()))
        if ini.cleaner.cleaninfo then
            sampAddChatMessage(script_name.."{FFFFFF} ������ ��: {dc4747}"..oldram.." ��. {FFFFFF}������ �����: {dc4747}"..newram.." ��. {FFFFFF}�������: {dc4747}"..oldram - newram.." ��.", 0x73b461)
        end
    end
    if fnc == "ForceAniso" or fnc == "all" then
        if ini.settings.forceaniso then
            if readMemory(0x730F9C, 1, true) ~= 0 then
                memory.write(0x730F9C, 0, 1, true)-- force aniso
                loadScene(20000000, 20000000, 20000000)
                callFunction(0x40D7C0, 1, 1, -1)
            end
        else
            if readMemory(0x730F9C, 1, true) ~= 1 then
                memory.write(0x730F9C, 1, 1, true)-- force aniso
                loadScene(20000000, 20000000, 20000000)
                callFunction(0x40D7C0, 1, 1, -1)
            end
        end
        checkboxes.forceaniso[0] = ini.settings.forceaniso
    end
    if fnc == "SetBrightness" or fnc == "all" then
        memory.hex2bin(ini.settings.nopgamma and 'E9D200000090' or '0F84D1000000', 0x0074721C, 5)

        memory.setint32(0xBA6784, ini.settings.brightness, true)
        local brightness = cast("float", readMemory(0xBA6784, 4, true) * 0.001953125)
        local CGamma__setGamma = cast("char (__thiscall*)(void*, float, char)", 0x747200)
        CGamma__setGamma(cast("void*", 0xC92134), brightness, true)
    end
    if fnc == "SetDistNickNames" then
        if ini.settings.givemedistnames then
            if tonumber(ini.settings.nickdistance) > tonumber(memory.getfloat(0xFFFC90, true)) then
                memory.setfloat(sampGetServerSettingsPtr() + 39, memory.getfloat(0xFFFC90, true), true)
            else
                memory.setfloat(sampGetServerSettingsPtr() + 39, ini.settings.nickdistance)
            end
        end
    end
    if fnc == "NoLimitMoneyHud" or fnc == "all" then
        if preset["Money"]["nolimitmoneyhud"] then
            writeMemory(0x571784, 4, 0x57C7FFF, true)
            writeMemory(0x57179C, 4, 0x57C7FFF, true)
        else
            writeMemory(0x571784, 4, 0x57C3B9A, true)
            writeMemory(0x57179C, 4, 0x57C3B9A, true)
        end
    end

    if fnc == "SetDistObjects" or fnc == "all" then
        local obj_list = {
            stolbs_and_fonars = {
                [1] = { id = 1283, sdist = 85 },
                [2] = { id = 1262, sdist = 45 },
                [3] = { id = 3516, sdist = 85 },
                [4] = { id = 3855, sdist = 50 },
                [5] = { id = 1278, sdist = 150 },
                [6] = { id = 1290, sdist = 150 },
                [7] = { id = 1307, sdist = 100 },
                [8] = { id = 1308, sdist = 100 },
                [9] = { id = 3459, sdist = 100 },
                [10] = { id = 3463, sdist = 62 },
                [11] = { id = 3503, sdist = 50 },
                [12] = { id = 3854, sdist = 100 },
                [13] = { id = 1226, sdist = 62 },
                [14] = { id = 1223, sdist = 53 },
                [15] = { id = 1231, sdist = 55 },
                [16] = { id = 1232, sdist = 55 },
                [17] = { id = 1284, sdist = 85 },
                [18] = { id = 1294, sdist = 55 },
                [19] = { id = 1315, sdist = 64 },
                [20] = { id = 1350, sdist = 60 },
                [21] = { id = 3853, sdist = 62 },
                [22] = { id = 3875, sdist = 100 },
                [23] = { id = 3460, sdist = 62 },
                [24] = { id = 1297, sdist = 59 },
            },
            musor = {
                [1] = { id = 1265, sdist = 45 },
                [2] = { id = 1440, sdist = 50 },
                [3] = { id = 1230, sdist = 40 },
                [4] = { id = 1438, sdist = 50 },
                [5] = { id = 1220, sdist = 40 },
                [6] = { id = 1221, sdist = 40 },
                [7] = { id = 1264, sdist = 45 },
                [8] = { id = 1224, sdist = 41 },
                [9] = { id = 910, sdist = 30 },
                [10] = { id = 926, sdist = 30 },
                [11] = { id = 928, sdist = 30 },
                [12] = { id = 1372, sdist = 70 },
                [13] = { id = 1357, sdist = 60 },
                [14] = { id = 3594, sdist = 80 },
                [15] = { id = 3593, sdist = 80 },
                [16] = { id = 955, sdist = 30 },
                [17] = { id = 760, sdist = 50 },
                [18] = { id = 682, sdist = 80 },
                [19] = { id = 17592, sdist = 80 },
                [20] = { id = 1415, sdist = 50 },
            },
        }
    
        if ini.settings.givemedistobj then
            for k, v in pairs(obj_list.stolbs_and_fonars) do
                memory.setfloat(getMDO(obj_list.stolbs_and_fonars[k]["id"]), ini.settings.distobjects_stolb_fonars, true)
            end
            for k, v in pairs(obj_list.musor) do
                memory.setfloat(getMDO(obj_list.musor[k]["id"]), ini.settings.distobjects_musor, true)
            end

            for k, v in pairs(objdists) do
                if v ~= nil then
                    local id_obj = v:match("^(%d+).-$")
                    local dist_obj = v:match("^.-([-+]?%d+)$")

                    memory.setfloat(getMDO(tonumber(id_obj)), tonumber(dist_obj), true)
                end
            end

        else
            for k, v in pairs(obj_list.stolbs_and_fonars) do
                memory.setfloat(getMDO(obj_list.stolbs_and_fonars[k]["id"]), obj_list.stolbs_and_fonars[k]["sdist"], true)
            end
            for k, v in pairs(obj_list.musor) do
                memory.setfloat(getMDO(obj_list.musor[k]["id"]), obj_list.musor[k]["sdist"], true)
            end
        end
    end
    if fnc == "MenuImage" or fnc == "all" then
        if preset["MenuPause"]["fullmenuimage"] then
            memory.setfloat(0x57B7EF, preset["MenuPause"]["fullmenuwidth"], true)
            memory.setfloat(0x57B80B, preset["MenuPause"]["fullmenuheight"], true)
            memory.setfloat(0x57B852, preset["MenuPause"]["fullmenuwidth"], true)
            memory.setfloat(0x57B862, preset["MenuPause"]["fullmenuheight"], true)
            memory.setfloat(0x57B877, preset["MenuPause"]["fullmenuwidth"], true)
            memory.setfloat(0x57B88F, 320.0, true)
            memory.setfloat(0x57B8A9, preset["MenuPause"]["fullmenuwidth"], true)
            memory.setfloat(0x57B8BD, preset["MenuPause"]["fullmenuwidth"], true)
            memory.setfloat(0x57B8D5, preset["MenuPause"]["fullmenuheight"], true)
            memory.setfloat(0x57B917, preset["MenuPause"]["fullmenuwidth"], true)
            memory.setfloat(0x57B927, preset["MenuPause"]["fullmenuheight"], true)
        else
            memory.setfloat(0x57B7EF, 256.0, true)
            memory.setfloat(0x57B80B, 256.0, true)
            memory.setfloat(0x57B852, 256.0, true)
            memory.setfloat(0x57B862, 256.0, true)
            memory.setfloat(0x57B877, 128.0, true)
            memory.setfloat(0x57B88F, 128.0, true)
            memory.setfloat(0x57B8A9, 256.0, true)
            memory.setfloat(0x57B8BD, 256.0, true)
            memory.setfloat(0x57B8D5, 256.0, true)
            memory.setfloat(0x57B917, 300.0, true)
            memory.setfloat(0x57B927, 200.0, true)
        end
    end
    if fnc == "FixBloodWood" or fnc == "all" then
        if ini.settings.fixbloodwood then
            writeMemory(0x49EE63+1, 4, 0, true)--fix blood wood
        else
            writeMemory(0x49EE63+1, 4, 0x3F800000, true)--fix blood wood
        end
    end
    if fnc == "EditCrosshair" or fnc == "all" then
       
        if  preset["Crosshair"]["nocrosshaireditsize"] then
            writeMemory(0x609D80, 2, 0x9090, true)
        else
            writeMemory(0x609D80, 2, 0x087A, true)
        end

        local screenX = readMemory(0xC17044, 2, true)
        local screenY = readMemory(0xC17048, 2, true)
        local resolution = getScreenResolution() * 0.0015625;

        local idealX = ( preset["Crosshair"]["crosshairSize"] / screenX) * resolution * 1.1
        local idealY = ( preset["Crosshair"]["crosshairSize"] / screenY) * resolution * 0.85
        local constMemX = 0xFFD934
        local constMemY = 0xFFD938

        writeMemory(constMemX, 4, representFloatAsInt(idealX), true)
        writeMemory(constMemY, 4, representFloatAsInt(idealY), true)
        writeMemory(0x58E2FA+2, 4, constMemX, true)
        writeMemory(0x58E319+2, 4, constMemY, true)
    end
    if fnc == "SetDistLodVeh" or fnc == "all" then
        memory.setfloat(0xCB0900, ini.settings.vehloddist, true)
        memory.write(0x732924+2, 0xCB0900, 4, true)
    end
    if fnc == "HelpText" or fnc == "all" then
        if preset["MenuPause"]["helptext"] then
            memory.fill(0x57E3AE, 0x90, 5, true)-- ���������
        else
            memory.hex2bin("E86DC41900", 0x57E3AE, 5)
        end
    end
    if fnc == "BeginMenu" or fnc == "all" then
        if ini.settings.beginmenu then
            memory.fill(0x579698, 0x90, 5, true)
        else
            memory.hex2bin("E863101A00", 0x579698, 5)
        end
    end
    if fnc == "TreePitching" or fnc == "all" then
        if ini.settings.treepitching then
            memory.fill(0x535030, 0x90, 5, true) -- disable wind effects
        else
            memory.hex2bin("E8DBB82B00", 0x535030, 5)
        end
    end
    if fnc == "OvalityCorrection" or fnc == "all" then
        writeMemory(0x70CEEF, 1, ini.settings.ovalityCorrection and 1 or 0, true)-- ������ ���� � ������ ����� ��� ������ ���� �������.
    end
    if fnc == "UgenrlMode" or fnc == "all" then
        if ini.ugenrl_main.enable then
            if ini.ugenrl_main.mode == 0 then
                memory.hex2bin("752D", 0x503D34, 2)
                writeMemory(0x4D89DB, 4, 0x3B1E9, true)--off sounds
                callFunction(0x507440, 0, 0)
                local bs = raknetNewBitStream()
                raknetEmulRpcReceiveBitStream(42, bs)
                raknetDeleteBitStream(bs)
            elseif ini.ugenrl_main.mode == 1 then
                memory.fill(0x503D34, 0x90, 2, true)
                writeMemory(0x4D89DB, 4, 0x498D03EB, true)--on sounds
                callFunction(0x507440, 0, 0)
            elseif ini.ugenrl_main.mode == 2 then
                memory.hex2bin("752D", 0x503D34, 2)
                writeMemory(0x4D89DB, 4, 0x498D03EB, true)--on sounds
                callFunction(0x507440, 0, 0)
            end
        end
    end
    
    if fnc == "Recolorer" or fnc == "all" then
            if preset["Recolorer"]["Recolorer"] then

                local function convert_color(value)
                    local a, r, g, b = explode_argb(value)
                    return ("0xFF%06X"):format(join_argb(0, b, g, r))  -- ��������� ����� �������� � ������� ABGR � ������������� �����-�������
                end
                
                memory.write(0xBAB22C, convert_color(preset["Recolorer"]["Health"]), 4, false)
                memory.write(0xBAB230, convert_color(preset["Recolorer"]["Money"]), 4, false)
                memory.write(0xBAB244, convert_color(preset["Recolorer"]["Stars"]), 4, false)
                memory.write(0xBAB23C, convert_color(preset["Recolorer"]["Armor"]), 4, false)
                memory.write(0xBAB238, convert_color(preset["Recolorer"]["Patrons"]), 4, false)

                memory.setuint32(sampGetBase() + ((get_samp_version() == "r1") and 0x68B0C or 0x6CA7C), preset["Recolorer"]["PlayerHealth"], true) -- ������ ������� ��
                memory.setuint32(sampGetBase() + ((get_samp_version() == "r1") and 0x68B33 or 0x6CAA3), preset["Recolorer"]["PlayerHealth2"], true) -- ������ ���

                memory.setuint32(sampGetBase() + ((get_samp_version() == "r1") and 0x68DD5 or 0x6CD45), preset["Recolorer"]["PlayerArmor"], true) -- ������ ������� �����
                memory.setuint32(sampGetBase() + ((get_samp_version() == "r1") and 0x68E00 or 0x6CD70), preset["Recolorer"]["PlayerArmor2"], true) -- ������ ���
            
            else
                if fnc ~= "all" then
                    writeMemory(0xBAB22C, 4, -14870092, true)
                    writeMemory(0xBAB230, 4, -13866954, true)
                    writeMemory(0xBAB244, 4, -15703408, true)
                    writeMemory(0xBAB23C, 4, -1973791, true)
                    writeMemory(0xBAB238, 4, -930900, true)

                    writeMemory(sampGetBase() + ((get_samp_version() == "r1") and 0x68B0C or 0x6CA7C), 4, -2088157, true)
                    writeMemory(sampGetBase() + ((get_samp_version() == "r1") and 0x68B33 or 0x6CAA3), 4, -2109489, true)
                end
            end
    end



    if fnc == "PatchDuck" or fnc == "all" then
        if ini.settings.patchduck then
            writeMemory(0x692649+1, 1, 6, true)--patch anim duck
        else
            writeMemory(0x692649+1, 1, 8, true)--patch anim duck
        end
    end
    if fnc == "AntiCrash" or fnc == "all" then
        if ini.settings.anticrash then
            if get_samp_version() == "r1" then
                local base = sampGetBase() + 0x5CF2C
                writeMemory(base, 4, 0x90909090, true)
                base = base + 4
                writeMemory(base, 1, 0x90, true)
                base = base + 9
                writeMemory(base, 4, 0x90909090, true)
                base = base + 4
                writeMemory(base, 1, 0x90, true)
            elseif get_samp_version() == "r3" then
                local base = sampGetBase() + 0x602CC
                writeMemory(base, 4, 0x90909090, true)
                base = base + 4
                writeMemory(base, 1, 0x90, true)
                base = base + 9
                writeMemory(base, 4, 0x90909090, true)
                base = base + 4
                writeMemory(base, 1, 0x90, true)
            end
        end
    end
    if fnc == "FixArrowPassMotoBike" or fnc == "all" then
        if ini.settings.FixArrowPassMotoBike then
            memory.fill(0x6B795F, 0x90, 20, true)
        else
            if fnc ~= "all" then
                memory.hex2bin("0F84FF0200008B866404000085C00F85F1020000", 0x6B795F, 20)
            end
        end
    end
    if fnc == "InterfaceElementEditor" or fnc == "all" then
        writeMemory(0xEDDFAF, 4, representFloatAsInt(preset["MenuPause"]["speedinputsmap"]), true)
        local MapOptionInputs = {
            [1] = 0x577679+2, [2] = 0x5779A8+2,
            [3] = 0x577E70+2, [4] = 0x578320+2,
            [5] = 0x5784B5+2, [6] = 0x578650+2
        }
        for i = 1, #MapOptionInputs do
            writeMemory(MapOptionInputs[i], 4, 0xEDDFAF, true)
        end

        if preset["MenuPause"]["mapzoom"] then
            memory.setfloat(5719357, preset["MenuPause"]["mapzoomvalue"], true)
        else
            memory.setfloat(5719357, 1000.0, true)
        end

        if preset["MenuPause"]["arrowicon_menu"] then
            writeMemory(0x57A5B7, 4, 0x00, true)
        else
            writeMemory(0x57A5B7, 4, 0xFF, true)--disable arrow menu icon left
        end

        writeMemory(0x5799AC+1, 1, preset["MenuPause"]["fontmenubasestyle"], true) -- ����� ��������� ������ ����
        writeMemory(0x573F6D+1, 1, preset["MenuPause"]["fontmenubasestyle"], true) -- ����� ��������� ������ ����
        writeMemory(0x57958A+1, 1, preset["MenuPause"]["fontmenuheaderstyle"], true) -- ����� ������ ��������� ����
        writeMemory(0x57A20A+1, 1, preset["MenuPause"]["fontmenutumblerstyle"], true) -- ����� ������ ��������� � ����
        

        local sizeiconmap = {
            [1] = { mem = 0x586047, nmem = 0xCB0650, val = preset["Radar"]["osnov_icon"], sval = 8.0 }, --������
            [2] = { mem = 0x586060, nmem = 0xCB0655, val = preset["Radar"]["osnov_icon"], sval = 8.0 }, --������
            [3] = { mem = 0x584192, nmem = 0xCB0665, val = 0.0015625 / preset["Radar"]["quadro_icon_size"], sval = 0.0015625 }, -- X  ���������� ������
            [4] = { mem = 0x5841B2, nmem = 0xCB0670, val = 0.00203125 / preset["Radar"]["quadro_icon_size"], sval = 0.00203125 }, -- Y ���������� ������
            [5] = { mem = 0x58410D, nmem = 0xCB0675, val = 0.0016471354 / preset["Radar"]["quadro_icon_border"], sval = 0.0016471354}, -- ������� X ���������� ������
            [6] = { mem = 0x58412D, nmem = 0xCB0680, val = 0.00214843762 / preset["Radar"]["quadro_icon_border"], sval = 0.00214843762}, -- ������� Y ���������� ������
            [7] = { mem = 0x5842E8, nmem = 0xCB0685, val = 0.0015625 / preset["Radar"]["trianglen_icon_size"], sval = 0.0015625 }, -- ����������� ������ ���� X
            [8] = { mem = 0x5842C8, nmem = 0xCB0690, val = 0.00203125 / preset["Radar"]["trianglen_icon_size"], sval = 0.00203125 }, -- ����������� ������ ���� Y
            [9] = { mem = 0x58424B, nmem = 0xCB0695, val = 0.0016471354 / preset["Radar"]["trianglen_icon_border"], sval = 0.0016471354}, -- ������� X ����������� ������ ����
            [10] = { mem = 0x584209, nmem = 0xCB0700, val = 0.00214843762 / preset["Radar"]["trianglen_icon_border"], sval = 0.00214843762}, -- ������� Y ����������� ������ ����
            [11] = { mem = 0x584436, nmem = 0xCB0705, val = 0.0015625 / preset["Radar"]["trianglev_icon_size"], sval = 0.0015625 }, -- ����������� ������ ����� X
            [12] = { mem = 0x58440E, nmem = 0xCB0710, val = 0.00203125 / preset["Radar"]["trianglev_icon_size"], sval = 0.00203125}, -- ����������� ������ ����� Y
            [13] = { mem = 0x58439E, nmem = 0xCB0715, val = 0.0016471354 / preset["Radar"]["trianglev_icon_border"], sval = 0.0016471354}, -- ����������� ������ �����  ������� X
            [14] = { mem = 0x584348, nmem = 0xCB0720, val = 0.00214843762 / preset["Radar"]["trianglev_icon_border"], sval = 0.00214843762}, -- ����������� ������ �����  ������� Y
            [15] = { mem = 0x5886DC, nmem = 0xCB0725, val = preset["Radar"]["player_icon_size"], sval = 7.5 }, --����� �� �����
            [16] = { mem = 0x584A02, nmem = 0xCB0730, val = preset["Radar"]["arrowmap_size"], sval = 25.0 }, --������ arrow X 25 std
            [17] = { mem = 0x584A1A, nmem = 0xCB0735, val = preset["Radar"]["arrowmap_size"], sval = 25.0 }, --������ arrow Y 25 std
        }
        if preset["Radar"]["smalliconsradar"] then
            for i = 1, #sizeiconmap do
                memory.setfloat(sizeiconmap[i]["nmem"], sizeiconmap[i]["val"], true)-- ����� �������� � ��������� ������
                memory.write(sizeiconmap[i]["mem"], sizeiconmap[i]["nmem"], 4, true)--��������� �� ��������� ������
            end
        else
            for i = 1, #sizeiconmap do
                memory.setfloat(sizeiconmap[i]["nmem"], sizeiconmap[i]["sval"], true)-- ����� �������� � ��������� ������
                memory.write(sizeiconmap[i]["mem"], sizeiconmap[i]["nmem"], 4, true)--��������� �� ��������� ������
            end
        end

        if preset["Radar"]["radrarnorth"] then
            memory.fill(0x588188, 0x90, 5, true)
        else
            memory.hex2bin('E863DEFFFF', 0x588188, 5)
        end

        writeMemory(0x58F57E+1, 1, preset["Money"]["fontmoneystyle"], true)

        writeMemory(0x58F58D, 1, preset["Money"]["fontmoneyborder"], true)

        if preset["Money"]["animmoney"] == 0 then
            memory.write(5707667, 138, 1, true)
        elseif preset["Money"]["animmoney"] == 1 then
            memory.write(5707667, 137, 1, true)
        elseif preset["Money"]["animmoney"] == 2 then
            memory.write(5707667, 139, 1, true)
        end

        if preset["Money"]["moneyzerofix"] then
            memory.copy(0x866C94, memory.strptr('$%d'), 6, true)
            memory.copy(0x866C8C, memory.strptr('$-%d'), 6, true)
        else
            memory.copy(0x866C94, memory.strptr('$%08d'), 6, true)
            memory.copy(0x866C8C, memory.strptr('-$%08d'), 6, true)
        end
        
        
        if preset["Patrons"]["EditPatrons"] then
            memory.setfloat(0xCF1010, preset["Patrons"]["posPatronsX"], true) -- pos patrons x 47.0
            memory.write(0x58FA10 + 2, 0xCF1010, 4, true) -- pos patrons x 47.0

            memory.setfloat(0xCF1035, preset["Patrons"]["posPatronsY"], true) -- pos patrons Y 43.0
            memory.write(0x58F9E4+2, 0xCF1035, 4, true)

            memory.setfloat(0xCF1230, preset["Patrons"]["sizePatronsX"], true) -- ������ ������ 0.30000001
            memory.write(0x5894CB+2, 0xCF1230, 4, true)

            memory.setfloat(0xCF2125, preset["Patrons"]["sizePatronsY"], true) -- ������ ������ 0.7
            memory.write(0x5894B5+2, 0xCF2125, 4, true)
            

            if preset["Patrons"]["renderammo"] then
                writeMemory(0x589477, 2, 0x5150, true)
            else
                writeMemory(0x589477, 2, 0x5051, true)
            end

            if preset["Patrons"]["singleclip"] then
                writeMemory(0x5893DF, 4, 0x90909090, true)
            else
                writeMemory(0x5893DF, 4, 0x2040BF0F, true)
            end

            if preset["Patrons"]["EternalPatrons"] then
                writeMemory(0x5895EB, 2, 0x9090, true)
                memory.fill(0x589591, 0x90, 6, true)
                
            else
                writeMemory(0x5895EB, 2, 0x557E, true)
                memory.hex2bin("0F84AB000000", 0x589591, 6)
            end
            


            writeMemory(0x58952A+1, 1, preset["Patrons"]["fontammostyle"], true)

        else
            if fnc ~= "all" then
                memory.setfloat(0xCF1010, 47.0, true) -- pos patrons x 47.0
                memory.write(0x58FA10+2, 0xCF1010, 4, true) -- pos patrons x 47.0
    
                memory.setfloat(0xCF1035, 43.0, true) -- pos patrons Y 43.0
                memory.write(0x58F9E4+2, 0xCF1035, 4, true)
    
                memory.setfloat(0xCF1230, 0.30, true) -- ������ ������ 0.30000001
                memory.write(0x5894CD, 0xCF1230, 4, true)
    
                memory.setfloat(0xCF2125, 0.70, true) -- ������ ������ 0.7
                memory.write(0x5894B5+2, 0xCF2125, 4, true)
                writeMemory(0x58952A+1, 1, 1, true)
                writeMemory(0x589477, 2, 0x5051, true)
            end
        end
        if preset["Health"]["EditHealth"] then

           

            if preset["Health"]["nohealthflick"] then
                writeMemory(0x5892AB, 1, 0, true) --  0 on 10 off
            else
                writeMemory(0x5892AB, 1, 10, true) --  0 on 10 off
            end

            memory.setfloat(0xCF1045, -preset["Health"]["posHealthX"], true) -- pos health bar X 141.0
            memory.write(0x58EE85+2, 0xCF1045, 4, true)
    
            memory.setfloat(0xCF1050, preset["Health"]["posHealthY"], true) -- pos health bar Y 77.0
            memory.write(0x58EE66+2, 0xCF1050, 4, true)
    
            memory.setfloat(0xCF1055, preset["Health"]["sizeHealthX"], true) -- ������ ������� �� 109.0
            memory.write(0x5892D8, 0xCF1055, 4, true)
    
            memory.setfloat(0xCF1060, preset["Health"]["sizeHealthY"], true) -- ������ ������� �� 9.0
            memory.write(0x589358, 0xCF1060, 4, true)

            memory.write(0x589352+1, preset["Health"]["healthborder"] and 1 or 0--[[ 1 on 0 off]], 1, true) -- ������� ��������
        else
            if fnc ~= "all" then
                memory.setfloat(0xCF1045, 141.0, true) -- pos health bar X 141.0
                memory.write(0x58EE85+2, 0xCF1045, 4, true)
        
                memory.setfloat(0xCF1050, 77.0, true) -- pos health bar Y 77.0
                memory.write(0x58EE66+2, 0xCF1050, 4, true)
        
                memory.setfloat(0xCF1055, 109.0, true) -- ������ ������� �� 109.0
                memory.write(0x5892D8, 0xCF1055, 4, true)
        
                memory.setfloat(0xCF1060, 9.0, true) -- ������ ������� �� 9.0
                memory.write(0x589358, 0xCF1060, 4, true)
                memory.write(0x589352+1, 1--[[ 1 on 0 off]], 1, true) -- ������� ��������
            end
        end
        
        if preset["Money"]["EditMoney"] then
            
            
            memory.setfloat(0xCF1105, -preset["Money"]["posMoneyX"], true) -- ������� ����� X 32.0
            memory.write(0x58F5FA+2, 0xCF1105, 4, true)
    
            memory.setfloat(0xCF1110, preset["Money"]["posMoneyY"], true) -- ������� ����� Y 89.0
            memory.write(0x58F5DA+2, 0xCF1110, 4, true)
    
            memory.setfloat(0xCF1115, preset["Money"]["sizeMoneyX"], true) -- ������ ����� 0.55000001  
            memory.write(0x58F562+2, 0xCF1115, 4, true)
    
            memory.setfloat(0xCF1120, preset["Money"]["sizeMoneyY"], true) -- ������ ����� 1.1
            memory.write(0x58F54C+2, 0xCF1120, 4, true)

           
        else
            if fnc ~= "all" then
                memory.setfloat(0xCF1105, 32.0, true) -- ������� ����� X 32.0
                memory.write(0x58F5FA+2, 0xCF1105, 4, true)
        
                memory.setfloat(0xCF1110, 89.0, true) -- ������� ����� Y 89.0
                memory.write(0x58F5DA+2, 0xCF1110, 4, true)
        
                memory.setfloat(0xCF1115, 0.550, true) -- ������ ����� 0.55000001  
                memory.write(0x58F562+2, 0xCF1115, 4, true)
        
                memory.setfloat(0xCF1120, 1.1, true) -- ������ ����� 1.1
                memory.write(0x58F54C+2, 0xCF1120, 4, true)
            end
        end
        
        if preset["Breath"]["EditBreath"] then
            memory.setfloat(0xCF1125, -preset["Breath"]["posBreathX"], true) -- ������� ��������� X 94.0
            memory.write(0x58F11D+2, 0xCF1125, 4, true)

            memory.setfloat(0xCF1130, preset["Breath"]["posBreathY"], true) -- ������� ��������� Y 62.0
            memory.write(0x58F0FE+2, 0xCF1130, 4, true)

            memory.setfloat(0xCF1135, preset["Breath"]["sizeBreathX"], true) -- ������ ��������� X 62.0
            memory.write(0x589233+2, 0xCF1135, 4, true)

            memory.setfloat(0xCF1140, preset["Breath"]["sizeBreathY"], true) -- ������ ��������� Y 9.0
            memory.write(0x58921C+2, 0xCF1140, 4, true)
            
            memory.write(0x589206+1, preset["Breath"]["breathborder"] and 1 or 0--[[ 1 on 0 off]], 1, true) -- ������� ���������

            writeMemory(0x58F0D9, 2, preset["Breath"]["eternalBreath"] and 0x9090 or 0x6474, true) -- ������ ��������
        else
            if fnc ~= "all" then
                memory.setfloat(0xCF1130, 94.0, true) -- ������� ��������� X 94.0
                memory.write(0x58F11D+2, 0xCF1130, 4, true)

                memory.setfloat(0xCF1135, 62.0, true) -- ������� ��������� Y 62.0
                memory.write(0x58F0FE+2, 0xCF1135, 4, true)

                memory.setfloat(0xCF1140, 9.0, true) -- ������ ��������� Y 9.0
                memory.write(0x58921C+2, 0xCF1140, 4, true)
            end
        end
        
        if preset["Armor"]["EditArmor"] then

            if preset["Armor"]["eternalArmor"] then
                memory.fill(0x5890DC, 0x90, 6, true)
            else
                if fnc ~= "all" then
                    memory.hex2bin("0F85A1000000", 0x5890DC, 6)
                end
            end

           

            memory.setfloat(0xCF1145, -preset["Armor"]["posArmorX"], true) -- ������� ����� X 94.0
            memory.write(0x58EF57+2, 0xCF1145, 4, true)

            memory.setfloat(0xCF1150, preset["Armor"]["posArmorY"], true) -- ������� ����� Y 48.0
            memory.write(0x58EF38+2, 0xCF1150, 4, true)

            memory.setfloat(0xCF1155, preset["Armor"]["sizeArmorX"], true) -- ������ ����� X 62.0
            memory.write(0x58915B+2, 0xCF1155, 4, true)

            memory.setfloat(0xCF1160, preset["Armor"]["sizeArmorY"], true) -- ������ ����� Y 9.0
            memory.write(0x589144+2, 0xCF1160, 4, true)

            memory.write(0x589122+1, preset["Armor"]["armorborder"] and 1 or 0--[[ 1 on 0 off]], 1, true) -- ������� �����
        else
            if fnc ~= "all" then
                memory.setfloat(0xCF1145, 94.0, true) -- ������� ����� X 94.0
                memory.write(0x58EF57+2, 0xCF1145, 4, true)
    
                memory.setfloat(0xCF1150, 48.0, true) -- ������� ����� Y 48.0
                memory.write(0x58EF38+2, 0xCF1150, 4, true)

                memory.setfloat(0xCF1155, 62.0, true) -- ������ ����� X 62.0
                memory.write(0x58915B+2, 0xCF1155, 4, true)

                memory.setfloat(0xCF1160, 9.0, true) -- ������ ����� Y 9.0
                memory.write(0x589144+2, 0xCF1160, 4, true)
            end
        end
        
        if preset["Weapon"]["EditWeapon"] then
            memory.setfloat(0xCF1000, preset["Weapon"]["sizeWeaponX"], true) -- weapon icon size X 47.0
            memory.setfloat(0xCF1005, preset["Weapon"]["sizeWeaponY"], true) -- weapon icon size Y 58.0
            memory.write(0x58D8C9 + 2, 0xCF1000, 4, true) -- weapon icon size X
            memory.write(0x58D894 + 2, 0xCF1005, 4, true) -- weapon icon size Y
            memory.write(0x58D933 + 2, 0xCF1000, 4, true) -- size icon fist x 47.0
            memory.write(0x58D94B + 2, 0xCF1005, 4, true) -- size icon fist y 58.0
            
            memory.setfloat(0xCF1025, -preset["Weapon"]["posWeaponX"], true) -- pos weapon&fist X 32.0
            memory.write(0x58F925+2, 0xCF1025, 4, true)
    
            memory.setfloat(0xCF1030, preset["Weapon"]["posWeaponY"], true) --  pos weapon&fist Y 20.0
            memory.write(0x58F911+2, 0xCF1030, 4, true)
        else
            if fnc ~= "all" then
                memory.setfloat(0xCF1025, 32.0, true) -- pos weapon&fist X 32.0
                memory.write(0x58F925+2, 0xCF1025, 4, true)
        
                memory.setfloat(0xCF1030, 20.0, true) --  pos weapon&fist Y 20.0
                memory.write(0x58F911+2, 0xCF1030, 4, true)

                memory.setfloat(0xCF1000, 47.0, true) -- weapon icon size X 47.0
                memory.setfloat(0xCF1005, 58.0, true) -- weapon icon size Y 58.0
                memory.write(0x58D8C9 + 2, 0xCF1000, 4, true) -- weapon icon size X
                memory.write(0x58D894 + 2, 0xCF1005, 4, true) -- weapon icon size Y
                memory.write(0x58D933 + 2, 0xCF1000, 4, true) -- size icon fist x 47.0
                memory.write(0x58D94B + 2, 0xCF1005, 4, true) -- size icon fist y 58.0


            end
        end
        
        if preset["Wanted"]["EditWanted"] then
            if preset["Wanted"]["eternalwanted"] then
                writeMemory(0x58DD1B, 2, 0x9090, true)
            else
                if fnc ~= "all" then
                    writeMemory(0x58DD1B, 2, 0x097E, true)
                end
            end

            memory.setfloat(0xCAECFA, preset["Wanted"]["spaceWanted"], true)
            writeMemory(0x58DFEB+2, 4, 0xCAECFA, true)
            

            memory.setfloat(0xCF1250, -preset["Wanted"]["posWantedX"], true) -- ������� ������� X 29.0
            memory.write(0x58DD0D+2, 0xCF1250, 4, true)

            memory.setfloat(0xCF1255, preset["Wanted"]["posWantedY"], true) -- ������� ������� Y 114.0
            memory.write(0x58DDFA+2, 0xCF1255, 4, true)
            memory.write(0x58DFB1+2, 0xCF1255, 4, true)

           


            memory.setfloat(0xCF1260, preset["Wanted"]["sizeWantedX"], true) -- ������ ������� X 0.60
            memory.write(0x58DD84+2, 0xCF1260, 4, true)
            memory.write(0x58DF77+2, 0xCF1260, 4, true)
            
           
            

            memory.setfloat(0xCF1265, preset["Wanted"]["sizeWantedY"], true) -- ������ ������� Y 1.21
            memory.write(0x58DD6E+2, 0xCF1265, 4, true)
            memory.write(0x58DF5B+2, 0xCF1265, 4, true)

        else
            if fnc ~= "all" then
                memory.setfloat(0xCF1250, 29.0, true) -- ������� ������� X 29.0
                memory.write(0x58DD0D+2, 0xCF1250, 4, true)

                memory.setfloat(0xCF1255, 114.0, true) -- ������� ������� Y 114.0
                memory.write(0x58DDFA+2, 0xCF1255, 4, true)

                memory.setfloat(0xCF1275, 12.0, true) -- ������� ������� ������� Y 12.0
                memory.write(0x58DF29+2, 0xCF1275, 4, true)
                

                memory.setfloat(0xCF1260, 0.60, true) -- ������ ������� X 0.60
                memory.write(0x58DD84+2, 0xCF1260, 4, true)

                memory.setfloat(0xCF1265, 1.21, true) -- ������ ������� Y 1.21
                memory.write(0x58DD6E+2, 0xCF1265, 4, true)
    
            end
        end
        
        if preset["Clock"]["EditClock"] then
            if preset["Clock"]["DrawClock"] then
                memory.hex2bin("253032643A2530326400", 0x859A6C, 10)
                memory.hex2bin("E8DABA1800", 0x58EC21, 5)
            else
                if fnc ~= "all" then
                    memory.hex2bin("00000000000000000000", 0x859A6C, 10)
                    memory.fill(0x58EC21, 0x90, 5, true)
                end
            end
            memory.setfloat(0xCF1280, -preset["Clock"]["posClockX"], true) -- ������� X 32.0
            memory.write(0x58EC14+2, 0xCF1280, 4, true)

            memory.setfloat(0xCF1285, preset["Clock"]["posClockY"], true) -- ������� Y 22.0
            memory.write(0x58EC02+2, 0xCF1285, 4, true)

            memory.setfloat(0xCF1290, preset["Clock"]["sizeClockY"], true) -- ������ Y 0.55
            memory.write(0x58EB2F+2, 0xCF1290, 4, true)

            memory.setfloat(0xCF1295, preset["Clock"]["sizeClockX"], true) -- ������ X 1.1
            memory.write(0x58EB45+2, 0xCF1295, 4, true)


            writeMemory(0x58EB5A+1, 1, preset["Clock"]["fontstyleclock"], true)-- font style clock

            writeMemory(0x58EB6F+1, 1, preset["Clock"]["fontoutlineclock"], true)

            writeMemory(0x0058EB53+1, 1, 1, true)

    
        else
            if fnc ~= "all" then
                memory.setfloat(0xCF1280, 32.0, true) -- ������� X 32.0
                memory.write(0x58EC14+2, 0xCF1280, 4, true)

                memory.setfloat(0xCF1285, 22.0, true) -- ������� Y 22.0
                memory.write(0x58EC02+2, 0xCF1285, 4, true)

                memory.setfloat(0xCF1290, 1.1, true) -- ������ Y 0.55
                memory.write(0x58EB2F+2, 0xCF1290, 4, true)
    
                memory.setfloat(0xCF1295, 0.55, true) -- ������ X 1.1
                memory.write(0x58EB45+2, 0xCF1295, 4, true)

            end
        end
        memory.setuint8(0x5864BC+1, preset["Radar"]["radaralpha"], true)

        if preset["Radar"]["radar_color_fix"] then
            memory.write(0x58A798, 255, 1, true)
            memory.write(0x58A790, 255, 1, true)
            memory.write(0x58A78E, 255, 1, true)
            memory.write(0x58A89A, 255, 1, true)
            memory.write(0x58A896, 255, 1, true)
            memory.write(0x58A894, 255, 1, true)
            memory.write(0x58A8EE, 255, 1, true)
            memory.write(0x58A8E6, 255, 1, true)
            memory.write(0x58A8DE, 255, 1, true)
            memory.write(0x58A9A2, 255, 1, true)
            memory.write(0x58A99A, 255, 1, true)
            memory.write(0x58A996, 255, 1, true)
        else
            if fnc ~= "all" then
                memory.write(0x58A798, 0, 1, true)
                memory.write(0x58A790, 0, 1, true)
                memory.write(0x58A78E, 0, 1, true)
                memory.write(0x58A89A, 0, 1, true)
                memory.write(0x58A896, 0, 1, true)
                memory.write(0x58A894, 0, 1, true)
                memory.write(0x58A8EE, 0, 1, true)
                memory.write(0x58A8E6, 0, 1, true)
                memory.write(0x58A8DE, 0, 1, true)
                memory.write(0x58A9A2, 0, 1, true)
                memory.write(0x58A99A, 0, 1, true)
                memory.write(0x58A996, 0, 1, true)
            end
        end

        if preset["Radar"]["radarfix"] then
            --fix rounded blips in radar
            local screenX = readMemory(0xC17044, 2, true)
            local screenY = readMemory(0xC17048, 2, true)
            local resolution = getScreenResolution() * 0.0015625;
            local sizeBlips = 1.0
            local constMemX = 0xFFACFF + 15
            local constMemY = 0xFFACFF + 20

            local idealX = (sizeBlips / screenX) * resolution * 1.0
            local idealY = (sizeBlips / screenY) * resolution * 1.0
            writeMemory(constMemX, 4, representFloatAsInt(idealX), false)
            writeMemory(constMemY, 4, representFloatAsInt(idealY), false)

            --[[writeMemory(0x5876D4+2, 4, constMemX, true)--Blips X
            writeMemory(0x58774B+2, 4, constMemX, true)--Blips X
            writeMemory(0x58780A+2, 4, constMemX, true)--Blips X
            writeMemory(0x58788F+2, 4, constMemX, true)--Blips X
            writeMemory(0x58792E+2, 4, constMemX, true)--Blips X
            writeMemory(0x587A1A+2, 4, constMemX, true)--Blips X
            writeMemory(0x587AAA+2, 4, constMemX, true)--Blips X]]
            writeMemory(0x58808D+2, 4, constMemX, true)--Blips X
            writeMemory(0x5886CC+2, 4, constMemX, true)--Blips X

            --[[writeMemory(0x5876BC+2, 4, constMemY, true)--Blips Y
            writeMemory(0x587733+2, 4, constMemY, true)--Blips Y
            writeMemory(0x587916+2, 4, constMemY, true)--Blips Y
            writeMemory(0x587A02+2, 4, constMemY, true)--Blips Y
            writeMemory(0x587A92+2, 4, constMemY, true)--Blips Y
            writeMemory(0x588060+2, 4, constMemY, true)--Blips Y
            writeMemory(0x588294+2, 4, constMemY, true)--Blips Y]]
            writeMemory(0x58603F+2, 4, constMemX, true)--Blips X
            writeMemory(0x586058+2, 4, constMemY, true)--Blips Y


            --=========================================
            memory.setfloat(0xCAE000, preset["Radar"]["radarPosX"], true)
            local radarPosX = {
                [1] = 0x58A79B, [2] = 0x5834D4, [3] =0x58A836, [4] = 0x58A8E9, [5] = 0x58A98A,
                [6] = 0x58A469, [7] = 0x58A5E2, [8] = 0x58A6E6, [9] = 0x58A467+2,
            }
            for i = 0, #radarPosX do
                writeMemory(radarPosX[i], 4, 0xCAE000, true)
            end

            memory.setfloat(0xCAE005, preset["Radar"]["radarPosY"], true)
            local radarPosY = {
                [1] = 0x58A7C7, [2] = 0x58A868, [3] = 0x58A913, [4] = 0x58A9C7, [5] = 0x583500,
                [6] = 0x58A499, [7] = 0x58A60E, [8] = 0x58A71E, [9] = 0x58A497+2,
            }
            for i = 0, #radarPosY do
                writeMemory(radarPosY[i], 4, 0xCAE005, true)
            end

            if not preset["Radar"]["roundedRadar"] then
                memory.setfloat(0xCAE010, preset["Radar"]["radarWidth"], true)
                local radarWidth = {
                    [1] = 0x58A47D, [2] = 0x58A632, [3] = 0x58A6AB, [4] = 0x58A70E, [5] = 0x58A801,
                    [6] = 0x58A8AB, [7] = 0x58A921, [8] = 0x58A9D5, [9] = 0x5834F6, [10] = 0x58A47B+2,
                }
                for i = 0, #radarWidth do
                    writeMemory(radarWidth[i], 4, 0xCAE010, true)
                end

                memory.setfloat(0xCAE015, preset["Radar"]["radarHeight"], true)
                local radarHeight = {
                    [1] = 0x5834C2, [2] = 0x58A449, [3] = 0x58A7E9, [4] = 0x58A840, [5] = 0x58A943,
                    [6] = 0x58A99D, [7] = 0x58A447+2
                }
                for i = 0, #radarHeight do
                    writeMemory(radarHeight[i], 4, 0xCAE015, true)
                end

                local constMemX = 0xFFACEF
                writeMemory(constMemX, 4, representFloatAsInt(0.0015625), false)
                writeMemory(0x5834BC, 4, constMemX, false)
                writeMemory(0x58A443, 4, constMemX, false)
                writeMemory(0x58A5DA, 4, constMemX, false)
                writeMemory(0x58A6E0, 4, constMemX, false)
                writeMemory(0x58A793, 4, constMemX, false)
                writeMemory(0x58A830, 4, constMemX, false)
                writeMemory(0x58A8E1, 4, constMemX, false)
                writeMemory(0x58A984, 4, constMemX, false)
                writeMemory(0x58A984, 4, constMemX, false)

                local constMemY = 0xFFACEF + 5
                writeMemory(constMemY, 4, representFloatAsInt(0.002232143), false)
                writeMemory(0x5834EC+2, 4, constMemY, false)
                writeMemory(0x58A473+2, 4, constMemY, false)
                writeMemory(0x58A600+2, 4, constMemY, false)
                writeMemory(0x58A69E+2, 4, constMemY, false)
                writeMemory(0x58A704+2, 4, constMemY, false)
                writeMemory(0x58A7B9+2, 4, constMemY, false)
                writeMemory(0x58A85A+2, 4, constMemY, false)
                writeMemory(0x58A909+2, 4, constMemY, false)
                writeMemory(0x58A9BD+2, 4, constMemY, false)
                writeMemory(0x58A9BD+2, 4, constMemY, false)
                --=====================================================================================
            end
            if preset["Radar"]["roundedRadar"] then
                local screenX = readMemory(0xC17044, 2, true)
                local screenY = readMemory(0xC17048, 2, true)
                local resolution = getScreenResolution() * 0.0015625;

                --================================ [ Radar ] ============================================

                local idealX = (preset["Radar"]["roundedRadarSize"] / screenX) * resolution * 0.8
                local constMemX = 0xFFACEF
                writeMemory(constMemX, 4, representFloatAsInt(idealX), false)
                writeMemory(0x5834BC, 4, constMemX, false)
                writeMemory(0x58A443, 4, constMemX, false)
                writeMemory(0x58A5DA, 4, constMemX, false)
                writeMemory(0x58A6E0, 4, constMemX, false)
                writeMemory(0x58A793, 4, constMemX, false)
                writeMemory(0x58A830, 4, constMemX, false)
                writeMemory(0x58A8E1, 4, constMemX, false)
                writeMemory(0x58A984, 4, constMemX, false)
                writeMemory(0x58A984, 4, constMemX, false)

                local constMemY = 0xFFACEF + 5
                local idealY = (preset["Radar"]["roundedRadarSize"] / screenY) * resolution * 0.965
                writeMemory(constMemY, 4, representFloatAsInt(idealY), false)
                writeMemory(0x5834EC+2, 4, constMemY, false)
                writeMemory(0x58A473+2, 4, constMemY, false)
                writeMemory(0x58A600+2, 4, constMemY, false)
                writeMemory(0x58A69E+2, 4, constMemY, false)
                writeMemory(0x58A704+2, 4, constMemY, false)
                writeMemory(0x58A7B9+2, 4, constMemY, false)
                writeMemory(0x58A85A+2, 4, constMemY, false)
                writeMemory(0x58A909+2, 4, constMemY, false)
                writeMemory(0x58A9BD+2, 4, constMemY, false)
                writeMemory(0x58A9BD+2, 4, constMemY, false)
                --=====================================================================================

                memory.setfloat(0xCAE010, 76.0, true)
                local radarWidth = {
                    [1] = 0x58A47D, [2] = 0x58A632, [3] = 0x58A6AB, [4] = 0x58A70E, [5] = 0x58A801,
                    [6] = 0x58A8AB, [7] = 0x58A921, [8] = 0x58A9D5, [9] = 0x5834F6, [10] = 0x58A47B+2,
                }
                for i = 0, #radarWidth do
                    writeMemory(radarWidth[i], 4, 0xCAE010, true)
                end

                memory.setfloat(0xCAE015, 94.0, true)
                local radarHeight = {
                    [1] = 0x5834C2, [2] = 0x58A449, [3] = 0x58A7E9, [4] = 0x58A840, [5] = 0x58A943,
                    [6] = 0x58A99D, [7] = 0x58A447+2
                }
                for i = 0, #radarHeight do
                    writeMemory(radarHeight[i], 4, 0xCAE015, true)
                end

            end
        

        else
            if fnc ~= "all" then

                memory.setfloat(0xCAE000, 40.0, true)
                local radarPosX = {
                    [1] = 0x58A79B, [2] = 0x5834D4, [3] = 0x58A836, [4] = 0x58A8E9, [5] = 0x58A98A,
                    [6] = 0x58A469, [7] = 0x58A5E2, [8] = 0x58A6E6, [9] = 0x58A467+2,
                }
                for i = 0, #radarPosX do
                    writeMemory(radarPosX[i], 4, 0xCAE000, true)
                end

                memory.setfloat(0xCAE005, 104.0, true)
                local radarPosY = {
                    [1] = 0x58A7C7, [2] = 0x58A868, [3] = 0x58A913, [4] = 0x58A9C7, [5] = 0x583500,
                    [6] = 0x58A499, [7] = 0x58A60E, [8] = 0x58A71E, [9] = 0x58A497+2,
                }
                for i = 0, #radarPosY do
                    writeMemory(radarPosY[i], 4, 0xCAE005, true)
                end

                memory.setfloat(0xCAE010, 76.0, true)
                local radarWidth = {
                    [1] = 0x58A47D, [2] = 0x58A632, [3] = 0x58A6AB, [4] = 0x58A70E, [5] = 0x58A801,
                    [6] = 0x58A8AB, [7] = 0x58A921, [8] = 0x58A9D5, [9] = 0x5834F6, [10] = 0x58A47B+2,
                }
                for i = 0, #radarWidth do
                    writeMemory(radarWidth[i], 4, 0xCAE010, true)
                end

                memory.setfloat(0xCAE015, 94.0, true)
                local radarHeight = {
                    [1] = 0x5834C2, [2] = 0x58A449, [3] = 0x58A7E9, [4] = 0x58A840, [5] = 0x58A943,
                    [6] = 0x58A99D, [7] = 0x58A447+2
                }
                for i = 0, #radarHeight do
                    writeMemory(radarHeight[i], 4, 0xCAE015, true)
                end
    
            end
        end
        checkboxes.radarfix[0] = preset["Radar"]["radarfix"]
    end

    
end


------------------------------------
function imgui.NewInputText(lable, val, width, hint, hintpos)
    local hint = hint and hint or ''
    local hintpos = tonumber(hintpos) and tonumber(hintpos) or 1
    local cPos = imgui.GetCursorPos()
    imgui.PushItemWidth(width)
    local result = imgui.InputText(lable, val, sizeof(val))
    if #str(val) == 0 then
        local hintSize = imgui.CalcTextSize(hint)
        if hintpos == 2 then imgui.SameLine(cPos.x + (width - hintSize.x) / 2)
        elseif hintpos == 3 then imgui.SameLine(cPos.x + (width - hintSize.x - 5))
        else imgui.SameLine(cPos.x + 5) end
        imgui.TextColored(imgui.ImVec4(1.00, 1.00, 1.00, 0.40), tostring(hint))
    end
    imgui.PopItemWidth()
    return result
end

function imgui.Link(link, text)
    text = text or link
    local tSize = imgui.CalcTextSize(text)
    local p = imgui.GetCursorScreenPos()
    local DL = imgui.GetWindowDrawList()
    local col = { imgui.GetColorU32Vec4(imgui.GetStyle().Colors[imgui.Col.Button]), imgui.GetColorU32Vec4(imgui.GetStyle().Colors[imgui.Col.ButtonHovered]) }
    if imgui.InvisibleButton("##" .. link, tSize) then os.execute("explorer " .. link) end
    local color = imgui.IsItemHovered() and col[1] or col[2]
    DL:AddText(p, color, text)
    DL:AddLine(imgui.ImVec2(p.x, p.y + tSize.y), imgui.ImVec2(p.x + tSize.x, p.y + tSize.y), color)
end

-- labels - Array - �������� ��������� ����
-- selected - imgui.ImInt() - ��������� ����� ����
-- size - imgui.ImVec2() - ������ ���������
-- speed - float - �������� �������� ������ �������� (�������������, �� ��������� - 0.2)
-- centering - bool - ������������� ������ � �������� (�������������, �� ��������� - false)
function imgui.CustomMenu(labels, selected, size, speed, centering)
    local bool = false
    speed = speed and speed or 0.500
    local radius = size.y * 0.50
    local draw_list = imgui.GetWindowDrawList()
    if LastActiveTime == nil then LastActiveTime = {} end
    if LastActive == nil then LastActive = {} end
    local function ImSaturate(f)
        return f < 0.0 and 0.0 or (f > 1.0 and 1.0 or f)
    end
    for i, v in ipairs(labels) do
        local c = imgui.GetCursorPos()
        local p = imgui.GetCursorScreenPos()
        if imgui.InvisibleButton(v..'##'..i, size) then
            selected[0] = i
            LastActiveTime[v] = os.clock()
            LastActive[v] = true
            bool = true
        end
        imgui.SetCursorPos(c)
        local t = selected[0] == i and 1.0 or 0.0
        if LastActive[v] then
            local time = os.clock() - LastActiveTime[v]
            if time <= 0.3 then
                local t_anim = ImSaturate(time / speed)
                t = selected[0] == i and t_anim or 1.0 - t_anim
            else
                LastActive[v] = false
            end
        end
        local col_bg = imgui.GetColorU32Vec4(selected[0] == i and imgui.ImVec4(0.10, 0.10, 0.10, 0.60) or imgui.ImVec4(0,0,0,0))
        local col_box = imgui.GetColorU32Vec4(selected[0] == i and imgui.ImVec4(ini.logocolor.r, ini.logocolor.g, ini.logocolor.b, ini.logocolor.a) or imgui.ImVec4(0,0,0,0))
        local col_hovered = imgui.GetStyle().Colors[imgui.Col.ButtonHovered]
        local col_hovered = imgui.GetColorU32Vec4(imgui.ImVec4(col_hovered.x, col_hovered.y, col_hovered.z, (imgui.IsItemHovered() and 0.2 or 0)))
        
        if selected[0] == i then draw_list:AddRectFilledMultiColor(imgui.ImVec2(p.x-size.x/6, p.y), imgui.ImVec2(p.x + (radius * 0.65) + t * size.x, p.y + size.y), imgui.GetColorU32Vec4(imgui.ImVec4(icolors.PLeftUp[0], icolors.PLeftUp[1], icolors.PLeftUp[2], icolors.PLeftUp[3])), imgui.GetColorU32Vec4(imgui.ImVec4(icolors.PRightUp[0], icolors.PRightUp[1], icolors.PRightUp[2], icolors.PRightUp[3])), imgui.GetColorU32Vec4(imgui.ImVec4(icolors.PRightDown[0], icolors.PRightDown[1], icolors.PRightDown[2], icolors.PRightDown[3])), imgui.GetColorU32Vec4(imgui.ImVec4(icolors.PLeftDown[0], icolors.PLeftDown[1], icolors.PLeftDown[2], icolors.PLeftDown[3]))) end
        draw_list:AddRectFilled(imgui.ImVec2(p.x-size.x/6, p.y), imgui.ImVec2(p.x + (radius * 0.65) + size.x, p.y + size.y), col_hovered, 0.0)
        imgui.SetCursorPos(imgui.ImVec2(c.x+(centering and (size.x-imgui.CalcTextSize(v).x)/2 or 15), c.y+(size.y-imgui.CalcTextSize(v).y)/2))
        if selected[0] == i then 
            imgui.TextColored(imgui.ImVec4(icolors.ActiveText[0], icolors.ActiveText[1], icolors.ActiveText[2], icolors.ActiveText[3]), v)
        else
            imgui.TextColored(imgui.ImVec4(icolors.PassiveText[0], icolors.PassiveText[1], icolors.PassiveText[2], icolors.PassiveText[3]), v)
        end
        draw_list:AddRectFilled(imgui.ImVec2(p.x, p.y), imgui.ImVec2(p.x+3.5, p.y + size.y), col_box)
        imgui.SetCursorPos(imgui.ImVec2(c.x, c.y+size.y))
    end
    return bool
end

function imgui.CustomSelectable(labels, selected, size, speed, centering)
    local bool = false
    speed = speed and speed or 0.500
    local radius = size.y * 0.50
    local draw_list = imgui.GetWindowDrawList()
    if LastActiveTime == nil then LastActiveTime = {} end
    if LastActive == nil then LastActive = {} end
    local function ImSaturate(f)
        return f < 0.0 and 0.0 or (f > 1.0 and 1.0 or f)
    end
    for i, v in ipairs(labels) do
        local c = imgui.GetCursorPos()
        local p = imgui.GetCursorScreenPos()
        if imgui.InvisibleButton(v..'##'..i, size) then
            selected[0] = i
            LastActiveTime[v] = os.clock()
            LastActive[v] = true
            bool = true
        end
        imgui.SetCursorPos(c)
        local t = selected[0] == i and 1.0 or 0.0
        if LastActive[v] then
            local time = os.clock() - LastActiveTime[v]
            if time <= 0.3 then
                local t_anim = ImSaturate(time / speed)
                t = selected[0] == i and t_anim or 1.0 - t_anim
            else
                LastActive[v] = false
            end
        end
            local col_bg = imgui.GetColorU32Vec4(selected[0] == i and imgui.ImVec4(0.10, 0.10, 0.10, 0.60) or imgui.ImVec4(0,0,0,0))
            local col_box = imgui.GetColorU32Vec4(selected[0] == i and imgui.ImVec4(icolors.ActiveText[0], icolors.ActiveText[1], icolors.ActiveText[2], icolors.ActiveText[3]) or imgui.ImVec4(0,0,0,0))
            local col_hovered = imgui.GetStyle().Colors[imgui.Col.ButtonHovered]
            local col_hovered = imgui.GetColorU32Vec4(imgui.ImVec4(col_hovered.x, col_hovered.y, col_hovered.z, (imgui.IsItemHovered() and 0.2 or 0)))
            
            if selected[0] == i then draw_list:AddRectFilledMultiColor(imgui.ImVec2(p.x-size.x/6, p.y), imgui.ImVec2(p.x + (radius * 0.65) + t * size.x, p.y + size.y), imgui.GetColorU32Vec4(imgui.GetStyle().Colors[imgui.Col.CheckMark]), imgui.GetColorU32Vec4(imgui.ImVec4(0,0,0,0)), imgui.GetColorU32Vec4(imgui.ImVec4(0,0,0,0)), imgui.GetColorU32Vec4(imgui.GetStyle().Colors[imgui.Col.CheckMark])) end
            --if selected[0] == i then draw_list:AddRectFilled(imgui.ImVec2(p.x-size.x, p.y), imgui.ImVec2(p.x + size.x, p.y + size.y), imgui.GetColorU32Vec4(imgui.GetStyle().Colors[imgui.Col.Button]), 0.0) end
            draw_list:AddRectFilled(imgui.ImVec2(p.x-size.x/6, p.y), imgui.ImVec2(p.x + size.x, p.y + size.y), col_hovered, 0.0)
            imgui.SetCursorPos(imgui.ImVec2(c.x+(centering and (size.x-imgui.CalcTextSize(v).x)/2 or 15), c.y+(size.y-imgui.CalcTextSize(v).y)/2))
            imgui.TextColored(imgui.ImVec4(imgui.GetStyle().Colors[imgui.Col.Text]), v)
            --draw_list:AddRectFilled(imgui.ImVec2(p.x, p.y), imgui.ImVec2(p.x+3.5, p.y + size.y), col_box)
            imgui.SetCursorPos(imgui.ImVec2(c.x, c.y+size.y))
    end
    return bool
end


function imgui.BeginTitleChild(str_id, size, rounding, offset, panelBool)
    imgui.SetCursorPosY(imgui.GetCursorPosY()+30)
    if panelBool == nil then panelBool = true end
    panelBool = panelBool and true or false
    offset = offset or 50
    local DL = imgui.GetWindowDrawList()
    local posS = imgui.GetCursorScreenPos()
    local title = str_id:gsub('##.+$', '')
    local sizeT = imgui.CalcTextSize(title)
    local bgColor = imgui.GetStyle().Colors[imgui.Col.Button]
    local bgColor = imgui.GetColorU32Vec4(imgui.ImVec4(bgColor.x, bgColor.y, bgColor.z, 0.4))
    imgui.PushStyleColor(imgui.Col.ChildBg, imgui.ImVec4(0, 0, 0, 0))
    imgui.PushStyleColor(imgui.Col.Border, imgui.ImVec4(0, 0, 0, 0))
    imgui.PushStyleVarFloat(imgui.StyleVar.ChildRounding, rounding)
    imgui.PushStyleColor(imgui.Col.Border, imgui.ImVec4(0, 0, 0, 0))
    imgui.BeginChild(str_id, size, true)
    imgui.PopStyleVar(1)
    imgui.Spacing()
    imgui.PopStyleColor(3)
    size.x = size.x == -1.0 and imgui.GetWindowWidth() or size.x
    size.y = size.y == -1.0 and imgui.GetWindowHeight() or size.y
    if not panelBool then DL:AddRect(posS, imgui.ImVec2(posS.x + size.x, posS.y + size.y), bgColor, rounding, 11+4, 1.6) end
    if panelBool == true then DL:AddRect(posS, imgui.ImVec2(posS.x + size.x, posS.y + size.y), bgColor, rounding, 7+5, 1.6)
    DL:AddRectFilled(imgui.ImVec2(posS.x, posS.y - 25), imgui.ImVec2(posS.x + size.x, posS.y + size.x/size.y ), bgColor, rounding, 3)
    
    DL:AddText(imgui.ImVec2(posS.x + offset, posS.y - 10 - (sizeT.y / 2)), imgui.GetColorU32Vec4(imgui.GetStyle().Colors[imgui.Col.Text]), title) end
end


CloseButton = function(text, value, pos)
	size = 20
    imgui.SetCursorPos(pos)
	local result = imgui.InvisibleButton("##texthyeta", imgui.ImVec2(size+20, size))
	if result then
		value[0] = false
	end
	local hovered = imgui.IsItemHovered()
    local col = hovered and imgui.GetStyle().Colors[imgui.Col.Button] or imgui.GetStyle().Colors[imgui.Col.ButtonHovered]
    imgui.PushFont(iconFont)
    imgui.SetCursorPos(pos)
    imgui.PushStyleColor(imgui.Col.Text, col)
    imgui.Text(text..fa.ICON_FA_TIMES)
    imgui.PopStyleColor()
    imgui.PopFont()
	return result
end

function imgui.Hint(text, delay, action)
    if imgui.IsItemHovered() then
        if go_hint == nil then go_hint = os.clock() + (delay and delay or 0.0) end
        local alpha = (os.clock() - go_hint) * 5
        if os.clock() >= go_hint then
            imgui.PushStyleVarVec2(imgui.StyleVar.WindowPadding, imgui.ImVec2(10, 10))
            imgui.PushStyleVarFloat(imgui.StyleVar.Alpha, (alpha <= 1.0 and alpha or 1.0))
                imgui.PushStyleColor(imgui.Col.PopupBg, imgui.ImVec4(0.11, 0.11, 0.11, 1.00))
                    imgui.BeginTooltip()
                    imgui.PushTextWrapPos(450)
                    --imgui.PushFont(fonts[22])
                    imgui.TextColored(imgui.GetStyle().Colors[imgui.Col.ButtonHovered], u8'���������:')
                   -- imgui.PopFont()
                    imgui.TextUnformatted(text)
                    if action ~= nil then
                        imgui.TextColored(imgui.GetStyle().Colors[imgui.Col.TextDisabled], u8'\n '..action)
                    end
                    if not imgui.IsItemVisible() and imgui.GetStyle().Alpha == 1.0 then go_hint = nil end
                    imgui.PopTextWrapPos()
                    imgui.EndTooltip()
                imgui.PopStyleColor()
            imgui.PopStyleVar(2)
        end
    end
end

function Im_Update()
	local i = NUMWEATHERS * CTimeCycle.GetCurrentHourTimeId() + CurrWeather[0]
	Im.Hours 					= new.int(Hours[0])
	Im.Mins 					= new.int(Minutes[0])
	Im.Seconds 					= new.int(Seconds[0])
	Im.TimeScale 				= new.int(TimeScale[0])
	Im.AmbRGB 					= imgui.new.float[3](CTimeCycle.m_nAmbientRed[i] /255, CTimeCycle.m_nAmbientGreen[i] /255, CTimeCycle.m_nAmbientBlue[i] /255)
	Im.AmbObjRGB 				= imgui.new.float[3](CTimeCycle.m_nAmbientRed_Obj[i] / 255, CTimeCycle.m_nAmbientGreen_Obj[i] / 255, CTimeCycle.m_nAmbientBlue_Obj[i] / 255)
	Im.SkyTopRGB 				= imgui.new.float[3](CTimeCycle.m_nSkyTopRed[i] / 255, CTimeCycle.m_nSkyTopGreen[i] / 255, CTimeCycle.m_nSkyTopBlue[i] / 255)
	Im.SkyBottomRGB 			= imgui.new.float[3](CTimeCycle.m_nSkyBottomRed[i] / 255, CTimeCycle.m_nSkyBottomGreen[i] / 255, CTimeCycle.m_nSkyBottomBlue[i] / 255)
	Im.SunCoreRGB 				= imgui.new.float[3](CTimeCycle.m_nSunCoreRed[i] / 255, CTimeCycle.m_nSunCoreGreen[i] / 255, CTimeCycle.m_nSunCoreBlue[i] / 255)
	Im.SunCoronaRGB 			= imgui.new.float[3](CTimeCycle.m_nSunCoronaRed[i] / 255, CTimeCycle.m_nSunCoronaGreen[i] / 255, CTimeCycle.m_nSunCoronaBlue[i] / 255)
	Im.SunSz 					= new.int(CTimeCycle.m_fSunSize[i])
	Im.SpriteSz 				= new.int(CTimeCycle.m_fSpriteSize[i])
	Im.SpriteBrght 				= new.int(CTimeCycle.m_fSpriteBrightness[i])
	Im.ShadowStr 				= new.int(CTimeCycle.m_nShadowStrength[i])
	Im.PoleShadowStr 			= new.int(CTimeCycle.m_nPoleShadowStrength[i])
	Im.LightShadowStrength 		= new.int(CTimeCycle.m_nLightShadowStrength[i])
	Im.FarClip 					= new.int(CTimeCycle.m_fFarClip[i])
	Im.FogStart 				= new.int(CTimeCycle.m_fFogStart[i])
	Im.LightsOnGroundBrightness = new.int(CTimeCycle.m_fLightsOnGroundBrightness[i])
	Im.LowCloudsRGB 			= imgui.new.float[3](CTimeCycle.m_nLowCloudsRed[i] / 255, CTimeCycle.m_nLowCloudsGreen[i] / 255, CTimeCycle.m_nLowCloudsBlue[i] / 255)
	Im.FluffyCloudsBotttomRGB 	= imgui.new.float[3](CTimeCycle.m_nFluffyCloudsBottomRed[i] / 255, CTimeCycle.m_nFluffyCloudsBottomGreen[i] / 255, CTimeCycle.m_nFluffyCloudsBottomBlue[i] / 255)
	Im.WaterRGBA 				= imgui.new.float[4](CTimeCycle.m_fWaterRed[i] / 255, CTimeCycle.m_fWaterGreen[i] / 255, CTimeCycle.m_fWaterBlue[i] / 255, CTimeCycle.m_fWaterAlpha[i] / 255)
	Im.PostFx1RGBA 				= imgui.new.float[4](CTimeCycle.m_fPostFx1Red[i] / 255, CTimeCycle.m_fPostFx1Green[i] / 255, CTimeCycle.m_fPostFx1Blue[i] / 255, CTimeCycle.m_fPostFx1Alpha[i] / 255)
	Im.PostFx2RGBA 				= imgui.new.float[4](CTimeCycle.m_fPostFx2Red[i] / 255, CTimeCycle.m_fPostFx2Green[i] / 255, CTimeCycle.m_fPostFx2Blue[i] / 255, CTimeCycle.m_fPostFx2Alpha[i] / 255)
	Im.CloudAlpha 				= new.int(CTimeCycle.m_fCloudAlpha[i])
	Im.HighLightMinIntensity 	= new.int(CTimeCycle.m_nHighLightMinIntensity[i])
	Im.WaterFogAlpha 			= new.int(CTimeCycle.m_nWaterFogAlpha[i])
	Im.DirectionalMult 			= new.int(CTimeCycle.m_nDirectionalMult[i])
end

-- Timecyc Stuff
function CTimeCycle.GetCurrentHourTimeId()
	local h = Hours[0]
	local id = nil
	if bTimecyc24h then return h end

	if h < 5 then  id = 0 end
	if h == 5 then  id = 1 end
	if h == 6 then  id = 2 end
	if 7 <= h and h < 12 then  id = 3 end
	if 12 <= h and h < 19 then  id = 4 end
	if h == 19 then  id = 5 end
	if h == 20 or h == 21 then  id = 6 end
	if h == 22 or h == 23 then  id = 7 end
	return id
end


function CTimeCycle.SaveToFile(filename)
    if not doesDirectoryExist(getWorkingDirectory().."\\GameTweaker\\timecyc") then
        createDirectory(getWorkingDirectory().."\\GameTweaker\\timecyc")
    end
	local timecycdat = io.open(getWorkingDirectory().."\\GameTweaker\\timecyc/"..filename .. ".dat", "w")
	local tc = CTimeCycle
	-- timecycdat:write("// TimeCycle created using Timecyc24h Editor\n// Be sure to check "..URL.." for updates!\n")

	for w = 0, NUMWEATHERS - 1 do
		timecycdat:write("//\n" .. "///////////////////////////////////////////" .. weather[w] .. " \n" .. "//\n")

		for h = 0, NUMHOURS - 1 do
			local i = NUMWEATHERS * h + w

			if bTimecyc24h then
				if (h >= 12) then
					if (h == 12) then
						timecycdat:write("// Midday \n")
					else
						timecycdat:write("// " .. (h - 12) .. "PM \n")
					end
				else
					if h == 0 then
						timecycdat:write("// Midnight \n")
					else
						timecycdat:write("// " .. h .. "AM \n")
					end
				end
			else
				if h == 0 then timecycdat:write("// Midnight\n") end
				if h == 1 then timecycdat:write("// 5 AM\n") end
				if h == 2 then timecycdat:write("// 6 AM\n") end
				if h == 3 then timecycdat:write("// 7 AM\n") end
				if h == 4 then timecycdat:write("// Midday\n") end
				if h == 5 then timecycdat:write("// 7 PM\n") end
				if h == 6 then timecycdat:write("// 8 PM\n") end
				if h == 7 then timecycdat:write("// 10 PM\n") end
			end


			-- timecycdat:write("// "..j.." \n")

			if (h == 0 or h == 12 and not bTimecyc24h) then
				timecycdat:write("//\tAmb\t\t\t\t\tAmb_Obj \t\t\t\tDir \t\t\t\t\tSky top\t\t\t\tSky bot\t\t\t\tSunCore\t\t\tSunCorona\t\t\tSunSz\t\tSprSz\tSprBght\t\tShdw\t\t\tLightShd\t\t\tPoleShd\t\t\tFarClp\t\t\tFogSt\t\t\tLightOnGround\t\t\tLowCloudsRGB\t\t\tBottomCloudRGB\t\t\tWaterRGBA\t\t\tAlpha1    RGB1\t\t\tAlpha2    RGB2\t\t\tCloudAlpha\t\t\tIntensityLimit\t\t\tWaterFogAlpha\t\t\tDirMult \n")
			end
			timecycdat:write(
				string.format(
					"\t%d %d %d \t\t" .. -- AmbRGB
					"\t%d %d %d \t\t" .. -- AmbObjRGB
					"\t%d %d %d \t\t" .. -- DirRGB (unused?)
					"\t%d %d %d \t\t" .. -- SkyTopRGB
					"\t%d %d %d \t\t" .. -- SkyBotRGB
					"\t%d %d %d \t\t" .. -- SunCore RGB
					"\t%d %d %d \t\t" .. -- SunCorona RGB
					"\t%.1f\t\t%.1f\t\t%.1f\t\t" .. -- SunSz, SpriteSz, SpriteBrightness
					"\t%d %d %d\t\t" .. -- ShadStrenght, LightShadStreght, PoleShadStrenght
					"\t%.1f\t\t%.1f\t\t%.1f\t\t" .. -- fFarClip, fFogStart, fLightsOnGroundBrightness
					"\t%d %d %d\t\t" .. -- LowCloudsRGB
					"\t%d %d %d\t\t" .. -- FluffyCloudsRGB
					"\t%d %d %d %d\t\t" .. -- WaterRGBA
					"\t%d %d %d %d\t\t" .. -- PostFx1ARGB
					"\t%d %d %d %d\t\t" .. -- PostFx2ARGB
					"\t%d\t%d\t%d\t%.2f\t\t\n", -- CloudAlpha HiLiMinIntensity WaterFogAlpha DirectionalMult
					tc.m_nAmbientRed[i], tc.m_nAmbientGreen[i],	tc.m_nAmbientBlue[i],
					tc.m_nAmbientRed_Obj[i], tc.m_nAmbientGreen_Obj[i],	tc.m_nAmbientBlue_Obj[i],
					255, 255, 255,
					tc.m_nSkyTopRed[i],	tc.m_nSkyTopGreen[i], tc.m_nSkyTopBlue[i],
					tc.m_nSkyBottomRed[i], tc.m_nSkyBottomGreen[i],	tc.m_nSkyBottomBlue[i],
					tc.m_nSunCoreRed[i],tc.m_nSunCoreGreen[i],tc.m_nSunCoreBlue[i],
					tc.m_nSunCoronaRed[i], tc.m_nSunCoronaGreen[i], tc.m_nSunCoronaBlue[i],
					(tc.m_fSunSize[i] - 0.5) / 10.0,(tc.m_fSpriteSize[i] - 0.5) / 10.0,(tc.m_fSpriteBrightness[i] - 0.5) / 10.0,
					tc.m_nShadowStrength[i],tc.m_nLightShadowStrength[i],tc.m_nPoleShadowStrength[i],
					tc.m_fFarClip[i],tc.m_fFogStart[i],	(tc.m_fLightsOnGroundBrightness[i] - 0.5) / 10.0,
					tc.m_nLowCloudsRed[i],tc.m_nLowCloudsGreen[i],tc.m_nLowCloudsBlue[i],
					tc.m_nFluffyCloudsBottomRed[i],tc.m_nFluffyCloudsBottomGreen[i],tc.m_nFluffyCloudsBottomBlue[i],
					tc.m_fWaterRed[i],tc.m_fWaterGreen[i],tc.m_fWaterBlue[i],tc.m_fWaterAlpha[i],
					tc.m_fPostFx1Alpha[i],tc.m_fPostFx1Red[i],tc.m_fPostFx1Green[i],tc.m_fPostFx1Blue[i],
					tc.m_fPostFx2Alpha[i],tc.m_fPostFx2Red[i],tc.m_fPostFx2Green[i],tc.m_fPostFx2Blue[i],
					tc.m_fCloudAlpha[i],tc.m_nHighLightMinIntensity[i],	tc.m_nWaterFogAlpha[i],	tc.m_nDirectionalMult[i] / 100.0
				)
			)
		end
	end
	io.close(timecycdat)
end



function SwitchTheStyle()
    imgui.SwitchContext()

    local style = imgui.GetStyle()
    local colors = style.Colors
    local clr = imgui.Col
    local ImVec4 = imgui.ImVec4
    local ImVec2 = imgui.ImVec2

    --==[ STYLE ]==--
    imgui.GetStyle().WindowPadding = imgui.ImVec2(5, 5)
    imgui.GetStyle().FramePadding = imgui.ImVec2(5, 5)
    imgui.GetStyle().ItemSpacing = imgui.ImVec2(6, 6)
    imgui.GetStyle().ItemInnerSpacing = imgui.ImVec2(6, 6)
    imgui.GetStyle().TouchExtraPadding = imgui.ImVec2(5, 5)
    imgui.GetStyle().IndentSpacing = 5
    imgui.GetStyle().ScrollbarSize = 10
    imgui.GetStyle().GrabMinSize = 17

    style.AntiAliasedLines = true
    style.AntiAliasedFill = true
    --==[ BORDER ]==--
    imgui.GetStyle().WindowBorderSize = 0
    imgui.GetStyle().ChildBorderSize = 2
    imgui.GetStyle().PopupBorderSize = 1
    imgui.GetStyle().FrameBorderSize = 0
    imgui.GetStyle().TabBorderSize = 1

    --==[ ROUNDING ]==--
    imgui.GetStyle().WindowRounding = 0
    imgui.GetStyle().ChildRounding = 0
    imgui.GetStyle().FrameRounding = 0
    imgui.GetStyle().PopupRounding = 0
    imgui.GetStyle().ScrollbarRounding = 0
    imgui.GetStyle().GrabRounding = 0
    imgui.GetStyle().TabRounding = 0
    --==[ ALIGN ]==--
    imgui.GetStyle().WindowTitleAlign = imgui.ImVec2(0.5, 0.5)
    imgui.GetStyle().ButtonTextAlign = imgui.ImVec2(0.5, 0.5)
    imgui.GetStyle().SelectableTextAlign = imgui.ImVec2(0.5, 0.5)
    
    local eColor = imgui.GetStyle().Colors[imgui.Col.WindowBg]
    --local eColor = imgui.GetColorU32Vec4(imgui.ImVec4(eColor.x, eColor.y, eColor.z, eColor.w))

    colors[clr.WindowBg]               = ImVec4(ini.WindowBG.r, ini.WindowBG.g, ini.WindowBG.b, ini.WindowBG.a)
    colors[clr.FrameBg]                = ImVec4(eColor.x + 0.50, eColor.y + 0.50, eColor.z + 0.50, 0.40)
    colors[clr.FrameBgHovered]         = ImVec4(eColor.x + 0.30, eColor.y + 0.30, eColor.z + 0.30, 0.80)
    colors[clr.FrameBgActive]          = ImVec4(eColor.x + 0.20, eColor.y + 0.20, eColor.z + 0.20, 2.00)
    colors[clr.CheckMark]              = ImVec4(eColor.x + 0.35, eColor.y + 0.35, eColor.z + 0.35, 0.90)
    colors[clr.SliderGrab]             = ImVec4(eColor.x + 0.25, eColor.y + 0.25, eColor.z + 0.25, 0.80)
    colors[clr.SliderGrabActive]       = ImVec4(eColor.x + 0.10, eColor.y + 0.10, eColor.z + 0.10, 0.90)
    colors[clr.Button]                 = ImVec4(eColor.x + 0.25, eColor.y + 0.25, eColor.z + 0.25, 0.50)
    colors[clr.ButtonHovered]          = ImVec4(eColor.x + 0.30, eColor.y + 0.30, eColor.z + 0.30, 0.75)
    colors[clr.ButtonActive]           = ImVec4(eColor.x + 0.40, eColor.y + 0.40, eColor.z + 0.40, 0.90)
    colors[clr.Header]                 = ImVec4(eColor.x + 0.25, eColor.y + 0.25, eColor.z + 0.25, 0.80)
    colors[clr.HeaderHovered]          = ImVec4(eColor.x + 0.30, eColor.y + 0.30, eColor.z + 0.30, 0.90)
    colors[clr.HeaderActive]           = ImVec4(eColor.x + 0.10, eColor.y + 0.10, eColor.z + 0.10, 1.0)
    colors[clr.Separator]              = colors[clr.Border]
    colors[clr.SeparatorHovered]       = ImVec4(0.26, 0.59, 0.98, 0.78)
    colors[clr.SeparatorActive]        = ImVec4(0.26, 0.59, 0.98, 1.00)
    colors[clr.ResizeGrip]             = ImVec4(0.26, 0.59, 0.98, 0.25)
    colors[clr.ResizeGripHovered]      = ImVec4(0.26, 0.59, 0.98, 0.67)
    colors[clr.ResizeGripActive]       = ImVec4(0.26, 0.59, 0.98, 0.95)
    colors[clr.TextSelectedBg]         = ImVec4(0.26, 0.59, 0.98, 0.35)
    colors[clr.Text]                   = ImVec4(ini.ColorText.r, ini.ColorText.g, ini.ColorText.b, ini.ColorText.a)
    colors[clr.TextDisabled]           = ImVec4(0.50, 0.50, 0.50, 1.00)
    colors[clr.ChildBg]                = ImVec4(0,0,0,0)
    colors[clr.PopupBg]                = ImVec4(0.08, 0.08, 0.08, 0.94)
    colors[clr.Border]                 = ImVec4(1.0, 1.0, 1.0, 0.10)
    colors[clr.BorderShadow]           = ImVec4(1.00, 1.00, 1.00, 0.07)
    colors[clr.MenuBarBg]              = ImVec4(0.14, 0.14, 0.14, 1.00)
    colors[clr.ScrollbarBg]            = ImVec4(eColor.x + 0.40, eColor.y + 0.40, eColor.z + 0.40, 0.1)
    colors[clr.ScrollbarGrab]          = ImVec4(eColor.x + 0.25, eColor.y + 0.25, eColor.z + 0.25, 0.4)
    colors[clr.ScrollbarGrabHovered]   = ImVec4(eColor.x + 0.30, eColor.y + 0.30, eColor.z + 0.30, 0.4)
    colors[clr.ScrollbarGrabActive]    = ImVec4(eColor.x + 0.20, eColor.y + 0.20, eColor.z + 0.20, 0.4)
    colors[clr.PlotLines]              = ImVec4(ini.ColorNavi.r, ini.ColorNavi.g, ini.ColorNavi.b, ini.ColorNavi.a)
    colors[clr.PlotLinesHovered]       = ImVec4(ini.ColorNavi.r, ini.ColorNavi.g, ini.ColorNavi.b, ini.ColorNavi.a) --ImVec4(ini.�olorFoneImg.r, ini.�olorFoneImg.g, ini.�olorFoneImg.b, ini.�olorFoneImg.a)
    colors[clr.PlotHistogram]          = ImVec4(ini.�olorChildMenu.r, ini.�olorChildMenu.g, ini.�olorChildMenu.b, ini.�olorChildMenu.a)
    colors[clr.PlotHistogramHovered]   = ImVec4(1.00, 0.60, 0.00, 1.00)
   
end


function resethook()
    --====================================== [ reset hook ] ==============================================
    local function hkReset(pDevice, pPresentationParameters)
        if ini.settings.refreshratefix then
            pPresentationParameters.FullScreen_RefreshRateInHz = pPresentationParameters.Windowed == true and 300 or 0
        end
        if isSampAvailable() then
            gotofunc("UgenrlMode")

        end
        return hkReset(pDevice, pPresentationParameters)
    end

    local D3D9Device_HookReset = vmt_hook.new(ffi.cast('uintptr_t*', 0xC97C28)[0])
    hkReset = D3D9Device_HookReset.hookMethod('long(__stdcall*)(void*, D3DPRESENT_PARAMETERS*)', hkReset, 16)
    --====================================================================================================
end

function hookVideomode()
    local function setVideoMode(mode)
        setVideoMode(mode)
        gotofunc("InterfaceElementEditor")
    end
    setVideoMode = hook.new('void(__cdecl*)(int)', setVideoMode, 0x745C70)
end

local frequency_large = ffi.new("LARGE_INTEGER")
kernel32.QueryPerformanceFrequency(frequency_large)
local perfomance_frequency = tonumber(frequency_large.QuadPart)

get_current_ms = function()
    local ticks_large = ffi.new("LARGE_INTEGER")
    kernel32.QueryPerformanceCounter(ticks_large)
    return tonumber(ticks_large.QuadPart) * (1000 / perfomance_frequency)
end
  
hard_wait = function(ms)
    local target = get_current_ms() + ms

    while get_current_ms() < target do end
end

function presenthook()
    --====================================== [ present hook ] ==============================================
    local _last_frame_time = 0
    
    local function hkPresent(pDevice, pSourceRect, pDestRect, hDestWindowOverride, pDirtyRegion)
            if ini.settings.framelimiter then
                if TARGET_FRAMERATE >= 4 and TARGET_FRAMERATE <= 299 then
                    if _last_frame_time ~= 0 then
                        local time_to_swap = 1000 / TARGET_FRAMERATE
                        local time_lost_to_swap = winmm.timeGetTime() - _last_frame_time
                        if time_lost_to_swap < time_to_swap then
                            hard_wait(time_to_swap - time_lost_to_swap)
                        end
                    end
                    _last_frame_time = winmm.timeGetTime()
                end
            end

        return hkPresent(pDevice, pSourceRect, pDestRect, hDestWindowOverride, pDirtyRegion)
    end
    local D3D9Device_HookPresent = vmt_hook.new(ffi.cast('intptr_t*', 0xC97C28)[0])
    hkPresent = D3D9Device_HookPresent.hookMethod('long(__stdcall*)(void*, void*, void*, void*, void*)', hkPresent, 17)
    --====================================================================================================
end