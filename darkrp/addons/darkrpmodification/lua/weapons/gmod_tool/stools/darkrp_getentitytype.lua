TOOL.Category = "DarkRP Admin Tools"
TOOL.Name = "#tool.darkrp_enitity_type.name"

if CLIENT then
    language.Add("tool.darkrp_enitity_type.name", "Tipo de entidad")
    language.Add("tool.darkrp_enitity_type.desc", "Devuelve el tipo de entidad")
end

function TOOL:LeftClick(trace)

    local ply = self:GetOwner()

    if (IsValid(trace.Entity) && trace.entity:IsPlayer()) then
        MsgC("[DarkRP] " .. trace.Entity:Nick() .. " es un " .. trace.Entity:GetClass() .. "\n")
    return end

    if CLIENT then return true end

    if (IsValid(trace.Entity)) then
        ply:ChatPrint("[DarkRP] " .. trace.Entity:GetClass() .. "\n")
    end

end

function TOOL:RightClick(trace)
end

function TOOL:Reload(trace)
end

function TOOL:Think()
end