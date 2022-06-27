local commands = {
    ["!discord"] = "Enlace del discord:\nhttps://discord.gg/GKdJv9ZUMC",
    ["!addons"] = "Enlace de los addons:\nhttps://steamcommunity.com/sharedfiles/filedetails/?id=2587374901"
}

-- if the player type a command inside of the table commands
-- return the value of the command
hook.Add("PlayerSay", "commands", function(ply, text)
    for k, v in pairs(commands) do
        if string.lower(text) == k then
            ply:ChatPrint(v)
            return ""
        end
    end
end)