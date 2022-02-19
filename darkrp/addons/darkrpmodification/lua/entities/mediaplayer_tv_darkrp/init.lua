AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

resource.AddFile( "models/gmod_tower/suitetv_large.mdl" )
resource.AddFile( "materials/models/gmod_tower/suitetv_large.vmt" )
resource.AddSingleFile( "materials/entities/mediaplayer_tv.png" )

function ENT:SetupMediaPlayer( mp )
	mp:on("mediaChanged", function(media) self:OnMediaChanged(media) end)
end

function ENT:OnMediaChanged( media )
	self:SetMediaThumbnail( media and media:Thumbnail() or "" )
end