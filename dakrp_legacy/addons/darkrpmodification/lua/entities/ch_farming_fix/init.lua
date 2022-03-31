-- Pongan esto debajo de todo el archivo para evitar que los usuarios puedan duplicar las cosas del farmero
function ENT:CanTool(ply, trace, mode)
	if mode == ("duplicator" or "adv_duplicator" or "advdupe2") then return false end
end