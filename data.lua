local rare_metals_item = "raw-rare-metals"
if data.raw.item["kr-rare-metal-ore"] then
    rare_metals_item = "kr-rare-metal-ore"
elseif data.raw.item["raw-rare-metals"] then
    rare_metals_item = "raw-rare-metals"
end

data:extend({
    {
        type = "item",
        name = "rare-metal-bacteria",
        icon = "__rare-metal-bacteria__/graphics/rare-metal-bacteria-icon.png",
        pictures = {
            {
                size = 64,
                filename = "__rare-metal-bacteria__/graphics/rare-metal-bacteria-icon.png",
                scale = 0.5
            },
            {
                size = 64,
                filename = "__rare-metal-bacteria__/graphics/rare-metal-bacteria-icon1.png",
                scale = 0.5
            },
            {
                size = 64,
                filename = "__rare-metal-bacteria__/graphics/rare-metal-bacteria-icon2.png",
                scale = 0.5
            }
        },
        subgroup = "agriculture-processes",
        order = "b[agriculture]-d[bacteria]-e[rare-metal-bacteria]",
        stack_size = 50,
        spoil_ticks = 45 * 60,
        spoil_result = rare_metals_item
    },
    {
        type = "recipe",
        name = "rare-metal-bacteria-cultivation",
        icons = {
            {
                icon = "__rare-metal-bacteria__/graphics/rare-metal-bacteria-cultivation-icon.png",
                icon_size = 64,
                scale = 0.5
            }
        },
        categories = {"organic"},
        surface_conditions = data.raw.recipe["iron-bacteria-cultivation"].surface_conditions,
        subgroup = "agriculture-processes",
        order = "b[agriculture]-d[bacteria]-f[rare-metal-bacteria-cultivation]",
        energy_required = 4,
        enabled = false,
        allow_productivity = true,
        auto_recycle = false,
        ingredients = {
            {type = "item", name = "bioflux", amount = 2},
            {type = "item", name = "rare-metal-bacteria", amount = 1}
        },
        results = {
            {type = "item", name = "rare-metal-bacteria", amount = 2, reset_freshness_on_craft = true}
        }
    },
    {
        type = "recipe",
        name = "rare-metal-bacteria",
        icons = {
            {
                icon = "__rare-metal-bacteria__/graphics/rare-metal-bacteria-icon.png",
                icon_size = 64
            }
        },
        categories = {"organic", "crafting"},
        surface_conditions = data.raw.recipe["iron-bacteria-cultivation"].surface_conditions,
        subgroup = "agriculture-processes",
        order = "b[agriculture]-d[bacteria]-e[rare-metal-bacteria]",
        energy_required = 1,
        enabled = true,
        allow_productivity = false,
        ingredients = {
            {type = "item", name = "iron-bacteria", amount = 3},
            {type = "item", name = "copper-bacteria", amount = 3},
            {type = "item", name = "bioflux", amount = 2}
        },
        results = {
            {type = "item", name = "rare-metal-bacteria", amount = 1, independent_probability = 0.1},
            {type = "item", name = "spoilage", amount = 6}
        }
    }
})

table.insert(data.raw.technology["bacteria-cultivation"].effects, {
    type = "unlock-recipe",
    recipe = "rare-metal-bacteria-cultivation"
})