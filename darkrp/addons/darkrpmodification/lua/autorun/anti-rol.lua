-- This script was be made by GitHub Copilot

-- Set the player NWBool "is_in_combat" to false when the player joins to the server.
-- This is used to prevent the player from being in combat when they join.
-- This is also used to prevent the player from being in combat when they reconnect.
hook.Add("PlayerInitialSpawn", "PlayerInitialSpawn_is_in_combat", function(ply)
    ply:SetNWBool("PlayerIsInCombat", false)
end)

-- If the player get more than X damage then, disable the option to spawn a prop
-- also create a timer that when it expires, the player will be able to spawn a prop again.
-- the timer is 30 seconds.
-- also check if the player is in combat, if so, reset the timer to 30 seconds.
hook.Add("PlayerHurt", "PlayerAntiRol", function(ply, attacker, health, damage)
    local ply_bol = ply:GetNWBool("PlayerIsInCombat", false)
    local att_bol = attacker:GetNWBool("PlayerIsInCombat", false)

    if ply_bol == true then
        ply:SetNWBool("PlayerIsInCombat", true)
        print("Player " .. ply:Nick() .. " esta en combate")

        -- Reset timer to 30 seconds
        timer.Destroy("PlayerAntiRol_" .. ply:SteamID())
        timer.Create("PlayerAntiRol_" .. ply:SteamID(), 30, 1, function()
            ply:SetNWBool("PlayerIsInCombat", false)
        end)
    else
        ply:SetNWBool("PlayerIsInCombat", true)
        timer.Create("PlayerAntiRol_" .. ply:SteamID(), 30, 1, function()
            ply:SetNWBool("PlayerIsInCombat", false)
        end)
    end

    if att_bol == true then
        attacker:SetNWBool("PlayerIsInCombat", true)
        print("Player " .. attacker:Nick() .. " esta en combate")

        -- Reset timer to 30 seconds
        timer.Destroy("PlayerAntiRol_" .. attacker:SteamID())
        timer.Create("PlayerAntiRol_" .. attacker:SteamID(), 30, 1, function()
            attacker:SetNWBool("PlayerIsInCombat", false)
        end)
    else
        attacker:SetNWBool("PlayerIsInCombat", true)
        timer.Create("PlayerAntiRol_" .. attacker:SteamID(), 30, 1, function()
            attacker:SetNWBool("PlayerIsInCombat", false)
        end)
    end
end)

-- If the player trying to spawn a prop is in combat, then prevent them from spawning a prop.
hook.Add("PlayerSpawnProp", "PlayerSpawnProp_is_in_combat", function(ply)
    if (ply:GetNWBool("PlayerIsInCombat")) then
        ply:ChatPrint("Estas en combate, no puedes spawnear un prop.")
        return false
    end
end)

hook.Add("canBuyVehicle", "playerBoughtVehicle_is_in_combat", function(ply)
    if (ply:GetNWBool("PlayerIsInCombat")) then
        ply:ChatPrint("Estas en combate, no puedes comprar un auto.")
        return false
    end
end)