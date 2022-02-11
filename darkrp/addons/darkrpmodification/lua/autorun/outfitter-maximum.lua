if CLIENT then
	local path = "mapping-latam/outfitter/"

	if not file.Exists("mapping-latam", "DATA") then
		file.CreateDir("mapping-latam")
		file.CreateDir("mapping-latam/outfitter")
	end

	-- Establecer tamaño maximo

	if not file.Exists( path .. "maxsize.txt", "DATA") then
		file.Write( path .. "maxsize.txt", 10) -- 10 MB
	end
	
	local maxsize = file.Read( path .. "maxsize.txt", "DATA")
	RunConsoleCommand("outfitter_maxsize", maxsize)

	concommand.Add("mappinglatam_outfitter_maxsize", function(ply, cmd, args)
		file.Write( path .. "maxsize.txt", args)
		RunConsoleCommand("outfitter_maxsize", args)
	end)

	-- Activar outfitter
	if not file.Exists( path .. "enabled.txt", "DATA") then
		file.Write( path .. "enabled.txt", 1)
	end

	local function MappingLatamOutfitterEnable()
		file.Write(  path .. "enabled.txt", 1)
		RunConsoleCommand("outfitter_enabled", 1)
	end

	local function MappingLatamOutfitterDisable()
		file.Write( path .. "enabled.txt", 0)
		RunConsoleCommand("outfitter_enabled", 0)
	end
	local enabled = file.Read( path .. "enabled.txt", "DATA")
	RunConsoleCommand("outfitter_enabled", enabled)

	concommand.Add("mappinglatam_outfitter_enable", MappingLatamOutfitterEnable, nil, "Activa el outfitter cada vez que entres al servidor.")
	concommand.Add("mappinglatam_outfitter_disable", MappingLatamOutfitterDisable, nil, "Activa el outfitter cada vez que entres al servidor.")

	-- Maxima distancia
	if not file.Exists( path .. "maxdistance.txt", "DATA") then
		file.Write( path .. "maxdistance.txt", 512) -- 512 Unidades Hammer
	end

	maxdistance = file.Read( path .. "maxdistance.txt", "DATA")
	RunConsoleCommand("outfitter_distance", maxdistance)

	concommand.Add("mappinglatam_outfitter_maxdistance", function(ply, cmd, args)
		file.Write( path .. "maxsize.txt", args)
		RunConsoleCommand("outfitter_distance", args)
	end)
end