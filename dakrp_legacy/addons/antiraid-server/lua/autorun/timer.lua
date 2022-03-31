timer.Create("TimerPrueba", 1, 0, function()
    local h = os.date("%H:%M:%S")
    
    if (h == "01:00:00") then
        RunConsoleCommand("sbox_maxprops", 30)
    elseif (h == "12:00:00") then
        RunConsoleCommand("sbox_maxprops", 100)
    end
end)