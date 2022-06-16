if NOT SERVER then return end

if not sql.TableExists("darkrp_player_data") then
    sql.Query("CREATE TABLE darkrp_player_data(id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    steamid64 TEXT NOT NULL,
    player_name TEXT NOT NULL,
    isbanned_vehicle BOOLEAN NOT NULL,
    isbanned_store BOOLEAN NOT NULL,
    isbanned_global BOOLEAN NOT NULL,
    isbanned_hitman BOOLEAN NOT NULL,
    isbanned_police BOOLEAN NOT NULL)")
end

-- add the player to the database
hook.Add("PlayerInitialSpawn", "darkrp_player_initialspawn", function(ply)
    local id = ply:SteamID64()
    local nm = ply:Nick()

    local q = sql.Query("SELECT * FROM darkrp_player_data WHERE steamid64 = " .. sql.SQLStr(id) .. ";")
    if q == false then
        sql.Query("INSERT INTO darkrp_player_data(steamid64, player_name, isbanned_vehicle, isbanned_store, isbanned_global, isbanned_hitman, isbanned_police) VALUES('"..id.."', '"..nm.."', 0, 0, 0, 0, 0)")
    end

    end 
end)

hook.Add("PlayerInitialSpawn", "darkrp_player_config_namereload", function(ply)
        local id = ply:SteamID64()
        local nm = ply:Nick()

        sql.Query("UPDATE darkrp_player_data SET player_name = '" .. nm .. "' WHERE steamid64 = '" .. id .. "'")
    end
end)