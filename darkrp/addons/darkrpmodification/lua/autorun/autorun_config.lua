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

hook.Add("PlayerInitialSpawn", "darkrp_player_config_namereload", function(ply)
    sql.Query("UPDATE darkrp_player_data SET player_name = '" .. ply:Name() .. "' WHERE steamid64 = '" .. ply:SteamID64() .. "'")
    end
end)