-- This script was be made by GitHub Copilot

-- Convar to minimun amount of damage to be accepted as a InCombat
local MinDamage = CreateConVar("playerisincombat_damage", 10, {FCVAR_ARCHIVE, FCVAR_REPLICATED, FCVAR_SERVER_CAN_EXECUTE, FCVAR_SERVER_CANNOT_QUERY})

hook.Add("PlayerInitialSpawn", "PlayerInitialSpawn_is_in_combat", function(ply)
    ply:SetNWBool("PlayerIsInCombat", false)
end)

hook.Add("PlayerHurt", "PlayerAntiRol", function(ply, attacker, health, dmg)
    local ply_bol = ply:GetNWBool("PlayerIsInCombat", false)
    local att_bol = attacker:GetNWBool("PlayerIsInCombat", false)
    local min_dmg = MinDamage:GetInt()

    if dmg > min_dmg then

        if ply_bol == true then
            ply:SetNWBool("PlayerIsInCombat", true)
            print("Player " .. ply:Nick() .. " esta en combate")

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

    end
end)

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