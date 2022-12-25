zpiz = zpiz or {}
zpiz.config = zpiz.config or {}

zpiz.config.Pizza = {}
local function AddPizza(data) return table.insert(zpiz.config.Pizza,data) end

AddPizza({
    // The name of the Pizza
    name = "Margarita",

    // The Ingredients needed.
    recipe = {
        [ZPIZ_ING_TOMATO] = 1,
        [ZPIZ_ING_CHEESE] = 1
    },

     // The Time in seconds the Pizza needs do be Baked
    time = 10,

    // The desciption of the Pizza
    desc = "Una pizza basica!",

    // The price of the Pizza (The ingredient cost gets later added to this value)
    price = 150,

    // How should the Pizza look when its done
    icon = Material("materials/zerochain/zpizmak/ui/pizzas/pizza_magarita.png", "smooth"),

    // How high is the Chance that this Pizza gets choosen by a Customer (1-100)
    chance = 50,

    // How much Health gets the Player if he eats the Pizza
    health = 0,

    // Here you can define the custom health_cap
    health_cap = 100
})

AddPizza({
    name = "Pizza de Espinaca",
    recipe = {
        [ZPIZ_ING_TOMATO] = 1,
        [ZPIZ_ING_CHEESE] = 1,
        [ZPIZ_ING_SPINAT] = 2,
    },
    time = 15,
    desc = "A Popeye le gusta.",
    price = 200,
    icon = Material("materials/zerochain/zpizmak/ui/pizzas/pizza_spinat.png", "smooth"),
    chance = 25,
    health = 0,
    health_cap = 100
})

AddPizza({
    name = "Pizza de Chorizo",
    recipe = {
        [ZPIZ_ING_TOMATO] = 1,
        [ZPIZ_ING_CHEESE] = 1,
        [ZPIZ_ING_SALAMI] = 2,
    },
    time = 15,
    desc = "Pizza llena de longaniza o chorizo.",
    price = 250,
    icon = Material("materials/zerochain/zpizmak/ui/pizzas/pizza_salami.png", "smooth"),
    chance = 10,
    health = 0,
    health_cap = 100
})

AddPizza({
    name = "Pizza de Aceitunas",
    recipe = {
        [ZPIZ_ING_TOMATO] = 1,
        [ZPIZ_ING_CHEESE] = 1,
        [ZPIZ_ING_OLIVES] = 3,
    },
    time = 20,
    desc = "Una pizza que comeria franchesco.",
    price = 250,
    icon = Material("materials/zerochain/zpizmak/ui/pizzas/pizza_olivia.png", "smooth"),
    chance = 10,
    health = 0,
    health_cap = 100
})

AddPizza({
    name = "Pizza Familiar",
    recipe = {
        [ZPIZ_ING_TOMATO] = 1,
        [ZPIZ_ING_CHEESE] = 1,
        [ZPIZ_ING_SALAMI] = 1,
        [ZPIZ_ING_OLIVES] = 1,
        [ZPIZ_ING_EGGPLANT] = 1,
        [ZPIZ_ING_SPINAT] = 1,
        [ZPIZ_ING_PICKLE] = 1,
    },
    time = 120,
    desc = "Nikado Avocado se lo comeria.",
    price = 1000,
    icon = Material("materials/zerochain/zpizmak/ui/pizzas/pizza_grande.png", "smooth"),
    chance = 5,
    health = 0,
    health_cap = 200
})

AddPizza({
    name = "Pizza de Tocino",
    recipe = {
        [ZPIZ_ING_TOMATO] = 1,
        [ZPIZ_ING_CHEESE] = 1,
        [ZPIZ_ING_BACON] = 2,
    },
    time = 25,
    desc = "Tocino!",
    price = 250,
    icon = Material("materials/zerochain/zpizmak/ui/pizzas/pizza_bacon.png", "smooth"),
    chance = 10,
    health = 0,
    health_cap = 100
})

AddPizza({
    name = "Pizza de Huevos",
    recipe = {
        [ZPIZ_ING_TOMATO] = 1,
        [ZPIZ_ING_CHEESE] = 1,
        [ZPIZ_ING_EGG] = 1,
        [ZPIZ_ING_CHILLI] = 1,
        [ZPIZ_ING_BACON] = 1,
    },
    time = 25,
    desc = "El .",
    price = 250,
    icon = Material("materials/zerochain/zpizmak/ui/pizzas/pizza_egg.png", "smooth"),
    chance = 10,
    health = 0,
    health_cap = 100
})

AddPizza({
    name = "Pizza de Champiñon",
    recipe = {
        [ZPIZ_ING_TOMATO] = 1,
        [ZPIZ_ING_CHEESE] = 1,
        [ZPIZ_ING_SPINAT] = 1,
        [ZPIZ_ING_CHILLI] = 1,
        [ZPIZ_ING_MUSHROOM] = 1,
    },
    time = 25,
    desc = "Esto no te hara mas grande.",
    price = 250,
    icon = Material("materials/zerochain/zpizmak/ui/pizzas/pizza_mushroom.png", "smooth"),
    chance = 10,
    health = 0,
    health_cap = 100
})

AddPizza({
    name = "Pizza Hawaiana",
    recipe = {
        [ZPIZ_ING_TOMATO] = 1,
        [ZPIZ_ING_CHEESE] = 2,
        [ZPIZ_ING_PINEAPPLE] = 1,
    },
    time = 30,
    desc = "Sabor tropical.",
    price = 250,
    icon = Material("materials/zerochain/zpizmak/ui/pizzas/pizza_hawai.png", "smooth"),
    chance = 10,
    health = 0,
    health_cap = 100
})

AddPizza({
    name = "Pizza de Queso",
    recipe = {
        [ZPIZ_ING_TOMATO] = 1,
        [ZPIZ_ING_CHEESE] = 3,
    },
    time = 30,
    desc = "Wallace se lo comeria.",
    price = 200,
    icon = Material("materials/zerochain/zpizmak/ui/pizzas/pizza_cheese.png", "smooth"),
    chance = 10,
    health = 0,
    health_cap = 100
})
