include("shared.lua")

local function __round(num, numDecimalPlaces)
  local mult = 10^(numDecimalPlaces or 0)
  return math.floor(num * mult + 0.5) / mult
end

//Animate fan(s)
function ENT:Think()
	if LocalPlayer():GetPos():Distance(self:GetPos()) < 500 then
		if self:GetIsMining() then
			self.fanAng = self.fanAng + (FrameTime() * 400)
			for i = 0 , self:GetBoneCount() - 1 do
				if string.match( self:GetBoneName(i), "fan" ) ~= nil then
					self:ManipulateBoneAngles(i,Angle(self.fanAng,0,0))
				end
			end
		end 

		if self.prev ~= self:GetIsMining() then
			self:DestroyShadow()
			self:CreateShadow()
		end

		self.prev = self:GetIsMining()
	end
end 

//Yuck I know but its to much effort to re-write the entire system
function ENT:Initialize()
	self.fanAng = 0
	self.prev = false

	//So each bitminer can have its own set of unique instructions. This is how we will do that
	self.customInstructions = {
		status = { //Outputs usefull runtime infomation
			command = "STATUS",
			description = "Muestra información útil sobre el dispositivo actual.",
			action = function(arg1, arg2, instructionTable, ent, consoleDisplay)
				consoleDisplay.history = consoleDisplay.history.."\n------------------ESTADO------------------\n"
				local firstPart = "ESTA MINANDO                              "
				local secondPart = string.upper(tostring(ent:GetIsMining()))
				consoleDisplay.history = consoleDisplay.history..string.sub(firstPart, 1, string.len(firstPart) - string.len(secondPart))..secondPart.."\n"
				firstPart = "ENERGIA                                   "
				secondPart = string.upper(tostring(ent:GetHasPower()))
				consoleDisplay.history = consoleDisplay.history..string.sub(firstPart, 1, string.len(firstPart) - string.len(secondPart))..secondPart.."\n"
				consoleDisplay.history = consoleDisplay.history.."------------------------------------------\n\n"
			end
		},
		info = {
			command = "INFO",
			description = "Muestra especificaciones del dispositivo, como el uso de energía.",
			action = function(arg1, arg2, instructionTable, ent, consoleDisplay)
				consoleDisplay.history = consoleDisplay.history.."\n-------------------INFO------------------\n"
				local serverTable = util.JSONToTable(self:GetConnectedServers())
				local serverCount = 0
				for i = 1 , 8 do
					if serverTable[i] == true then
						serverCount = serverCount + 1
					end
				end
				consoleDisplay.history = consoleDisplay.history.."CONTADOR DE SERVIDORES                  "..serverCount.."\n"
				local firstPart = "VELOCIDAD GIGAHEARTZ                     "
				local secondPart = tostring(__round(ent:GetClockSpeed(), 3)).."Ghz"
				consoleDisplay.history = consoleDisplay.history..string.sub(firstPart, 1, string.len(firstPart) - string.len(secondPart))..secondPart.."\n"
				local firstPart = "NÚCLEOS                                  "
				local secondPart = ent:GetCoreCount()
				consoleDisplay.history = consoleDisplay.history..string.sub(firstPart, 1, string.len(firstPart) - string.len(secondPart))..secondPart.."\n"
				consoleDisplay.history = consoleDisplay.history.."REQUISITOS DE ENERGÍA      100-800W (MAX)\n"
				consoleDisplay.history = consoleDisplay.history.."NOMBRE DEL MODELO           Bitminer Rack\n"
				local playerName = self:Getowning_ent()
				if playerName ~= NULL then playerName = playerName:Name() else playerName = "Unknown" end
				consoleDisplay.history = consoleDisplay.history..string.sub("OWNER                                    ", 1, string.len("OWNER                                    ") - string.len(playerName))..playerName.."\n"
				consoleDisplay.history = consoleDisplay.history.."-----------------------------------------\n\n"
			end
		},
		mining = {
			command = "MINING",
			description = "Inicia o detiene del servidor a minar.",
			action = function(arg1, arg2, instructionTable, ent, consoleDisplay)
				if arg1 == nil then 
					consoleDisplay.history = consoleDisplay.history.."Para utilizar este comando, proporciona uno de los siguientes argumentos, 'mining start' o 'mining stop'\n"
				elseif arg1 == "start" then
					net.Start("BM2.Command.Mining")
						net.WriteEntity(ent)
						net.WriteBool(true)
					net.SendToServer()
				elseif arg1 == "stop" then
					net.Start("BM2.Command.Mining")
						net.WriteEntity(ent)
						net.WriteBool(false)
					net.SendToServer()
				else
					consoleDisplay.history = consoleDisplay.history.."La opción '"..arg1.."' no es una opción válida, las opciones son 'mining start' o 'mining stop'\n"
				end
			end
		},
		bitcoin = { //Used for selling or getting info about bitcoins
			command = "BITCOIN",
			description = "Te permite vender o ver información sobre los bitcoins almacenados.",
			action = function(arg1, arg2, instructionTable, ent, consoleDisplay)
				if arg1 == "info" then
					consoleDisplay.history = consoleDisplay.history.."\n-------------------BITCOIN------------------\n"
					local firstPart = "Cantidad de Bitcoins                        "
					local secondPart = comma_value(__round(ent:GetBitcoinAmount(), 2)).."btc"
					consoleDisplay.history = consoleDisplay.history..string.sub(firstPart, 1, string.len(firstPart) - string.len(secondPart))..secondPart.."\n"
					firstPart =	"Valor de Bitcoin ($)                        "
					secondPart = tostring(comma_value(__round(ent:GetBitcoinAmount() * BM2CONFIG.BitcoinValue, 2)))
					consoleDisplay.history = consoleDisplay.history..string.sub(firstPart, 1, string.len(firstPart) - string.len(secondPart))..secondPart.."\n"
					consoleDisplay.history = consoleDisplay.history.."--------------------------------------------\n\n"
				elseif arg1 == "sell" then
					net.Start("BM2.Command.SellBitcoins")
						net.WriteEntity(ent)
					net.SendToServer()
					local firstPart =	"De                                          "
					local secondPart = tostring(comma_value(__round(ent:GetBitcoinAmount(), 2))).."btc"
					consoleDisplay.history = consoleDisplay.history.."\n-------------------RECIBO-------------------\n"
					consoleDisplay.history = consoleDisplay.history..string.sub(firstPart, 1, string.len(firstPart) - string.len(secondPart))..secondPart.."\n"
					firstPart =	"Convertido a                                "
					secondPart = "$"..tostring(comma_value(__round(ent:GetBitcoinAmount() * BM2CONFIG.BitcoinValue, 2)))
					consoleDisplay.history = consoleDisplay.history..string.sub(firstPart, 1, string.len(firstPart) - string.len(secondPart))..secondPart.."\n"
					consoleDisplay.history = consoleDisplay.history.."El dinero se ha transferido a su billetera.\n"
					consoleDisplay.history = consoleDisplay.history.."--------------------------------------------\n\n"
				elseif arg1 == "vender" then
					net.Start("BM2.Command.SellBitcoins")
						net.WriteEntity(ent)
					net.SendToServer()
					local firstPart =	"De                                          "
					local secondPart = tostring(comma_value(__round(ent:GetBitcoinAmount(), 2))).."btc"
					consoleDisplay.history = consoleDisplay.history.."\n-------------------RECIBO-------------------\n"
					consoleDisplay.history = consoleDisplay.history..string.sub(firstPart, 1, string.len(firstPart) - string.len(secondPart))..secondPart.."\n"
					firstPart =	"Convertido a                                "
					secondPart = "$"..tostring(comma_value(__round(ent:GetBitcoinAmount() * BM2CONFIG.BitcoinValue, 2)))
					consoleDisplay.history = consoleDisplay.history..string.sub(firstPart, 1, string.len(firstPart) - string.len(secondPart))..secondPart.."\n"
					consoleDisplay.history = consoleDisplay.history.."El dinero se ha transferido a su billetera.\n"
					consoleDisplay.history = consoleDisplay.history.."--------------------------------------------\n\n"
				else
					if arg1 == nil then
						consoleDisplay.history = consoleDisplay.history.."Para utilizar este comando, proporciona uno de los siguientes argumentos, 'bitcoin info' o 'bticoin sell'\n"
					else
						consoleDisplay.history = consoleDisplay.history.."La opción '"..arg1.."' no es una opción válida, las opciones son 'bitcoin info' o 'bticoin sell'\n"
					end
				end
			end
		},
		upgrade = { //Used for selling or getting info about bitcoins
			command = "UPGRADE",
			description = "Muestra las mejoras disponibles que puedes comprar.",
			action = function(arg1, arg2, instructionTable, ent, consoleDisplay)
				if arg1 == "1" then //CPU
					net.Start("BM2.Command.Upgrade")
					net.WriteEntity(ent)
					net.WriteBool(false)
					net.SendToServer()
				elseif arg1 == "2" then //Cores
					net.Start("BM2.Command.Upgrade")
					net.WriteEntity(ent)
					net.WriteBool(true)
					net.SendToServer()
				else
					if arg1 == nil then
						consoleDisplay.history = consoleDisplay.history.."\n-------------------MEJORAS-------------------\n"
						local i = 0

						if self.upgrades.CPU.cost[self:GetCPUUpgrade() + 1] ~= nil then
							i = i + 1
							firstPart =	"[1] "..self.upgrades.CPU.name.."                                                              "
							secondPart = "                                             "
							thirdtPart = "$"..comma_value(self.upgrades.CPU.cost[self:GetCPUUpgrade() + 1])
							local str = string.sub(firstPart, 0, string.len(secondPart))
							consoleDisplay.history = consoleDisplay.history..string.sub(str, 1, string.len(str) - string.len(thirdtPart))..thirdtPart.."\n"
						end

						if self.upgrades.CORES.cost[self:GetCoreUpgrade() + 1] ~= nil then
							i = i + 1 
							firstPart =	"[2] "..self.upgrades.CORES.name.."                                                              "
							secondPart = "                                             "
							thirdtPart = "$"..comma_value(self.upgrades.CORES.cost[self:GetCoreUpgrade() + 1])
							local str = string.sub(firstPart, 0, string.len(secondPart))
							consoleDisplay.history = consoleDisplay.history..string.sub(str, 1, string.len(str) - string.len(thirdtPart))..thirdtPart.."\n"
						end

						if i == 0 then
							consoleDisplay.history = consoleDisplay.history.."No quedan mejoras para este dispositivo.\n"
						end

						consoleDisplay.history = consoleDisplay.history.."---------------------------------------------\nEscribe 'upgrade 1' o 'upgrade 2' para seleccionar uno.\n"
					else
						consoleDisplay.history = consoleDisplay.history.."La opción '"..arg1.."' no es una opción válida, las opciones son 'upgrade 1' o 'upgrade 2'\n"
					end
				end
			end
		},
		eject = {
			command = "EJECT",
			description = "Expulsa un servidor del rack.",
			action = function(arg1, arg2, instructionTable, ent, consoleDisplay)
				if arg1 == nil then
					consoleDisplay.history = consoleDisplay.history.."Para usar este comando, proporciona un servidor para expulsar, por ejemplo 'eject 4'\n"
				elseif isnumber(tonumber(arg1)) then
					net.Start("BM2.Command.Eject")
						net.WriteEntity(ent)
						net.WriteInt(tonumber(arg1), 8)
					net.SendToServer()
				else
					consoleDisplay.history = consoleDisplay.history.."La opción '"..arg1.."' no es una opción válida, las opciones son 'eject 1-8'\n"
				end
			end
		},
		servers = { 
			command = "SERVERS",
			description = "Muestra una lista de servidores en el rack.",
			action = function(arg1, arg2, instructionTable, ent, consoleDisplay)
				local servers = util.JSONToTable(self:GetConnectedServers())
				consoleDisplay.history = consoleDisplay.history.."\n------------------SERVIDORES----------------\n"
				for i = 1 , 8 do
					local firstPart =	"#"..i.."                                          "
					secondPart = "VACIO"
					if servers[i] then 
						secondPart = "INSERTADO"
					end
					consoleDisplay.history = consoleDisplay.history..string.sub(firstPart, 1, string.len(firstPart) - string.len(secondPart))..secondPart.."\n"
				end
				consoleDisplay.history = consoleDisplay.history.."--------------------------------------------\n"
			end
		},
	}  

	--Only add if DLC is loaded
	if BITMINERS_2_EXTRAS_DLC then
		self.customInstructions.remote = {
			command = "REMOTE",
			description = "Allows you to install and uninstall and change the name of a remote access module that will allow you to access the bitminer remotely using "..BM2EXTRACONFIG.RemoteAccessCommand..". Installing it costs $"..string.Comma(BM2EXTRACONFIG.RemoteAccessPrice)..".",
			action = function(arg1, arg2, instructionTable, ent, consoleDisplay)
				if arg1 == "install" then
					net.Start("BM2.Command.RemoteInstall")
					net.WriteEntity(ent)
					net.WriteBool(true)
					net.SendToServer()
					ent.remoteName = math.random(10,99).."."..math.random(100,800).."."..math.random(10,99).."."..math.random(100,800)
				elseif arg1 == "remove" then
					net.Start("BM2.Command.RemoteInstall")
					net.WriteEntity(ent)
					net.WriteBool(false)
					net.SendToServer()
				elseif arg1 == "setname" then
					local _string = arg2 or math.random(10,99).."."..math.random(100,800).."."..math.random(10,99).."."..math.random(100,800)
					ent.remoteName = _string
					consoleDisplay.history = consoleDisplay.history.."Remote name changed to '".._string.."'\n"
				else
					if arg1 == nil then
						consoleDisplay.history = consoleDisplay.history.."---------------------------------------------\nType 'REMOTE INSTALL' to install the remote module. Installing costs $"..string.Comma(BM2EXTRACONFIG.RemoteAccessPrice).." and allows to bitminer to be remotely access using "..BM2EXTRACONFIG.RemoteAccessCommand.."\nType 'REMOTE REMOVE' to uninstall the remote module.\nType 'REMOTE SETNAME ExampleName' to change the remote name of the bitminer. The name cannot contain spaces!\n"
					else
						consoleDisplay.history = consoleDisplay.history.."The option '"..arg1.."' is not a valid option, the options are 'install', 'setname' or 'remove'\n"
					end
				end
			end
		}
	end
end

function ENT:Draw()
	self:DrawModel()
end