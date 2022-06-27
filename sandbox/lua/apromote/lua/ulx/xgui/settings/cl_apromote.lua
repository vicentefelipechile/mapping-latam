---------------------------------
-- APromote 2.0 by Lead4u      --
-- Steam:   "Lead4u2"          --
-- Version: "2.0 Beta"         --
-- Date:    "01/20/2015"       --
---------------------------------

if ULib==nil or GetConVarString("utime_enable")=="" then print("WARNING: Missing dependancy UTime/ULX/ULib APromote is now inactive.") return end

local APromote = {};
local panel = xlib.makepanel{ parent=xgui.null }
xgui.prepareDataType( "AP_SendData", APromote)

// AP Settings
local enabled = xlib.makecheckbox{ x=10, y=10, label="Enable", repconvar="rep_ap_enabled", parent=panel, textcolor=color_black }
xlib.makecheckbox{ x=10, y=30, label="Play Sound", repconvar="rep_ap_snd_enabled", parent=panel, textcolor=color_black }
xlib.makecheckbox{ x=25, y=50, label="Global Sound", repconvar="rep_ap_snd_scope", parent=panel, textcolor=color_black }
xlib.makecheckbox{ x=10, y=70, label="Confetti", repconvar="rep_ap_effect_enabled", parent=panel, textcolor=color_black }
xlib.makecheckbox{ x=10, y=90, label="Auto Demote", repconvar="rep_ap_auto_demote", parent=panel, textcolor=color_black }

// AP Group / Hour Setup
//local pinfo = xlib.makepanellist{ x=300, y=5, w=285, h=327, parent=panel }	
local box = xlib.maketextbox{ x = 400, y=40, w=150, h = 20, parent=panel}
xlib.makelabel{ x = 333, y = 41, label = "Group Name: ", textcolor= color_black, parent=panel}
local btn = xlib.makebutton {w=100, h=25, x = 400, y = 300, label="Apply", disabled=false, parent=panel}
local num = xlib.makeslider{ parent=panel, label="Choose an hour to apply this rank.", x = 315, y = 75, decimal = 0, min= -1, max = 500, value= -1, w = 250, h = 20, textcolor= color_black}
local dlist = xlib.makelistview{ x=145, y=5, w=150, h=327, parent=panel }
xlib.makelabel{ x = 314, y = 115, w=250, h=30, wordwrap = true, label = "NOTE: To exclude a rank from auto promotion set its value to -1. ", textcolor= color_black, parent=panel}
	dlist:AddColumn( "Group" )
	dlist:AddColumn( "Hours" )
dlist.Columns[1].DoClick = function() end
dlist.Columns[2].DoClick = function() end
box:SetEditable( false )
//pinfo:AddItem( xlib.makelabel{ label="Hourly Settings", textcolor= color_black } )

dlist.OnRowSelected = function( self, LineID, Line )
	box:SetValue(Line:GetValue(1))
	
	if(Line:GetValue(2) == "(Excluded)") then
		num:SetValue(-1)
	else
		num:SetValue(Line:GetValue(2))
	end
end

btn.DoClick = function() 
	if (box:GetValue() and num:GetValue()) then	
		RunConsoleCommand("APGroup", box:GetValue(), num:GetValue())
	end
end
		
local function doApUpdate()
	dlist:Clear()	
		for k, v in pairs(APromote) do
			if( tonumber(v) != -1) then
				dlist:AddLine( k, tonumber(v) )
			end
		end
			dlist:SortByColumn( 2, true )
		for k, v in pairs(APromote) do
			if (tonumber(v) <= -1) then
				dlist:AddLine( k, "(Excluded)" )
			end
		end
end	

local function doApShinys( um )
	local ply = um:ReadEntity()
	em = ParticleEmitter(ply:GetPos())
		for i=0, 50 do
			local part = em:Add( "effects/spark", ply:GetPos() + VectorRand()*math.random(-30,30) + Vector(math.random(1,10),math.random(1,10),math.random(50,175)) )
			part:SetAirResistance( 100 )
			part:SetBounce( 0.3 )
			part:SetCollide( true )
			part:SetColor( math.random(10,250),math.random(10,250),math.random(10,250),255 )
			part:SetDieTime( 2 )
			part:SetEndAlpha( 0 )
			part:SetEndSize( 0 )
			part:SetGravity( Vector( 0, 0, -250 ) )
			part:SetRoll( math.Rand(0, 360) )
			part:SetRollDelta( math.Rand(-7,7) )    
			part:SetStartAlpha( math.Rand( 80, 250 ) )
			part:SetStartSize( math.Rand(6,12) )
			part:SetVelocity( VectorRand() * 75 )
		end
	em:Finish()
end

usermessage.Hook("doApShinys", doApShinys)
xgui.hookEvent( "AP_SendData", "process", doApUpdate )
xgui.addSettingModule( "APromote", panel, "gui/silkicons/cog", "apromote_settings" )