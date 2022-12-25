--[[---------------------------------------------------------------------------
DarkRP custom vehicles
---------------------------------------------------------------------------

This file contains your custom vehicles.
This file should also contain vehicles from DarkRP that you edited.

For examples and explanation please visit this wiki page:
https://darkrp.miraheze.org/wiki/DarkRP:Vehicles

If you want to keep the vehicle code and not comment it out you can add a vehicle to the "DarkRP.disabledDefaults["vehicles"]" section
in the disabled_defaults.lua in the "darkrp_config" folder

Add vehicles under the following line:
---------------------------------------------------------------------------]]

DarkRP.createVehicle({
	name = "Jeep",
	model = "models/buggy.mdl",
	price = 5000,
	allowed = {TEAM_CITIZEN},
	customCheck = function(ply)
        -- check if the user is banned from using a vehicle
        -- asking to the database darkrp_player_data
        -- inside of isbanned_vehicle
        -- the isbanned_vehicle is a bolean value
        -- if the user is banned, return false
        -- if the user is not banned, return true
        local check = sql.QueryValue("SELECT isbanned_vehicle FROM darkrp_player_data WHERE steamid = " .. sql.SQLStr(ply:SteamID()) .. ";")
        if check == "1" then
            return false
        end
    end,
	label = Label_to_show_in_F4_menu,
    distance = 85,
    angle = Angle(0, 0, 0),
    onBought = function(ply, vehicleTbl, ent) end,
})