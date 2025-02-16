function main()
    if not isSampfuncsLoaded() or not    isSampLoaded() then return end
    while not isSampAvailable() do wait(100) end

    while true do
        wait(0)
        if sampTextdrawIsExists(313) then
            sampTextdrawDelete(313)
        end
    end
end