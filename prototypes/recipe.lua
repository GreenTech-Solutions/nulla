local nulla_utils = require("lib")



local flying_robot_frame = table.deepcopy(data.raw.recipe["flying-robot-frame"])
flying_robot_frame.name = "nulla-flying-robot-frame"
flying_robot_frame.categories = { "electromagnetics" }
flying_robot_frame.auto_recycle = false
flying_robot_frame.icon = "__nulla__/graphics/icons/nulla-flying-robot-frame.png"


data:extend
({
	flying_robot_frame,
	{
		type = "recipe",
		name = "nulla-scrap-recycling",
		icons = {
		  {
			icon = "__recycler__/graphics/icons/recycling.png"
		  },
		  {
			icon = "__nulla__/graphics/entity/nulla-scrap/scrap.png",
			scale = 0.4
		  },
		  {
			icon = "__recycler__/graphics/icons/recycling-top.png"
		  }
		},
		categories =
		{
			"recycling",
			"hand-crafting",
		},
		subgroup = "nulla-processes",
		order = "[nulla-scrap-recycling]",
		enabled = false,
		auto_recycle = false,
		energy_required = 0.2,
		ingredients = {{type = "item", name = "nulla-scrap", amount = 1}},
		results =
		{
			{type = "item", name = "iron-stick",               amount = 1, shared_probability = { min = 0.00, max = 0.23 }, show_details_in_recipe_tooltip = false},
			{type = "item", name = "copper-cable",             amount = 1, shared_probability = { min = 0.23, max = 0.40 }, show_details_in_recipe_tooltip = false},
			{type = "item", name = "firearm-magazine",         amount = 1, shared_probability = { min = 0.40, max = 0.52 }, show_details_in_recipe_tooltip = false},
			{type = "item", name = "grenade",                  amount = 1, shared_probability = { min = 0.52, max = 0.62 }, show_details_in_recipe_tooltip = false},
			{type = "item", name = "piercing-rounds-magazine", amount = 1, shared_probability = { min = 0.62, max = 0.70 }, show_details_in_recipe_tooltip = false},
			{type = "item", name = "rocket",                   amount = 1, shared_probability = { min = 0.70, max = 0.77 }, show_details_in_recipe_tooltip = false},
			{type = "item", name = "concrete",                 amount = 1, shared_probability = { min = 0.77, max = 0.83 }, show_details_in_recipe_tooltip = false},
			{type = "item", name = "stone",                    amount = 1, shared_probability = { min = 0.83, max = 0.88 }, show_details_in_recipe_tooltip = false},
			{type = "item", name = "flying-robot-frame",       amount = 1, shared_probability = { min = 0.88, max = 0.93 }, show_details_in_recipe_tooltip = false},
			{type = "item", name = "defender-capsule",         amount = 1, shared_probability = { min = 0.93, max = 0.96 }, show_details_in_recipe_tooltip = false},
			{type = "item", name = "submachine-gun",           amount = 1, shared_probability = { min = 0.96, max = 0.99 }, show_details_in_recipe_tooltip = false},
			{type = "item", name = "rocket-launcher",          amount = 1, shared_probability = { min = 0.99, max = 1.00 }, show_details_in_recipe_tooltip = false},
		}
	},
	{
		type = "recipe",
		name = "heavy-oil-solution-separation",
		icon = "__nulla__/graphics/icons/heavy-oil-solution-separation.png",
		categories =
		{
			"chemistry",
			"cryogenics",
		},
		subgroup = "nulla-processes",
		order = "[heavy-oil-solution-separation]",
		enabled = false,
		allow_productivity = true,
		auto_recycle = false,
		energy_required = 1,
		ingredients =
		{
			{type = "fluid", name = "heavy-oil-solution", amount = 50},
		},
		results =
		{
			{type = "item", name = "ice", amount = 5},
			{type = "fluid", name = "heavy-oil", amount = 50},
		},
	},
	{
		type = "recipe",
		name = "nulla-lubricant-fast-inserter",
		categories =
		{
			"crafting-with-fluid",
		},
		enabled = false,
		ingredients =
		{
			{type = "item", name = "fast-inserter", amount = 1},
			{type = "item", name = "pipe", amount = 4},
			{type = "fluid", name = "lubricant", amount = 20}
		},
		results =
		{
			{type="item", name="nulla-lubricant-fast-inserter", amount=1},
		}
	},
	{
		type = "recipe",
		name = "nulla-lubricant-long-handed-inserter",
		categories =
		{
			"crafting-with-fluid",
		},
		enabled = false,
		ingredients =
		{
			{type = "item", name = "long-handed-inserter", amount = 1},
			{type = "item", name = "pipe", amount = 4},
			{type = "fluid", name = "lubricant", amount = 20}
		},
		results =
		{
			{type="item", name="nulla-lubricant-long-handed-inserter", amount=1},
		}
	},
	{
		type = "recipe",
		name = "nulla-lubricant-bulk-inserter",
		categories =
		{
			"crafting-with-fluid",
		},
		enabled = false,
		ingredients =
		{
			{type = "item", name = "bulk-inserter", amount = 1},
			{type = "item", name = "pipe", amount = 4},
			{type = "fluid", name = "lubricant", amount = 20}
		},
		results =
		{
			{type="item", name="nulla-lubricant-bulk-inserter", amount=1},
		}
	},
	{
		type = "recipe",
		name = "nulla-lubricant-stack-inserter",
		categories =
		{
			"crafting-with-fluid",
		},
		enabled = false,
		ingredients =
		{
			{type = "item", name = "stack-inserter", amount = 1},
			{type = "item", name = "pipe", amount = 4},
			{type = "fluid", name = "lubricant", amount = 20}
		},
		results =
		{
			{type="item", name="nulla-lubricant-stack-inserter", amount=1},
		}
	},
	{
		type = "recipe",
		name = "robotic-science-pack",
		icon = "__nulla__/graphics/icons/robotic-science-pack.png",
		categories =
		{
			"electromagnetics",
		},
		subgroup = "science-pack",
		enabled = false,
		auto_recycle = false,
		allow_productivity = true,
		energy_required = 10,
		ingredients =
		{
			{type = "item", name = "atomic-bomb", amount = 1},
			{type = "item", name = "destroyer-capsule", amount = 1},
			{type = "fluid", name = "lubricant", amount = 200},
		},
		results =
		{
			{type = "item", name = "robotic-science-pack", amount = 10},
		},
		surface_conditions = nulla_utils.surface_conditions("nulla"),
	},
	{
		type = "recipe",
		name = "nulla-tesla-defense-equipment",
		categories =
		{
			"electromagnetics",
		},
		enabled = false,
		energy_required = 10,
		ingredients =
		{
			{type = "item", name = "processing-unit", amount = 20},
			{type = "item", name = "low-density-structure", amount = 5},
			{type = "item", name = "tesla-turret", amount = 5}
		},
		results =
		{
			{type="item", name="nulla-tesla-defense-equipment", amount=1},
		}
	},
	{
		type = "recipe",
		name = "nulla-personal-roboport-equipment",
		categories =
		{
			"electromagnetics",
		},
		enabled = false,
		energy_required = 30,
		ingredients =
		{
			{type = "item", name = "personal-roboport-mk2-equipment", amount = 5},
			{type = "item", name = "quantum-processor", amount = 50},
			{type = "item", name = "supercapacitor", amount = 20}
		},
		results =
		{
			{type="item", name="nulla-personal-roboport-equipment", amount=1},
		}
	},
})