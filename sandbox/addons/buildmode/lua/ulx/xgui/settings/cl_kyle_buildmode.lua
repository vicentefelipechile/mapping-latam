_Kyle_Buildmode = _Kyle_Buildmode or {}
xgui.prepareDataType( "_Kyle_Buildmode" )

local b = xlib.makepanel{ parent=xgui.null }

--[[
	0 - checkbox
	1 - numberwang
]]

local panels = {
	{ --panel_entering
		["panelItems"] = {
			["spawnwithbuildmode"] = 				{0, "Jugadores aparecen en modo Build"},
			["persistpvp"] = 						{0, "Los jugadores aparecen en modo PVP despues de morir"},
			["builddelay"] = 						{1, "Tiempo de espera antes de cambiar en Buildmode"}
		}
	}, 
	{ --panel_whilein
		panelItems = {
			["restrictweapons"] = 					{0, "Restringir las armas con 'Armas de Builder'"},
			["restrictsents"] = 					{0, "Restringir los SENT con 'Builder SENTs'"},
			["restrictvehicles"] = 					{0, "Restringir vehículos con 'vehículos de Builder'"},
			["restrictvehicleentry"] = 				{0, "Restrict Vehicle Entry with 'Builder Vehicles'"},
			["pvppropspawn"] = 						{0, "Permitir spawnear Props en modo PVP"},
			["allownoclip"] =			 			{0, "Permitir Noclip en modo Build"},
			["allownpcdamage"] = 					{0, "Permitir el daño a los NPCs en modo Build"},
			["restrictwantipropkilleapons"] = 		{0, "Prevenir que los Builders hagan Prop Kill"},
			["highlightbuilders"] = 				{0, "Marcar a los Builders"},
			["highlightpvpers"] = 					{0, "Marcar a los PVPes"},
			["highlightonlywhenlooking"] = 			{0, "Marcar solo cuando esta mirando"},
			["showtextstatus"] = 					{0, "Show Text Status"}
		}
	},
	{ -- panel_exiting
		panelItems = {
			["returntospawn"] = 					{0, "Respawnear al jugador al salir del modo Build"},
			["pvpdelay"] = 							{1, "PVP Delay"}
		}
	},
	{ -- panel_extras
		panelItems = {
			["spawnprotection"] = 					{1, "Amount of seconds to enable Buildmode temporarily on spawn"},
			["adminsbypassrestrictions"] = 			{0, "Admins Bypass Restrictions"},
			["antipropkillpvper"] = 				{0, "Prevent PVPers from Propkilling"},
			["antipropkill"] = 						{0, "Prevent Builders from Propkilling"}
		}
	},
	{ -- panel_advanced
		{
		
		}
	},
	{ -- panel_help 
		{
		
		}
	}
}

for k, e in pairs(panels) do
	local y = 5
	e["panel"] = xlib.makepanel{x=160, y=5, w=425, h=322, parent=b}
	local panel = e["panel"]	
	local panelItems = e["panelItems"]
 
	if panelItems then
		for k, e in pairs(panelItems) do
			-- checkbox
			if e[1] == 0 then
				e["check"] = xlib.makecheckbox{ x=5, y=y, label=e[2], parent=panel, repconvar="rep_kylebuildmode_" .. k}
			end
			
			-- number
			if e[1] == 1 then
				e["number"] = xlib.makenumberwang {x=5, y=y, w=35, parent=panel}
				e["label"] = xlib.makelabel{ x=e["number"].x+40, y=e["number"].y+2, w=500, h=15, parent=panel, label=e[2] }
				e["number"].OnValueChanged	= function(y, z)
					if _Kyle_Buildmode[k] != z then
						RunConsoleCommand("kylebuildmode", "set", k, z)
					end
				end
			end

			if e[1] == 3 then


			end

			if e[1] == 0 then
				y = y + 20
			elseif e[1] == 1 then
				y = y + 25
			end --
		end
	end
end

--"Advanced Settings" Panel
local panel_advanced					= panels[5]["panel"]

local panel_builderweapon 				= xlib.makepanel{ x=5, y=150, w=130, h=170, parent=panel_advanced}
local list_builderweapons 				= xlib.makelistview{ x=0, y=0, w=130, h=125, parent=panel_builderweapon }
local button_addremoveweapon 			= xlib.makebutton{x=105, y=125, w=25, h=25,  parent=panel_builderweapon, label="+", disabled=true }
local text_weaponenter 					= xlib.maketextbox{x=0, y=125, w=105, h=25, parent=panel_builderweapon}
local check_weaponlisttype 				= xlib.makecheckbox{ x=0, y=153, label="La lista es una Blacklist", parent=panel_builderweapon, repconvar="rep_kylebuildmode_weaponlistmode"}

local panel_builderentities 			= xlib.makepanel{ x=140, y=150, w=130, h=170, parent=panel_advanced}
local list_builderentities 				= xlib.makelistview{ x=0, y=0, w=130, h=125, parent=panel_builderentities }
local button_addremoveentity 			= xlib.makebutton{x=105, y=125, w=25, h=25,  parent=panel_builderentities, label="+", disabled=true }
local text_entityenter 					= xlib.maketextbox{x=0, y=125, w=105, h=25, parent=panel_builderentities}
local check_entitylisttype 				= xlib.makecheckbox{ x=0, y=153, label="La lista es una Blacklist", parent=panel_builderentities, repconvar="rep_kylebuildmode_entitylistmode"}

local panel_buildervehicles 			= xlib.makepanel{ x=275, y=150, w=130, h=170, parent=panel_advanced}
local list_buildervehicles 				= xlib.makelistview{ x=0, y=0, w=130, h=125, parent=panel_buildervehicles }
local button_addremovevehicle 			= xlib.makebutton{x=105, y=125, w=25, h=25,  parent=panel_buildervehicles, label="+", disabled=true }
local text_vehicleenter 				= xlib.maketextbox{x=0, y=125, w=105, h=25, parent=panel_buildervehicles}
local check_vehiclelisttype 			= xlib.makecheckbox{ x=0, y=153, label="La lista es una Blacklist", parent=panel_buildervehicles, repconvar="rep_kylebuildmode_vehiclelistmode"}

list_builderweapons:AddColumn( "Armas de Builder" )
list_builderweapons.OnRowSelected 		= function()
											button_addremoveweapon:SetText("-")
											button_addremoveweapon.a = false
											button_addremoveweapon:SetDisabled(false)
										end
button_addremoveweapon.DoClick 			= function()
											if button_addremoveweapon.a then
												RunConsoleCommand( "kylebuildmode", "addweapon",  text_weaponenter:GetValue())
												text_weaponenter:SetValue("")
											else
												if list_builderweapons:GetSelected()[1]:GetColumnText(1) then
													RunConsoleCommand("kylebuildmode", "removeweapon",  list_builderweapons:GetSelected()[1]:GetColumnText(1))
												end
											end

											button_addremoveweapon:SetDisabled(true)
										end
text_weaponenter.OnEnter 				= function()
											if text_weaponenter:GetValue() then
												RunConsoleCommand("kylebuildmode", "addweapon", text_weaponenter:GetValue())
												button_addremoveweapon:SetDisabled(true)
											end
										end
text_weaponenter.OnChange 				= function()
	button_addremoveweapon:SetText("+")
	button_addremoveweapon.a = true

	if text_weaponenter:GetValue() then
		button_addremoveweapon:SetDisabled(false)
	else
		button_addremoveweapon:SetDisabled(true)
	end
end

list_builderentities:AddColumn( "Builder SENTs" )
list_builderentities.OnRowSelected		= function()
	button_addremoveentity:SetText("-")
	button_addremoveentity.a = false
	button_addremoveentity:SetDisabled(false)
end
button_addremoveentity.DoClick 			= function()
	if button_addremoveentity.a then
		RunConsoleCommand( "kylebuildmode", "addentity",  text_entityenter:GetValue())
		text_entityenter:SetValue("")
	else
		if list_builderentities:GetSelected()[1]:GetColumnText(1) then
			RunConsoleCommand("kylebuildmode", "removeentity",  list_builderentities:GetSelected()[1]:GetColumnText(1))
		end
	end
	button_addremoveentity:SetDisabled(true)
end
text_entityenter.OnEnter 				= function()
	if text_entityenter:GetValue() then
		RunConsoleCommand("kylebuildmode", "removeentity", text_entityenter:GetValue())
		button_addremoveentity:SetDisabled(true)
	end
end
text_entityenter.OnChange 				= function()
	button_addremoveentity:SetText("+")
	button_addremoveentity.a = true

	if text_entityenter:GetValue() then
		button_addremoveentity:SetDisabled(false)
	else
		button_addremoveentity:SetDisabled(true)
	end
end

list_buildervehicles:AddColumn( "Vehiculos de Builder" )
list_buildervehicles.OnRowSelected 		= function()
	button_addremovevehicle:SetText("-")
	button_addremovevehicle.a = false
	button_addremovevehicle:SetDisabled(false)
end
button_addremovevehicle.DoClick 		= function()
	if button_addremovevehicle.a then
		RunConsoleCommand( "kylebuildmode", "addvehicle",  text_vehicleenter:GetValue())
		text_vehicleenter:SetValue("")
	else
		if list_buildervehicles:GetSelected()[1]:GetColumnText(1) then
			RunConsoleCommand("kylebuildmode", "removevehicle",  list_buildervehicles:GetSelected()[1]:GetColumnText(1))
		end
	end
	button_addremovevehicle:SetDisabled(true)
end
text_vehicleenter.OnEnter 				= function()
	if text_vehicleenter:GetValue() then
		RunConsoleCommand("kylebuildmode", "removevehicle", text_vehicleenter:GetValue())
		button_addremovevehicle:SetDisabled(true)
	end
end
text_vehicleenter.OnChange 				= function()
	button_addremovevehicle:SetText("+")
	button_addremovevehicle.a = true

	if text_vehicleenter:GetValue() then
		button_addremovevehicle:SetDisabled(false)
	else
		button_addremovevehicle:SetDisabled(true)
	end
end

local panel_builderhalo					= xlib.makepanel{ x=5, y=0, w=130, h=150, parent=panel_advanced}
local label_builderhalo 				= xlib.makelabel{ x=0, y=0, w=500, h=15, parent=panel_builderhalo, label="Builder Halo Color" }
local color_builderhalo 				= xlib.makecolorpicker{ x=0, y=15, parent=panel_builderhalo }
local panel_pvphalo 					= xlib.makepanel{ x=140, y=0, w=130, h=150, parent=panel_advanced}
local label_pvphalo 					= xlib.makelabel{ x=0, y=0, w=500, h=15, parent=panel_pvphalo, label="PVPer Halo Color" }
local color_pvphalo 					= xlib.makecolorpicker{ x=0, y=15, parent=panel_pvphalo }
function color_builderhalo:OnChange( z )
	z = {z["r"],z["g"],z["b"]}
	RunConsoleCommand("kylebuildmode", "set", "highlightbuilderscolor", string.sub(table.ToString(z), 2, string.len(table.ToString(z))-2))
end
function color_pvphalo:OnChange( z )
	z = {z["r"],z["g"],z["b"]}
	RunConsoleCommand("kylebuildmode", "set", "highlightpvperscolor", string.sub(table.ToString(z), 2, string.len(table.ToString(z))-2))
end

--"Help" Panel
local panel_help					= panels[6]["panel"]
local label_steam					= xlib.makelabel{ x=0, y=260, w=500, h=15, parent=panel_help, label="For questions and comments, click here:" }
local button_steam					= xlib.makebutton{x=0, y=275, w=240, h=15,  parent=panel_help, label="http://steamcommunity.com/sharedfiles/filedetails/?id=1308900979" }
button_steam.DoClick 				= function()
										gui.OpenURL( "http://steamcommunity.com/sharedfiles/filedetails/?id=1308900979")
									end
local label_github					= xlib.makelabel{ x=0, y=290, w=500, h=15, parent=panel_help, label="For information, issues, and requests click here:" }
local button_github					= xlib.makebutton{x=0, y=305, w=240, h=15,  parent=panel_help, label="https://github.com/kythre/Buildmode-ULX" }
button_github.DoClick 				= function()
										gui.OpenURL( "https://github.com/kythre/Buildmode-ULX/")
									end

for k in pairs(panels) do
	panels[k]["panel"]:SetVisible(false)
end

local list_categories = xlib.makelistview{ x=5, y=5, w=150, h=320, parent=b }
list_categories:AddColumn( "Categories" )
list_categories.Columns[1].DoClick = function() end
list_categories:AddLine("Entering")
list_categories:AddLine("Buildmode")
list_categories:AddLine("Exiting")
list_categories:AddLine("Extras")
list_categories:AddLine("Advanced")
list_categories:AddLine("Help")
list_categories.OnRowSelected = function(self, LineID)
	for k in pairs(panels) do
		panels[k]["panel"]:SetVisible(false)
	end
	panels[LineID]["panel"]:SetVisible(true)
end

net.Receive( "kylebuildmode_senddata", function()
	_Kyle_Buildmode = net.ReadTable()

	list_builderweapons:Clear()
	for y,z in pairs(_Kyle_Buildmode["buildloadout"]) do
		list_builderweapons:AddLine(z)
	end

	list_builderentities:Clear()
	for y,z in pairs(_Kyle_Buildmode["builderentitylist"]) do
		list_builderentities:AddLine(z)
	end

	list_buildervehicles:Clear()
	for y,z in pairs(_Kyle_Buildmode["buildervehiclelist"]) do
		list_buildervehicles:AddLine(z)
	end
	local z = string.Split( _Kyle_Buildmode["highlightbuilderscolor"],"," )
	color_builderhalo:SetColor( Color(z[1],z[2],z[3]))
	z = string.Split( _Kyle_Buildmode["highlightpvperscolor"],"," )
	color_pvphalo:SetColor( Color(z[1],z[2],z[3]))
	
	panels[1]["panelItems"]["builddelay"]["number"]:SetValue(_Kyle_Buildmode["builddelay"])
	panels[3]["panelItems"]["pvpdelay"]["number"]:SetValue(_Kyle_Buildmode["pvpdelay"])
	panels[4]["panelItems"]["spawnprotection"]["number"]:SetValue(_Kyle_Buildmode["spawnprotection"])
end )
xgui.addSettingModule("Buildmode", b, "icon16/eye.png", "kylebuildmodesettings" )