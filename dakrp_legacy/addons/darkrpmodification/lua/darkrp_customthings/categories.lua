--[[-----------------------------------------------------------------------
Categories
---------------------------------------------------------------------------
The categories of the default F4 menu.

Please read this page for more information:
https://darkrp.miraheze.org/wiki/DarkRP:Categories

In case that page can't be reached, here's an example with explanation:

DarkRP.createCategory{
    name = "Citizens", -- The name of the category.
    categorises = "jobs", -- What it categorises. MUST be one of "jobs", "entities", "shipments", "weapons", "vehicles", "ammo".
    startExpanded = true, -- Whether the category is expanded when you open the F4 menu.
    color = Color(0, 107, 0, 255), -- The color of the category header.
    canSee = function(ply) return true end, -- OPTIONAL: whether the player can see this category AND EVERYTHING IN IT.
    sortOrder = 100, -- OPTIONAL: With this you can decide where your category is. Low numbers to put it on top, high numbers to put it on the bottom. It's 100 by default.
}


Add new categories under the next line!
---------------------------------------------------------------------------]]

DarkRP.createCategory{
    name = "Citizens VIPs",
    categorises = "jobs",
    startExpanded = true,
    color = Color(100, 0, 100, 255),
    canSee = function(ply) return ply:IsUserGroup("vip") or ply:IsUserGroup("mod+") or ply:IsUserGroup("modt+") or ply:IsAdmin() end,
}

DarkRP.createCategory{
    name = "Staff y Moderación",
    categorises = "jobs",
    startExpanded = true,
    color = Color(100, 0, 100, 255),
    canSee = function(ply) return true end,
}

---------------------
----    Armas    ----
---------------------

DarkRP.createCategory{
    name = "Pistolas",
    categorises = "shipments",
    startExpanded = false,
    color = Color(100, 0, 100, 255),
    canSee = function(ply) return true end,
}

DarkRP.createCategory{
    name = "Rifles",
    categorises = "shipments",
    startExpanded = false,
    color = Color(100, 0, 100, 255),
    canSee = function(ply) return true end,
}

DarkRP.createCategory{
    name = "Submetralladoras",
    categorises = "shipments",
    startExpanded = false,
    color = Color(100, 0, 100, 255),
    canSee = function(ply) return true end,
}

DarkRP.createCategory{
    name = "Rifle Francotirador",
    categorises = "shipments",
    startExpanded = false,
    color = Color(100, 0, 100, 255),
    canSee = function(ply) return true end,
}

DarkRP.createCategory{
    name = "Escopetas",
    categorises = "shipments",
    startExpanded = false,
    color = Color(100, 0, 100, 255),
    canSee = function(ply) return true end,
}

DarkRP.createCategory{
    name = "Sub-fusil",
    categorises = "shipments",
    startExpanded = false,
    color = Color(100, 0, 100, 255),
    canSee = function(ply) return true end,
}

DarkRP.createCategory{
    name = "Cuchillos",
    categorises = "shipments",
    startExpanded = false,
    color = Color(100, 0, 100, 255),
    canSee = function(ply) return true end,
}

DarkRP.createCategory{
    name = "Armas VIPs",
    categorises = "entities",
    startExpanded = true,
    color = Color(100, 0, 100, 255),
    canSee = function(ply) return true end,
}

DarkRP.createCategory{
    name = "Otros - Criminal",
    categorises = "shipments",
    startExpanded = false,
    color = Color(100, 0, 100, 255),
    canSee = function(ply) return true end,
}

---------------------
----     Jobs    ----
---------------------

DarkRP.createCategory{
    name = "Locutor de Radio",
    categorises = "entities",
    startExpanded = true,
    color = Color(100, 0, 100, 255),
    canSee = function(ply) return true end,
}

DarkRP.createCategory{
    name = "Cocina Meta",
    categorises = "entities",
    startExpanded = true,
    color = Color(100, 0, 100, 255),
    canSee = function(ply) return true end,
}