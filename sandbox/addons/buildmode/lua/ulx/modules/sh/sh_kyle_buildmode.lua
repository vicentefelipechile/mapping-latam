local function entitydata(z) 
	print("Me", z)
	print("Owner", z:GetOwner())
	print("Class", z:GetClass())
	print("Model", z:GetModel())
	print("Name", z:GetName())
	print("MoveParent", z:GetMoveParent())
	print("Creator", z:GetCreator())
	print("Parent", z:GetParent())
	print("RagdollOwner", z:GetRagdollOwner())
	print("Children")
	print("PhysicsObject", z:GetPhysicsObject())
	PrintTable(z:GetChildren())
	print("Table")
	PrintTable(z:GetTable())
	print("GetAttachments")
	PrintTable(z:GetAttachments())
	print()
end

--put this in a seperate file at some point
if SERVER then
	local function _kyle_Prop_TryUnNoclip(z)	
		-- simple gross fix for the collision group not staying noclipped for whatever reason
		-- if it needs to be unnoclipped it should be noclipped in the first place right?
		-- props are still collidable right after spawn for some reason
		z:SetCollisionGroup(COLLISION_GROUP_WORLD)
		-- added for when this is called when the vehicle isnt actually noclipped but this is called anyway causing the object to be noclipped forever  ?
		z.buildnoclipped = true

		timer.Simple(0.5, function() 	
			--Exit if the prop stops existing or isnt noclipped or has already attempted unnoclipping for too long
			if not (z:IsValid() and z.buildnoclipped and z:GetNWInt("_kyle_unnoclip_attempt", 0) < 100) then 
				z:SetNWInt("_kyle_unnoclip_attempt", 0)
				return 
			end
			z:SetNWInt("_kyle_unnoclip_attempt", z:GetNWInt("_kyle_unnoclip_attempt", 0)+1)
			
			local d = false
			local reason = ""
			local preventUnNoclip = {}
	
			preventUnNoclip["DriverInBuildmode"] = z:IsVehicle() and z:GetDriver().buildmode 
			preventUnNoclip["MovingTooQuickly"] = z:GetVelocity():Length() > 2
			preventUnNoclip["Physgunned"] = z:GetNWBool("Physgunned")
			preventUnNoclip["BuildparentNoclipped"] = IsValid(z.buildparent) and z.buildparent.buildnoclipped
			preventUnNoclip["SCarParentNoclipped"] = IsValid(z.SCarOwner) and z.SCarOwner:GetNWBool("Physgunned")
			
			for i, bool in pairs(preventUnNoclip) do
				d = d or bool
				if bool then
					reason = reason .. i .. ";"
				end
			end
	
			--enttiy interference 
			if not d then
				--Check to see if there is anything inside the props bounds
				local a,b = z:GetCollisionBounds()
				local c = ents.FindInBox(z:LocalToWorld(a), z:LocalToWorld(b))
				for aa,ab in pairs(c) do
					--if e then ignore this blocking entity
					local e = false
	
					if z == ab	then
						e = true
					end
	
					local ignoreCheck = {}
	
					ignoreCheck["IsntSolid"] = not ab:IsSolid()
					ignoreCheck["IsParentCheckChildParent"] = z:GetParent() == ab
					ignoreCheck["IsParentCheckChildOwner"] = z:GetOwner() == ab
					ignoreCheck["IsChildCheckChildOnwer"] = z == ab:GetOwner()
					ignoreCheck["IsChildCheckChilldParent"] = z == ab:GetParent()
					ignoreCheck["IsDriver"] = z:IsVehicle() and ab == z:GetDriver() 
					ignoreCheck["IsWacHitDetector"] = ab:GetClass() == "wac_hitdetector"
					ignoreCheck["IsWeapon"] = ab:IsWeapon()
					ignoreCheck["CommonFounder"] = z.Founder and z.Founder == ab.Founder
					--SCars Support
					--check to see if we are the parent of the blocking prop
					ignoreCheck["IsSCarChild"] = z == ab:GetParent().SCarOwner
	
					if CPPI then
				--		ignoreCheck["CommonCPPIOwner"] = z:CPPIGetOwner() == ab:CPPIGetOwner() and ab:GetClass() == "prop_physics"
				--		ignoreCheck["CommonBuildOwner"] = z.buildOwner == ab.buildOwner and ab:GetClass() == "prop_physics"
						ignoreCheck["CommonFounder-CPPIOwner"] = z:CPPIGetOwner() and z:CPPIGetOwner() == ab.Founder
						ignoreCheck["CommonFounder-BuildOwner"] = z.buildOwner and z.buildOwner == ab.Founder
					end

					--simfphys support
					if simfphys and simfphys.IsCar then
						--if we are a wheel of a the simfphys car that is blocking us
						ignoreCheck["IsSimfphysCarWhileSimfphysWheel"] = simfphys.IsCar(ab) and table.HasValue(ab.Wheels, z)
						--if we are a prop that is owned by a simfphys car
						ignoreCheck["IsSimfphysCarChild"] = simfphys.IsCar(ab:GetOwner())
						--if we are a simfphys car and the blocking entity is the driver
						ignoreCheck["IsDriverWhileSimfphysCar"] = simfphys.IsCar(z) and ab == z:GetDriver()
						--if we are a simfphys car wheel and the blocking entity is a part of our car
						--if the blocking entity's parent is a simfphys car and we are a wheel from that car
						ignoreCheck["IsCarPartWhileSimfphysWheel"] = simfphys.IsCar(ab:GetParent()) and table.HasValue(ab:GetParent().Wheels, z)
					end
					
					for i, bool in pairs(ignoreCheck) do
						e = e or bool
					end
	
					--check to see if the we have any constraints on the blocking entity
					--check e to avoid any unnecessary overhead
					if not e and z.Constraints then
						for aa in pairs(z.Constraints) do
							if IsValid(z.Constraints[aa]) and z.Constraints[aa]:IsConstraint() then 
								local a, b = z.Constraints[aa]:GetConstrainedEntities()
								if ab == a or ab == b then
									e = true
									break
								end
							end
						end
					end
					
					if not e then 
						reason = reason .. ab:GetClass() .. " entity interference;"
						d = true
						--print()
						--print(z:GetNWInt("_kyle_unnoclip_attempt", 0))
						--entitydata(z)
						--print(scar)
						--print(z:GetTable()["pSeat"][1])
						--PrintTable(ab:GetTable())
						--print(z:GetTable()["Wheels"][1]:GetModel())
						break
					else
					--	print(ab)
					--	PrintTable(ignoreCheck)
					end
				end	
			end
			
			--finally un noclip or try again
			if not d then
				--Recall the old attributes
				z:SetColor(Color(z:GetColor()["r"], z:GetColor()["g"], z:GetColor()["b"], z:GetNWInt("Alpha")))
				z:SetRenderMode(z:GetNWInt("RenderMode")) 
				z:SetCollisionGroup(z:GetNWInt("CollisionGroup"))
				z.buildnoclipped = false
				z.buildparent = nil
				z:SetNWInt("_kyle_unnoclip_attempt", 0)
			else
				--print(z, reason)
				--entitydata(z)
				--if it fails, try again
				_kyle_Prop_TryUnNoclip(z)
			end
		end )
	end
	
	local function _kyle_Prop_Noclip_Sub(z)
		if not IsEntity(z) or z.buildnoclipped then print("kyle buildmode wtf") return end
		
		--Store the old attributes (to be recalled later)
		z:SetNWInt("RenderMode", z:GetRenderMode())
		z:SetNWInt("Alpha", z:GetColor()["a"])
		z:SetNWInt("CollisionGroup", z:GetCollisionGroup())			
		--Set the new attributes
		z:SetCollisionGroup(COLLISION_GROUP_WORLD)
		z:SetRenderMode(1)
		z:SetColor(Color(z:GetColor()["r"], z:GetColor()["g"], z:GetColor()["b"], 200))
		z.buildnoclipped = true
		z:SetNWInt("_kyle_unnoclip_attempt", 0)


		--Try to un noclip asap if its not a vehicle being driven by a builder
		_kyle_Prop_TryUnNoclip(z)
	end
	
	local function _kyle_Prop_Noclip(z)
		if (not IsEntity(z)) or z.buildnoclipped then return end
		
		_kyle_Prop_Noclip_Sub(z)
	
		if IsValid(z:GetParent()) then
			_kyle_Prop_Noclip(z:GetParent())
		end
	
		--simfphys
		if simfphys and simfphys.IsCar and z:GetClass() == "gmod_sent_vehicle_fphysics_wheel" then

			local a
			--run through all the constraints to find the car
			for aa in pairs(z.Constraints) do
				local b, c = z.Constraints[aa]:GetConstrainedEntities()
				if b ~= nil and simfphys.IsCar(b) then a = b break end
			end
			
			--noclip the car
			_kyle_Prop_Noclip_Sub(a)

			--noclip all the wheels
			for aa,ab in pairs(a.Wheels) do
				_kyle_Prop_Noclip_Sub(ab)
			end
			
			return
		end	
	
		--noclip constrained props
		if z.Constraints then
			for aa, ab in pairs(z.Constraints) do
				if IsValid(ab) then
					local a, b = ab:GetConstrainedEntities()	
					local c
					
					--if the consraint isnt just an entity to itself
					--set c to the entity that isnt z
					if a ~= b then
						c = z==a and b or a
					end				
					
					-- if IsValid(z.buildparent) then
						-- print(z, z.buildparent, c)
					-- end
					
					--if we found a valid entity constrained to z
					if c and (not c:GetNWBool("Physgunned")) and (not IsValid(c.buildparent)) and not (z.buildparent == c)  then
						c.buildparent = z
						_kyle_Prop_Noclip(c) 
					end
				end
			end	
		end
	end
	
	local function hasValue (tbl, value)
		if table.HasValue(tbl, value) then return true end
	
		for k,v in pairs(tbl) do
			if string.find(v, "*") then
				if string.match(value, "^(" .. string.sub(v, 1, -2) .. ")" ) then
					return true
				end
			end
		end
	
		return false
	end	

	local function _kyle_builder_spawn_weapon(y, z)
		local restrictweapons = _Kyle_Buildmode["restrictweapons"]=="1" and y.buildmode
	
		if restrictweapons then 
			local restrictionmet = (_Kyle_Buildmode["weaponlistmode"]=="0") == hasValue(_Kyle_Buildmode["buildloadout"], z)
			local adminbypass = y:IsAdmin() and _Kyle_Buildmode["adminsbypassrestrictions"]=="1"
			return restrictionmet or adminbypass
		else
			return true
		end
	end
	
	local function _kyle_builder_spawn_entity(y, z)
		local restrictsents = _Kyle_Buildmode["restrictsents"]=="1" and y.buildmode
		
		if restrictsents then 
			local restrictionmet = (_Kyle_Buildmode["entitylistmode"]=="0") == hasValue(_Kyle_Buildmode["builderentitylist"], z)
			local adminbypass = y:IsAdmin() and _Kyle_Buildmode["adminsbypassrestrictions"]=="1"
			return restrictionmet or adminbypass
		else
			return true
		end 
	end
	
	local function _kyle_builder_allow_vehicle(y, z)
		if _Kyle_Buildmode["restrictvehicles"]=="1" and y.buildmode then
			if isentity(z) then
				if simfphys and simfphys.IsCar and z:GetTable()["base"] and simfphys.IsCar(z:GetTable()["base"]) then
					z = z:GetTable()["base"]
				end
	
				if IsValid(z:GetParent()) then
					z = z:GetParent()
				end
	
				if IsValid(z:GetTable()["EntOwner"]) then
					z = z:GetTable()["EntOwner"]
				end
	
				if IsEntity(z) and z:GetTable()["VehicleName"] then
					z = z:GetTable()["VehicleName"]
				end
	
				if IsEntity(z) and z:GetClass() then
					z = z:GetClass()
				end
	
				-- ignore wac for now because theyre sents and not vehicles
				if string.StartWith(z, "wac") then
					return true
				end
			end
			local restrictionmet = (_Kyle_Buildmode["vehiclelistmode"]=="0") == hasValue(_Kyle_Buildmode["buildervehiclelist"], z)
			local adminbypass = y:IsAdmin() and _Kyle_Buildmode["adminsbypassrestrictions"]=="1"
			return restrictionmet or adminbypass
		else
			return true
		end
	end

	local function _kyle_Buildmode_Enable(z)
		if z:Alive() then
			if _Kyle_Buildmode["restrictweapons"]=="1" then			
				--save the players loadout for when they exit buildmode
				ULib.getSpawnInfo(z)
				--remove their weapons
				z:StripWeapons()
				--give them whitelisted weapons
				for x,y in pairs(_Kyle_Buildmode["buildloadout"]) do 
					z:Give(y)
				end
			end
			
			z.buildmode = true
			
			--noclip their vehicle so they cant run anyone anyone over while in buildmode
			if z:InVehicle() then
				if _kyle_builder_allow_vehicle(z, z:GetVehicle()) then
					_kyle_Prop_Noclip(z:GetVehicle())
				else
					z:ExitVehicle()
					z:SendLua("GAMEMODE:AddNotify(\"You cannot enter this vehicle while in Buildmode.\",NOTIFY_GENERIC, 5)")
				end
			end
		end
	
		--some say that sendlua is lazy and wrong but idc
			z:SendLua("GAMEMODE:AddNotify(\"Modo Builder Activado. Escribe !pvp para desactivarlo.\",NOTIFY_GENERIC, 5)")
		
		--second buildmode variable for halos and status text on hover
		z:SetNWBool("_Kyle_Buildmode", true)
		
		--boolean to say if buildmode was enabled because the player had just spawned
		z:SetNWBool("_Kyle_BuildmodeOnSpawn", z:GetNWBool("_kyle_died"))

		hook.Run ("OnPlayerSwitchModePVPBUILD", z, true)
	end
	
	local function _kyle_Buildmode_Disable(z)
		local timername = "_Kyle_Buildmode_spawnprotection_" .. z:GetName()
		if timer.Exists(timername) then
			timer.Destroy(timername)
		end
	
		z.buildmode = false
		
		--second buildmode variable for halos and status text on hover
		z:SetNWBool("_Kyle_Buildmode", false)
		
		--some say that sendlua is lazy and wrong but idc
		z:SendLua("GAMEMODE:AddNotify(\"Modo Builder desactivado.\",NOTIFY_GENERIC, 5)")
		
		if z:Alive() then
			--save their position incase they dont need to return to spawn on exit
			local pos = z:GetPos()
			
			--if they are in a vehicle try to un noclip their vehicle and kick them out of it if they need to return to spawn
			if z:InVehicle() then
				if IsValid(z:GetVehicle()) and z:GetVehicle().buildnoclipped then
					_kyle_Prop_TryUnNoclip(z:GetVehicle())
				end
				
				if _Kyle_Buildmode["returntospawn"]=="1" then
					z:ExitVehicle()
				end
			end		
			
			ULib.spawn(z, not z:GetNWBool("_Kyle_BuildmodeOnSpawn"))
			
			if _Kyle_Buildmode["restrictweapons"]=="1" and z:GetNWBool("_Kyle_BuildmodeOnSpawn") then
				z:ConCommand("kylebuildmode defaultloadout")
			end		
			
			--ULIB.spawn moves the player to spawn, this will return the player to where they where while in buildmode
			if _Kyle_Buildmode["returntospawn"]=="0" then
				z:SetPos(pos)
			end
	
			--disable noclip if they had it in build		
			if z:GetNWBool("kylenocliped") then
				z:ConCommand( "noclip" )
			end
		end
		
		hook.Run ("OnPlayerSwitchModePVPBUILD", z, false)
	end

	hook.Add("PlayerSpawnedProp", "KylebuildmodePropKill", function(x, y, z)
		if not CPPI then 
			z.buildOwner = x
		end
	
		if x.buildmode and _Kyle_Buildmode["antipropkill"]=="1" then
			_kyle_Prop_Noclip(z)
		end
		
		if not x.buildmode and _Kyle_Buildmode["antipropkillpvper"]=="1" then
			_kyle_Prop_Noclip(z)
		end
	end)
	
	hook.Add("PlayerSpawnedSENT", "KylebuildmodePropKillSENT", function(y, z)
		if CLIENT then return end
	
	
		if not CPPI then 
			z.buildOwner = y
		end
	
		if y.buildmode and _Kyle_Buildmode["antipropkill"]=="1" then
			_kyle_Prop_Noclip(z)
		end
		
		if not y.buildmode and _Kyle_Buildmode["antipropkillpvper"]=="1" then
			_kyle_Prop_Noclip(z)
		end
	end)

	hook.Add("PlayerSpawnedVehicle", "KylebuildmodePropKill", function(y, z)
		if not CPPI then 
			z.buildOwner = x
		end
		
		if y.buildmode and _Kyle_Buildmode["antipropkill"]=="1" then
			_kyle_Prop_Noclip(z)
		end
		
		if not y.buildmode and _Kyle_Buildmode["antipropkillpvper"]=="1" then
			_kyle_Prop_Noclip(z)
		end
	end)

	hook.Add("PlayerEnteredVehicle", "KylebuildmodePropKill", function(y, z)
		if y.buildmode and _Kyle_Buildmode["antipropkill"]=="1" then
			_kyle_Prop_Noclip(z)
		end
		
		if not y.buildmode and _Kyle_Buildmode["antipropkillpvper"]=="1" then
		--	_kyle_Prop_Noclip(z)
		end
	end)
	
	hook.Add("PlayerLeaveVehicle", "KylebuildmodePropKill", function(y, z)
		if IsValid(z) and z.buildnoclipped then
			_kyle_Prop_TryUnNoclip(z)
		end
	end)

	hook.Add("PhysgunPickup", "KylebuildmodePropKill", function(y, z)	
		if IsValid(z) and (not z:IsPlayer()) and y.buildmode and _Kyle_Buildmode["antipropkill"]=="1" then 
			z:SetNWBool("Physgunned", true)
			_kyle_Prop_Noclip(z)
		end
		
		if IsValid(z) and not z:IsPlayer() and not y.buildmode and _Kyle_Buildmode["antipropkillpvper"]=="1" then 
			z:SetNWBool("Physgunned", true)
			_kyle_Prop_Noclip(z)
		end
		
		--entitydata(z) 
	end, HOOK_MONITOR_LOW )

	hook.Add("PhysgunDrop", "KylebuildmodePropKill", function(y, z)	
		if IsValid(z) and (not z:IsPlayer()) and y.buildmode and _Kyle_Buildmode["antipropkill"]=="1" then 
			z:SetNWBool("Physgunned", false)
			
			--Kill the prop's velocity so it can not be thrown
			z:SetPos(z:GetPos())
		end
		
		if IsValid(z) and (not z:IsPlayer()) and not y.buildmode and _Kyle_Buildmode["antipropkillpvper"]=="1" then
			z:SetNWBool("Physgunned", false)
			
			--Kill the prop's velocity so it can not be thrown
			z:SetPos(z:GetPos())
		end
		
		if IsValid(z) and (not z:IsPlayer()) and z.buildnoclipped then	
			_kyle_Prop_TryUnNoclip(z)
		end
	end)

	hook.Add("PlayerNoClip", "KylebuildmodeNoclip", function(y, z)	
		if _Kyle_Buildmode["allownoclip"]=="1" and ULib.ucl.query(y, "kylebuildmodenoclip", true) then
			--allow players to use default sandbox noclip
			y:SetNWBool("kylenocliped", z)
			return z == false or z == y.buildmode
		elseif _Kyle_Buildmode["allownoclip"]=="1" then 
			y:SendLua("GAMEMODE:AddNotify(\"You do not have permission to use noclip in Buildmode\",NOTIFY_ERROR, 5)")
		end
	end )

	hook.Add("PlayerSpawn", "kyleBuildmodePlayerSpawn",  function(z)
		--z:GetNWBool("_kyle_died") makes sure that the player is spawning after an actual death and not the ulib respawn function
		if ((_Kyle_Buildmode["spawnwithbuildmode"]=="1" and _Kyle_Buildmode["persistpvp"]=="0") or z:GetNWBool("_Kyle_Buildmode")) and z:GetNWBool("_kyle_died") then
			_kyle_Buildmode_Enable(z)
		elseif (not z:GetNWBool("_Kyle_Buildmode")) and z:GetNWBool("_kyle_died") then
			if tonumber(_Kyle_Buildmode["spawnprotection"])>0 then
				z:SendLua("GAMEMODE:AddNotify(\"".._Kyle_Buildmode["spawnprotection"].." seconds of Spawn Protection enabled. Type !pvp to disable\",NOTIFY_GENERIC, 5)")
				z.buildmode = true
				z:SetNWBool("_Kyle_Buildmode", true)
				local timername = "_Kyle_Buildmode_spawnprotection_" .. z:GetName()
				if timer.Exists(timername) then
					timer.Destroy(timername)
				end
				timer.Create(timername, _Kyle_Buildmode["spawnprotection"], 1, function()
					z:SetNWBool("_Kyle_Buildmode", false)
					z.buildmode = false
					if _Kyle_Buildmode["restrictweapons"]=="1" then
						z:ConCommand("kylebuildmode defaultloadout")
					end
					z:SendLua("GAMEMODE:AddNotify(\"Proteccion Spawn terminado\",NOTIFY_GENERIC, 5)")
				end)
			end
		end
		z:SetNWBool("_kyle_died", false)
		
		-- set z.buildmode to false if its nil. otherwise keep it at z.buildmode
		z.buildmode = z.buildmode or false;	
	end )
	
	hook.Add("PlayerInitialSpawn", "kyleBuildmodePlayerInitialSpawn", function (z) 
		z:SetNWBool("_kyle_died", true)
		if _Kyle_Buildmode["spawnwithbuildmode"] == "1" then
			z:SetNWBool("_Kyle_Buildmode", true)
		end
	end )
	
	hook.Add("PostPlayerDeath", "kyleBuildmodePostPlayerDeath",  function(z)
		z:SetNWBool("_kyle_died", true)
		local timername = "_Kyle_Buildmode_spawnprotection_" .. z:GetName()
		if timer.Exists(timername) then
			z:SetNWBool("_Kyle_Buildmode", false)
			z.buildmode = false
			timer.Destroy(timername)
		end
	end, HOOK_HIGH )
	
	hook.Add("PlayerGiveSWEP", "kylebuildmoderestrictswep", function(y, z)
			if not _kyle_builder_spawn_weapon(y, z) then
			--some say that sendlua is lazy and wrong but idc
			y:SendLua("GAMEMODE:AddNotify(\"You cannot give yourself this weapon while in Buildmode.\",NOTIFY_GENERIC, 5)")
			return false
			end
	end)
	
	hook.Add("PlayerSpawnSWEP", "kylebuildmoderestrictswep", function(y, z)
		if not _kyle_builder_spawn_weapon(y, z) then
			--some say that sendlua is lazy and wrong but idc
			y:SendLua("GAMEMODE:AddNotify(\"You cannot spawn this weapon while in Buildmode.\",NOTIFY_GENERIC, 5)")
			return false
			end
	end)
	
	hook.Add("PlayerCanPickupWeapon", "kylebuildmoderestrictswep", function(y, z)
			if not _kyle_builder_spawn_weapon(y, string.Split(string.Split(tostring(z),"][", true)[2],"]", true)[1]) then
				return false   
			end
	end)
	
	hook.Add("PlayerSpawnVehicle", "kylebuildmoderestrictvehicle", function(x, y, z, a)
		if not _kyle_builder_allow_vehicle(x, z) then
			--some say that sendlua is lazy and wrong but idc
			x:SendLua("GAMEMODE:AddNotify(\"You cannot spawn this vehicle while in Buildmode.\",NOTIFY_GENERIC, 5)")
			return false
		end
	end)
	
	hook.Add("CanPlayerEnterVehicle", "kylebuildmoderestrictvehicleentry", function(y, z)
		if not _kyle_builder_allow_vehicle(y, z) then
			--some say that sendlua is lazy and wrong but idc
			y:SendLua("GAMEMODE:AddNotify(\"You cannot enter this vehicle while in Buildmode.\",NOTIFY_GENERIC, 5)")
			return false
		end 
	end)
	
	hook.Add("PlayerSpawnSENT", "kylebuildmoderestrictsent", function(y, z)
			if not _kyle_builder_spawn_entity(y, z) then
				--some say that sendlua is lazy and wrong but idc
				y:SendLua("GAMEMODE:AddNotify(\"You cannot spawn this SENT while in Buildmode.\",NOTIFY_GENERIC, 5)")
				return false
			end
	end)
	
	hook.Add("PlayerSpawnProp", "kylebuildmoderestrictpropspawn", function(y, z)
		if _Kyle_Buildmode["pvppropspawn"]=="0" and not y.buildmode and not y:IsAdmin() then
			--some say that sendlua is lazy and wrong but idc
			y:SendLua("GAMEMODE:AddNotify(\"No puedes spawnear vehiculos en modo PVP.\",NOTIFY_GENERIC, 5)")
			return false
		end
	end)
	
	hook.Add("OnEntityCreated", "kylebuildmodeentitycreated", function(z)
		if z:GetClass() == "prop_combine_ball" then
			z:SetCustomCollisionCheck( true )
		end
	end)
	
	hook.Add("ShouldCollide", "kylebuildmodeShouldCollide", function(y, z)
		if y:GetClass() == "prop_combine_ball" and z:IsPlayer() then
			if y:GetOwner().buildmode or z.buildmode then 
				return false
			end
		end
	end)
	
	local function canDamangeNPC(z)
		return (z:IsNPC() or z:IsNextBot()) and  _Kyle_Buildmode["allownpcdamage"]=="1" 
	end

	hook.Add("EntityTakeDamage", "kyleBuildmodeTryTakeDamage", function(y, z)
		if y.buildmode then return true end
		if y.buildnoclipped then return true end

		if IsValid(z:GetAttacker()) then
			if z:GetAttacker():IsPlayer() and z:GetAttacker().buildmode then
				if canDamangeNPC(y) then return end
				return true
			end
	
			if z:GetAttacker().Owner and z:GetAttacker().Owner.buildmode then 
				if canDamangeNPC(y) then return end
				return true
			end
			
			if simfphys and simfphys.IsCar and simfphys.IsCar(z:GetAttacker()) and z:GetAttacker():GetDriver().buildmode or z:GetAttacker().buildnoclipped then
				if canDamangeNPC(y) then return end
				return true
			end
			
			if z:GetAttacker().buildnoclipped then
				if canDamangeNPC(y) then return end
				return true
			end
		end
		
		if IsValid(z:GetInflictor()) then
			if z:GetInflictor().Owner and z:GetInflictor().Owner.buildmode then 
				if canDamangeNPC(y) then return end
				return true
			end
		end
	end, HOOK_HIGH)
	
	local kylebuildmode = ulx.command( "_Kyle_1", "ulx build", function( calling_ply, should_revoke )
		if not calling_ply.buildmode and not should_revoke and not calling_ply:GetNWBool("kylependingbuildchange") then
			if _Kyle_Buildmode["builddelay"]!="0" then
				local delay = tonumber(_Kyle_Buildmode["builddelay"])
				calling_ply:SendLua("GAMEMODE:AddNotify(\"Enabling Buildmode in "..delay.." seconds.\",NOTIFY_GENERIC, 5)")
				calling_ply:SetNWBool("kylependingbuildchange", true)
				ulx.fancyLogAdmin(calling_ply, "#A entering Buildmode in "..delay.." seconds.")
				timer.Simple(delay, function() 
						_kyle_Buildmode_Enable(calling_ply) 
						calling_ply:SetNWBool("kylependingbuildchange", false)
						ulx.fancyLogAdmin(calling_ply, "#A entered Buildmode")
				end)
			else
				_kyle_Buildmode_Enable(calling_ply)
				ulx.fancyLogAdmin(calling_ply, "#A entered Buildmode")
			end
		elseif calling_ply.buildmode and should_revoke and not calling_ply:GetNWBool("kylependingbuildchange") then
			if _Kyle_Buildmode["pvpdelay"]!="0" then
				local delay = tonumber(_Kyle_Buildmode["pvpdelay"])
				calling_ply:SendLua("GAMEMODE:AddNotify(\"Disabling Buildmode in "..delay.." seconds.\",NOTIFY_GENERIC, 5)")
				ulx.fancyLogAdmin(calling_ply, "#A exiting Buildmode in "..delay.." seconds.")
				calling_ply:SetNWBool("kylependingbuildchange", true)
				timer.Simple(delay, function()
					_kyle_Buildmode_Disable(calling_ply)
					calling_ply:SetNWBool("kylependingbuildchange", false)
					ulx.fancyLogAdmin(calling_ply, "#A exited Buildmode")
				end)
			else
				_kyle_Buildmode_Disable(calling_ply)
				ulx.fancyLogAdmin(calling_ply, "#A exited Buildmode")
			end
		end
	end, "!build")
	kylebuildmode:defaultAccess(ULib.ACCESS_ALL)
	kylebuildmode:addParam{type=ULib.cmds.BoolArg, invisible=true}
	kylebuildmode:help("Grants Buildmode to self.")
	kylebuildmode:setOpposite("ulx pvp", {_, true}, "!pvp")

	local kylebuildmodeadmin = ulx.command("_Kyle_1", "ulx fbuild", function( calling_ply, target_plys, should_revoke)
		local affected_plys = {}
		for y,z in pairs(target_plys) do
			if not z.buildmode and not should_revoke then
				_kyle_Buildmode_Enable(z)
			elseif z.buildmode and should_revoke then
				_kyle_Buildmode_Disable(z)
			end
			table.insert(affected_plys, z)
		end

		if should_revoke then
			ulx.fancyLogAdmin(calling_ply, "#A revoked Buildmode from #T", affected_plys)
		else
			ulx.fancyLogAdmin(calling_ply, "#A granted Buildmode upon #T", affected_plys)
		end
	end, "!fbuild" )
	kylebuildmodeadmin:addParam{type=ULib.cmds.PlayersArg}
	kylebuildmodeadmin:defaultAccess(ULib.ACCESS_OPERATOR)
	kylebuildmodeadmin:addParam{type=ULib.cmds.BoolArg, invisible=true}
	kylebuildmodeadmin:help("Forces Buildmode on target(s).")
	kylebuildmodeadmin:setOpposite("ulx fpvp", {_, _, true}, "!fpvp")
end

hook.Add("PreDrawHalos", "KyleBuildmodehalos", function()
	local w = {}
	local x = {}
	
	if _Kyle_Buildmode["highlightonlywhenlooking"]=="0" then
		local z = {}
		for y,z in pairs(player.GetAll()) do
			if z:Alive() and z:GetRenderMode() != RENDERMODE_TRANSALPHA  then
				if z:GetNWBool("_Kyle_Buildmode")then
					table.insert(w, z)
				else
					table.insert(x, z)
				end
			end
		end
	else	
		local z = LocalPlayer():GetEyeTrace().Entity
		if z:IsPlayer() and z:Alive() and z:GetRenderMode() != RENDERMODE_TRANSALPHA then
			if z:GetNWBool("_Kyle_Buildmode") then
				table.insert(w, z)
			else
				table.insert(x, z)
			end
		end		
	end
	
	-- --add setting later for render mode
	if _Kyle_Buildmode["highlightbuilders"]=="1" then 
		z = string.Split( _Kyle_Buildmode["highlightbuilderscolor"],",")
		halo.Add(w, Color(z[1],z[2],z[3]), 4, 4, 1, true)
	end
	
	if _Kyle_Buildmode["highlightpvpers"]=="1" then 
		z = string.Split( _Kyle_Buildmode["highlightpvperscolor"],",")
		halo.Add(x, Color(z[1],z[2],z[3]), 4, 4, 1, true) 
	end	
end)

hook.Add("HUDPaint", "KyleBuildehudpaint", function()
	if _Kyle_Buildmode["showtextstatus"]=="1" then
		local z = LocalPlayer():GetEyeTrace().Entity
		if z:IsValid() and z:IsPlayer() and z:Alive() and z:GetRenderMode() != RENDERMODE_TRANSALPHA then
		
			local x,y = gui.MousePos()
			y=y+ScrH()*0.07414
		
			if x==0 or y==0 then	
				x = ScrW()/2
				y = ScrH()/1.74
			end

			local col = string.Split(_Kyle_Buildmode["highlightpvperscolor"],",")	
			local mode = "PVP"
			if z:GetNWBool("_Kyle_Buildmode") then
				mode = "Build"
				col = string.Split( _Kyle_Buildmode["highlightbuilderscolor"],",")
			end
			
			draw.TextShadow( {text=mode.."er", font="TargetID", pos={x,y}, xalign=TEXT_ALIGN_CENTER, yalign=TEXT_ALIGN_CENTER, color=team.GetColor(z:Team())}, 1 )
		end
	end
end)