local nulla_utils = require("lib")



data:extend(
{
	{
		type = "technology",
		name = "planet-discovery-nulla",
		icons = util.technology_icon_constant_planet("__nulla__/graphics/technology/nulla.png"),
		essential = true,
		effects =
		{
			{
				type = "unlock-space-location",
				space_location = "nulla",
				use_icon_overlay_constant = true
			},
			{
				type = "unlock-recipe",
				recipe = "nulla-scrap-recycling"
			},
			{
				type = "unlock-recipe",
				recipe = "heavy-oil-solution-separation"
			},
		},
		prerequisites = {"cryogenic-science-pack", "atomic-bomb"},
		unit =
		{
		  count = 1000,
		  ingredients =
		  {
			{"automation-science-pack", 1},
			{"logistic-science-pack", 1},
			{"chemical-science-pack", 1},
			{"space-science-pack", 1},
			{"cryogenic-science-pack", 1},
		  },
		  time = 60
		}
	},
	{
		type = "technology",
		name = "lubrication-manipulators",
		icon = "__nulla__/graphics/technology/lubrication-manipulators.png",
		icon_size = 256,
		effects =
		{
			{
				type = "unlock-recipe",
				recipe = "nulla-lubricant-fast-inserter"
			},
			{
				type = "unlock-recipe",
				recipe = "nulla-lubricant-long-handed-inserter"
			},
			{
				type = "unlock-recipe",
				recipe = "nulla-lubricant-bulk-inserter"
			},
			{
				type = "unlock-recipe",
				recipe = "nulla-lubricant-stack-inserter"
			},
		},
		prerequisites = {"planet-discovery-nulla"},
		research_trigger =
		{
		  type = "mine-entity",
		  entities =
		  {
			"nulla-medium-remnants"
		  }
		}
	},
	{
		type = "technology",
		name = "electromagnetic-robotics",
		icons = util.technology_icon_constant_followers("__base__/graphics/technology/robotics.png"),
		effects =
		{
			{
				type = "unlock-recipe",
				recipe = "nulla-flying-robot-frame"
			},
		},
		prerequisites = {"planet-discovery-nulla"},
		research_trigger =
		{
		  type = "mine-entity",
		  entities =
		  {
			"nulla-small-remnants"
		  }
		}
	},
	{
		type = "technology",
		name = "robotic-science-pack",
		icon = "__nulla__/graphics/technology/robotic-science-pack.png",
		icon_size = 256,
		essential = true,
		effects =
		{
		  {
			type = "unlock-recipe",
			recipe = "robotic-science-pack"
		  },
		},
		prerequisites = {"electromagnetic-robotics"},
		research_trigger =
		{
		  type = "mine-entity",
		  entities =
		  {
			"nulla-scrap"
		  }
		}
	},
	{
		type = "technology",
		name = "nulla-tesla-defense-equipment",
		icons = util.technology_icon_constant_equipment("__space-age__/graphics/technology/electric-weapons-damage.png"),
		effects =
		{
		  {
			type = "unlock-recipe",
			recipe = "nulla-tesla-defense-equipment",
		  },
		},
		prerequisites = {"robotic-science-pack", "discharge-defense-equipment"},
		unit =
		{
		  count = 600,
		  ingredients =
		  {
			{"automation-science-pack", 1},
			{"logistic-science-pack", 1},
			{"chemical-science-pack", 1},
			{"military-science-pack", 1},
			{"utility-science-pack", 1},
			{"space-science-pack", 1},
			{"electromagnetic-science-pack", 1},
			{"robotic-science-pack", 1},
		  },
		  time = 60
		},
	},
	{
		type = "technology",
		name = "nulla-personal-roboport-equipment",
		icons = util.technology_icon_constant_equipment("__nulla__/graphics/technology/nulla-personal-roboport-equipment.png"),
		effects =
		{
		  {
			type = "unlock-recipe",
			recipe = "nulla-personal-roboport-equipment",
		  },
		},
		prerequisites = {"robotic-science-pack", "personal-roboport-mk2-equipment"},
		unit =
		{
		  count = 400,
		  ingredients =
		  {
			{"automation-science-pack", 1},
			{"logistic-science-pack", 1},
			{"chemical-science-pack", 1},
			{"utility-science-pack", 1},
			{"space-science-pack", 1},
			{"electromagnetic-science-pack", 1},
			{"robotic-science-pack", 1},
		  },
		  time = 60
		},
	},
	{
		type = "technology",
		name = "nulla-transport-belt-capacity",
		localised_description = {"technology-description.belt-capacity"},
		icons = util.technology_icon_constant_stack_size("__space-age__/graphics/technology/transport-belt-capacity.png"),
		effects =
		{
		  {
			type = "belt-stack-size-bonus",
			modifier = 1
		  }
		},
		prerequisites = {"robotic-science-pack"},
		unit =
		{
		  count = 4000,
		  ingredients =
		  {
			{"automation-science-pack", 1},
			{"logistic-science-pack", 1},
			{"chemical-science-pack", 1},
			{"production-science-pack", 1},
			{"utility-science-pack", 1},
			{"space-science-pack", 1},
			{"robotic-science-pack", 1},
		  },
		  time = 60
		},
		upgrade = true
	},
	{
		type = "technology",
		name = "combat-robot-productivity",
		icons = util.technology_icon_constant_productivity("__base__/graphics/technology/follower-robots.png"),
		effects =
		{
		  {
			type = "change-recipe-productivity",
			recipe = "defender-capsule",
			change = 0.1
		  },
		  {
			type = "change-recipe-productivity",
			recipe = "distractor-capsule",
			change = 0.1
		  },
		  {
			type = "change-recipe-productivity",
			recipe = "destroyer-capsule",
			change = 0.1
		  },
		},
		prerequisites = {"robotic-science-pack", "destroyer", "defender"},
		unit =
		{
		  count_formula = "1.5^L*1000",
		  ingredients =
		  {
			{"automation-science-pack", 1},
			{"logistic-science-pack", 1},
			{"chemical-science-pack", 1},
			{"military-science-pack", 1},
			{"production-science-pack", 1},
			{"utility-science-pack", 1},
			{"space-science-pack", 1},
			{"robotic-science-pack", 1},
		  },
		  time = 60
		},
		max_level = "infinite",
		upgrade = true
	},
	{
		type = "technology",
		name = "factory-robot-productivity",
		icons = util.technology_icon_constant_productivity("__base__/graphics/technology/worker-robots-storage.png"),
		effects = { },
		prerequisites = {"robotic-science-pack", "robotics"},
		unit =
		{
		  count_formula = "1.5^L*1000",
		  ingredients =
		  {
			{"automation-science-pack", 1},
			{"logistic-science-pack", 1},
			{"chemical-science-pack", 1},
			{"production-science-pack", 1},
			{"utility-science-pack", 1},
			{"space-science-pack", 1},
			{"robotic-science-pack", 1},
		  },
		  time = 60
		},
		max_level = "infinite",
		upgrade = true
	},
	{
		type = "technology",
		name = "combinator-productivity",
		icons = util.technology_icon_constant_productivity("__base__/graphics/technology/circuit-network.png"),
		effects = { },
		prerequisites = {"robotic-science-pack"},
		unit =
		{
		  count_formula = "1.5^L*1000",
		  ingredients =
		  {
			{"automation-science-pack", 1},
			{"logistic-science-pack", 1},
			{"chemical-science-pack", 1},
			{"production-science-pack", 1},
			{"utility-science-pack", 1},
			{"space-science-pack", 1},
			{"robotic-science-pack", 1},
		  },
		  time = 60
		},
		max_level = "infinite",
		upgrade = true
	},
	{
		type = "technology",
		name = "kovarex-enrichment-process-productivity",
		icons = util.technology_icon_constant_productivity("__base__/graphics/technology/kovarex-enrichment-process.png"),
		effects =
		{
			{
				type = "change-recipe-productivity",
				recipe = "kovarex-enrichment-process",
				change = 0.1
			},
		},
		prerequisites = {"robotic-science-pack"},
		unit =
		{
		  count_formula = "2^L*1000",
		  ingredients =
		  {
			{"automation-science-pack", 1},
			{"logistic-science-pack", 1},
			{"chemical-science-pack", 1},
			{"production-science-pack", 1},
			{"utility-science-pack", 1},
			{"space-science-pack", 1},
			{"robotic-science-pack", 1},
		  },
		  time = 60
		},
		max_level = "infinite",
		upgrade = true
	},
	{
		type = "technology",
		name = "nulla-follower-robot-lifetime",
		icons = util.technology_icon_constant_speed("__base__/graphics/technology/follower-robots.png"),
		effects =
		{
		  {type = "follower-robot-lifetime", modifier = 0.1}
		},
		prerequisites = {"robotic-science-pack", "destroyer", "defender"},
		unit =
		{
		  count_formula = "2^L*1000",
		  ingredients =
		  {
			{"automation-science-pack", 1},
			{"logistic-science-pack", 1},
			{"chemical-science-pack", 1},
			{"military-science-pack", 1},
			{"production-science-pack", 1},
			{"utility-science-pack", 1},
			{"space-science-pack", 1},
			{"robotic-science-pack", 1},
		  },
		  time = 60
		},
		max_level = 10,
		upgrade = true
	},
})



nulla_utils.add_tech_effect("scrap-recycling-productivity",
	{ type = "change-recipe-productivity", recipe = "nulla-scrap-recycling", change = 0.1 })
	
	
if settings.startup["nulla-vanila-science"].value then
	nulla_utils.add_tech_prerequisites("follower-robot-count-5", "robotic-science-pack")
	nulla_utils.add_science_pack("follower-robot-count-5", { "robotic-science-pack", 1 })
end

if settings.startup["nulla-science-promethium"].value then
	nulla_utils.add_tech_prerequisites("promethium-science-pack", "robotic-science-pack")
	nulla_utils.add_science_pack("promethium-science-pack", { "robotic-science-pack", 1 })
end

if settings.startup["nulla-science-research-productivity"].value then
	nulla_utils.add_science_pack("research-productivity", { "robotic-science-pack", 1 })
end