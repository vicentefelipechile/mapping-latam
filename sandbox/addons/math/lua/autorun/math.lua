-- This code has been written by github copilot

if not SERVER then return end

-- CVARS
-- Min and max values for math.random
local add_min = CreateConVar("math_add_min", 10, FCVAR_NONE, "Min amount to add", 1, 500)
local add_max = CreateConVar("math_add_max", 100, FCVAR_NONE, "Max amount to add", 1, 500)
local sub_min = CreateConVar("math_sub_min", 10, FCVAR_NONE, "Min amount to subtract", 1, 500)
local sub_max = CreateConVar("math_sub_max", 100, FCVAR_NONE, "Max amount to subtract", 1, 500)
local mult_min = CreateConVar("math_mult_min", 2, FCVAR_NONE, "Min amount to multiply", 1, 500)
local mult_max = CreateConVar("math_mult_max", 20, FCVAR_NONE, "Max amount to multiply", 1, 500)
local div_min = CreateConVar("math_div_min", 1, FCVAR_NONE, "Min amount to divide", 1, 500)
local div_max = CreateConVar("math_div_max", 15, FCVAR_NONE, "Max amount to divide", 1, 500)

-- Statements
local ask_timer = CreateConVar("math_ask_timer", 60, FCVAR_NONE, "The time between questions in seconds", 15, 600)
local sub_minus = CreateConVar("math_sub_minus", 1, FCVAR_NONE, "The result of the subtraction will be negative", 0, 1)

local TIMER = 60
local PREFIX = "[Math] "


if !sql.TableExists("math_points") then
    sql.Query([[CREATE TABLE IF NOT EXISTS math_points ( id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
        name VARCHAR(255) NOT NULL,
        steamid64 VARCHAR(255) NOT NULL,
        points INTEGER NOT NULL )]])
end

function mathOnJoin(ply)
    local id64 = ply:SteamID64()
    local row = sql.QueryRow("SELECT * FROM math_points WHERE steamid64 = " .. sql.SQLStr(id64) .. ";")

    if row then
        -- player exists
        -- do nothing
    else
        sql.Query("INSERT into math_points ( name, steamid64, points ) VALUES ( " .. sql.SQLStr(ply:Name()) .. ", " .. sql.SQLStr(id64) .. ", 0 );")
    end
end
hook.Add( "PlayerInitialSpawn", "Hook-MathOnJoin", mathOnJoin )

-- on player connected update their name
function mathUpdateName(ply)
    local id64 = ply:SteamID64()
    local row = sql.QueryRow("SELECT * FROM math_points WHERE steamid64 = " .. sql.SQLStr(id64) .. ";")

    if row then
        -- player exists
        sql.Query("UPDATE math_points SET name = " .. sql.SQLStr(ply:Name()) .. " WHERE steamid64 = " .. sql.SQLStr(id64) .. ";")
    end
end

function mathAddPoints(ply, amount)
    local id64 = ply:SteamID64()
    sql.Query("UPDATE math_points SET points = points + " .. sql.SQLStr(amount) .. " WHERE steamid64 = " .. sql.SQLStr(id64) .. ";")
end

function mathGetEquation()
    formula = { "add", "sub", "mult", "div" }
    simbol = { "+", "-", "x", "÷" }
    local type_index = math.random(1, #formula)

    -- get a random formula of and the formula of the simbol
    -- like mult = *
    -- i can't do my best
    if type_index == 1 then
        simbol = "+"
    elseif type_index == 2 then
        simbol = "-"
    elseif type_index == 3 then
        simbol = "*"
    elseif type_index == 4 then
        simbol = "/"
    end

    -- return the formula and the simbol
    return formula[type_index], simbol
end


function mathAskQuestion()
    local formula, simbol = mathGetEquation()

    if formula == "add" then
        a = math.random(add_min:GetInt(), add_max:GetInt())
        b = math.random(add_min:GetInt(), add_max:GetInt())

        result = a + b
    elseif formula == "sub" then
        if sub_minus:GetInt() == 1 then
            a = math.random(sub_min:GetInt(), sub_max:GetInt())
            b = math.random(sub_min:GetInt(), sub_max:GetInt())
            result = a - b
        else
            sub1 = math.random(sub_min:GetInt(), sub_max:GetInt())
            sub2 = math.random(sub_min:GetInt(), sub_max:GetInt())
            if sub1 > sub2 then
                a = sub1
                b = sub2
                result = a - b
            else
                a = sub2
                b = sub1
                result = a - b
            end
        end
    elseif formula == "mult" then
        a = math.random(mult_min:GetInt(), mult_max:GetInt())
        b = math.random(mult_min:GetInt(), mult_max:GetInt())

        result = a * b
    elseif formula == "div" then
        b = math.random(div_min:GetInt(), div_max:GetInt())
        a = b * math.random(div_min:GetInt(), div_max:GetInt())

        result = a / b
    end

    return formula, simbol, a, b, result
end

-- i can't do my best
timer.Create("math_ask_timer", 1, 0, function()
    TIMER = TIMER - 1
end)


hook.Add("Think", "Hook-MathAsk", function()
    if TIMER == 0 then
        timer.Stop("math_ask_timer")
        TIMER = 60
        -- get the equation
        local formula, simbol, a, b, result = mathAskQuestion()
        local players = player.GetAll()

        for k, v in ipairs(players) do
            v:ChatPrint(PREFIX .. "Question: " .. a .. " " .. simbol .. " " .. b .. " = ?")
        end

        print("[Math] Question: " .. a .. " " .. simbol .. " " .. b .. " = " .. result)


        timer.Create("math_ask_again", 60, 0, function()
            for k, v in ipairs(players) do
                v:ChatPrint(PREFIX .. "Question: " .. a .. " " .. simbol .. " " .. b .. " = ?")
            end
        end)

        hook.Add("PlayerSay", "Hook-MathAnswer", function(ply, text)

            -- check if the player is in the game
            if ply:IsPlayer() then
                if text == tostring(result) then
                    mathAddPoints(ply, 1)

                    -- send a message to the player
                    ply:ChatPrint(PREFIX .. "Correct!")

                    -- send a message to the other players
                    for k, v in ipairs(players) do
                        if v != ply then
                            v:ChatPrint(PREFIX .. ply:Name() .. " Answered First!")
                        end
                    end

                    timer.Start("math_ask_timer")
                    timer.Stop("math_ask_again")

                    -- remove the hook
                    hook.Remove("PlayerSay", "Hook-MathAnswer")
                end
            end
        end)
    end
end)