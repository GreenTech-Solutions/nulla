require ("__base__.prototypes.entity.enemy-constants")
local enemy_autoplace = require ("__base__.prototypes.entity.enemy-autoplace-utils")
local sounds = require ("__base__.prototypes.entity.sounds")
local hit_effects = require ("__base__.prototypes.entity.hit-effects")



data:extend(
{
	{
		type = "unit-spawner",
		name = "nulla-protectors-spawner",
		icon = "__nulla__/graphics/entity/protectors-spawner/protectors-spawner-icon.png",
		icon_size = 256,
		flags = {"placeable-player", "placeable-enemy", "not-repairable", "placeable-off-grid"},
		max_health = 850,
		order = "[nulla]-[spawner]-[nulla-protectors-spawner]",
		subgroup = "enemies",
		resistances =
		{
		  {
			type = "impact",
			percent = 60
		  },
		  {
			type = "fire",
			percent = 90
		  }
		},
		impact_category = "metal",
		working_sound =
		{
		  sound = {filename = "__base__/sound/assembling-machine-t1-1.ogg", volume = 0.5, audible_distance_modifier = 0.5},
		  fade_in_ticks = 4,
		  fade_out_ticks = 20
		},
		healing_per_tick = 0.01,
		collision_box = {{-2.2, -2.2}, {2.2, 2.2}},
		selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
		map_generator_bounding_box = {{-3.2, -3.2}, {3.2, 3.2}},
		corpse = "nulla-protectors-spawner-remnants",
		dying_explosion = "foundry-explosion",
		absorptions_per_second = { radio_interference = { absolute = 20, proportional = 0.01 } },
		max_count_of_owned_units = 3,
		max_friends_around_to_spawn = 1,
		graphics_set =
		{
			animations =
			{
				layers =
				{
					{
						filenames =
						{
							"__nulla__/graphics/entity/protectors-spawner/protectors-spawner-main-1.png",
							"__nulla__/graphics/entity/protectors-spawner/protectors-spawner-main-2.png"
						},
						width = 360,
						height = 350,
						shift = util.by_pixel( 0.0, 0.0 ),
						line_length = 8,
						lines_per_file = 8,
						animation_speed = 0.2,
						frame_count = 80,
						scale = 0.5,
					},
					{
						filename = "__nulla__/graphics/entity/protectors-spawner/protectors-spawner-shadow.png",
						width = 600,
						height = 500,
						shift = util.by_pixel( 0.0, 0.0 ),
						scale = 0.5,
						repeat_count = 80,
						draw_as_shadow = true,
					},
					{
						filenames =
						{
							"__nulla__/graphics/entity/protectors-spawner/protectors-spawner-working-1.png",
							"__nulla__/graphics/entity/protectors-spawner/protectors-spawner-working-2.png"
						},
						width = 360,
						height = 350,
						line_length = 8,
						lines_per_file = 8,
						animation_speed = 0.2,
						frame_count = 80,
						priority = "extra-high",
						blend_mode = "additive",
						draw_as_glow = true,
						scale = 0.5,
					},
				}
			},
		},
		result_units =
		{
			{"flamethrowerbot-unit", {
    {0.0, 1.0},
    {0.5, 0.3},
    {1.0, 0.0}
}},

{"teslabot-unit", {
    {0.0, 0.15},
    {0.5, 0.45},
    {1.0, 0.9}
}},

{"minebot-unit", {
    {0.2, 0.0},
    {0.6, 0.8},
    {1.0, 0.35}
}},

{"roboportbot-unit", {
    {0.6, 0.0},
    {0.85, 0.7},
    {1.0, 1.2}
}},
		},
		spawning_cooldown = {360, 150},
		spawning_radius = 10,
		spawning_spacing = 3,
		max_spawn_shift = 0,
		max_richness_for_spawn_shift = 100,
		autoplace =
		{
			control = "nulla_enemy_base",
			order = "b[enemy]-a[spawner]",
			force = "enemy",
			probability_expression = "enemy_autoplace_base(0, 1)",
			richness_expression = 1,
		},
		call_for_help_radius = 50,
		spawn_decorations_on_expansion = true,
		loot =
		{
			{type = "item", name = "flying-robot-frame", independent_probability = 1, amount_min = 3, amount_max = 8},
			{type = "item", name = "uranium-235", independent_probability = 1, amount_min = 1, amount_max = 3},
			{type = "item", name = "iron-gear-wheel", independent_probability = 1, amount_min = 10, amount_max = 15},
			{type = "item", name = "processing-unit", independent_probability = 1, amount_min = 5, amount_max = 10},
		},
		spawn_decoration =
		{
			{
				type = "create-decorative",
				decorative = "nulla-ruin-decoration-4x4",
				spawn_min = 1,
				spawn_max = 2,
				spawn_min_radius = 3,
				spawn_max_radius = 3
			},
			{
				type = "create-decorative",
				decorative = "nulla-ruin-decoration-2x2",
				spawn_min = 3,
				spawn_max = 6,
				spawn_min_radius = 3,
				spawn_max_radius = 3
			},
			{
				type = "create-decorative",
				decorative = "nulla-ruin-decoration-1x1",
				spawn_min = 4,
				spawn_max = 8,
				spawn_min_radius = 3,
				spawn_max_radius = 4
			},
			{
				type = "create-decorative",
				decorative = "nulla-ruin-decoration-tiny",
				spawn_min = 4,
				spawn_max = 8,
				spawn_min_radius = 3,
				spawn_max_radius = 4
			},
		}
	},
	{
		type = "corpse",
		name = "nulla-protectors-spawner-remnants",
		icon = "__space-age__/graphics/icons/foundry.png",
		flags = {"placeable-neutral", "not-on-map"},
		hidden_in_factoriopedia = true,
		subgroup = "smelting-machine-remnants",
		order = "d[foundry]",
		selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
		tile_width = 5,
		tile_height = 5,
		selectable_in_game = false,
		time_before_removed = 60 * 60 * 15, -- 15 minutes
		expires = false,
		final_render_layer = "remnants",
		remove_on_tile_placement = false,
		animation =
		{
		  filename = "__space-age__/graphics/entity/foundry/foundry-remnants.png",
		  line_length = 1,
		  width = 494,
		  height = 478,
		  frame_count = 1,
		  direction_count = 1,
		  shift = util.by_pixel( -1.5, -5.5),
		  scale = 0.5
		}
	},
})
