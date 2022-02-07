-- Funciones
local function AutoComplete( cmd, args )
	print( cmd, args)

	args = string.Trim( args )
	args = string.lower( args )

	local table1 = {}

	for k, v in ipairs(player.GetAll()) do
		local nick = v:Nick()
		if string.find( string.lower( nick ), args) then
			nick = "\"" .. nick "\""
			nick = "darkrp_setteam " .. nick

			table.insert(table1, nick)
		end
	end

-- Comandos de prueba
if CLIENT then

	concommand.Add( "darkrp_setteam", function( ply, cmd, args)
		if not ply:IsSuperAdmin() then return end
		local target = args[0]
		local Team = args[1]
		target:SetTeam( Team )
		target:Spawn()
	end,
	AutoComplete)

end