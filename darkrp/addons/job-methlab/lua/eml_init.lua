local function map() return string.lower(game.GetMap()) end

if SERVER then
    util.AddNetworkString("EML.SendToCL")
    util.AddNetworkString("EML.SendToSV")
    util.AddNetworkString("EML.setpos")
    util.AddNetworkString("EML.remove")

    hook.Add("PlayerInitialSpawn", "EML.SetNW", function(ply)
        ply:SetNWInt("meth.amount", 0)
    end)

    function spawnBuyer()    
        if not file.IsDir("eml", "DATA") then
            file.CreateDir("eml", "DATA")
        end
        
        if not file.IsDir("eml/methbuyer/" .. map(), "DATA") then
            file.CreateDir("eml/methbuyer/".. map(), "DATA")
        end

        for _, File in pairs(file.Find("eml/methbuyer/".. map() .. "/*.txt", "DATA")) do
            local methPosFile = file.Read("eml/methbuyer/" .. map() .. "/" .. File, "DATA")
        
            local spawnNumber = string.Explode(";", methPosFile)
            
            local methPos = Vector(spawnNumber[1], spawnNumber[2], spawnNumber[3])
            local methAngles = Angle(tonumber(spawnNumber[4]), spawnNumber[5], spawnNumber[6])
            
            local methBuyer = ents.Create("eml_buyer")
            methBuyer:SetPos(methPos)
            methBuyer:SetAngles(methAngles)
            methBuyer:Spawn()
        end
    end
    timer.Simple(1, spawnBuyer)

    net.Receive("EML.setpos", function(_, ply)
        local fileMethName = net.ReadString()
            
        if file.Exists( "eml/methbuyer/".. map() .."/meth_".. fileMethName ..".txt", "DATA") then 

            net.Start("EML.SendToCL")
                net.WriteString("This name is alredy in use, choose another one or remove this one by typing 'methbuyer_remove " .. fileMethName .. "' in console.")
            net.Send(ply)

            return
        end

        local methVector = string.Explode(" ", tostring(ply:GetEyeTrace().HitPos))
        local methAngles = string.Explode(" ", tostring(ply:GetAngles() + Angle(0, -180, 0)))
            
        file.Write("eml/methbuyer/".. map() .."/meth_".. fileMethName ..".txt", ""..(methVector[1])..";"..(methVector[2])..";"..(methVector[3])..";"..(methAngles[1])..";"..(methAngles[2])..";"..(methAngles[3]).."", "DATA")

        net.Start("EML.SendToCL")
            net.WriteString("New pos for the Meth Addicted NPC has been set. Restart your server!")
        net.Send(ply)
        
    end)

    net.Receive("EML.remove", function(_, ply)
        local fileMethName = net.ReadString()
            
        if file.Exists("eml/methbuyer/".. map() .."/meth_" .. fileMethName .. ".txt", "DATA") then

            file.Delete("eml/methbuyer/".. map() .."/meth_" .. fileMethName .. ".txt")

            net.Start("EML.SendToCL")
                net.WriteString("This NPC has been removed. Restart your server!")
            net.Send(ply)
        else
            net.Start("EML.SendToCL")
                net.WriteString("This NPC doesn't exists!")
            net.Send(ply)
        end
    end)

else

    net.Receive("EML.SendToCL", function()
        local str = net.ReadString()

        chat.AddText(Color(0, 240, 250), "[Meta] ", Color(255,255,255), str)
    end)

    concommand.Add("methbuyer_setpos", function(ply, _, args)
        if not ply:IsAdmin() then return end

        local fileMethName = args[1]
            
        if not fileMethName then

            chat.AddText(Color(0, 240, 250), "[Meta] ", Color(255,255,255), "Choose a name for your Meth Addicted NPC!")

            return
        end

        net.Start("EML.setpos")
            net.WriteString(fileMethName)
        net.SendToServer()
    end)

    concommand.Add("methbuyer_remove", function(ply, _, args)
        if not ply:IsAdmin() then return end
        
        local fileMethName = args[1]
            
        if not fileMethName then
            chat.AddText(Color(0, 240, 250), "[Meta] ", Color(255,255,255), "Please enter a name of file!")

            return
        end

        net.Start("EML.setpos")
            net.WriteString(fileMethName)
        net.SendToServer()
    end)
end