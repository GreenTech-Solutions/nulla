local util = require('util')
local sounds = require("__base__.prototypes.entity.sounds")
local base_sounds = require ("__base__.prototypes.entity.sounds")
local decorative_trigger_effects = require("__base__.prototypes.decorative.decorative-trigger-effects")
local hit_effects = require ("__base__.prototypes.entity.hit-effects")
local base_tile_sounds = require("__base__/prototypes/tile/tile-sounds")
local decal_tile_layer = 255
local base_decorative_sprite_priority = "extra-high"



local nulla_dune_decal = table.deepcopy(data.raw["optimized-decorative"]["vulcanus-dune-decal"])
nulla_dune_decal.name = "nulla-dune-decal"
nulla_dune_decal.order = "[nulla]-[nulla-dune-decal]"
nulla_dune_decal.autoplace =
{
	probability_expression = "nulla_dune_decal",
	tile_restriction = {"nulla-biome2", "nulla-biome3", "nulla-biome4", "nulla-biome5", "nulla-biome6"},
}


local nulla_chimney_truncated = table.deepcopy(data.raw["simple-entity"]["vulcanus-chimney-truncated"])
nulla_chimney_truncated.name = "nulla-chimney-truncated"
nulla_chimney_truncated.order = "[nulla]-[nulla-chimney-truncated]"
nulla_chimney_truncated.autoplace =
{
	probability_expression = "nulla_chimney_truncated",
	tile_restriction = {"nulla-biome2", "nulla-biome3", "nulla-biome4", "nulla-biome5", "nulla-biome6"},
}


local nulla_chimney_short = table.deepcopy(data.raw["simple-entity"]["vulcanus-chimney-short"])
nulla_chimney_short.name = "nulla-chimney-short"
nulla_chimney_short.order = "[nulla]-[nulla-chimney-short]"
nulla_chimney_short.autoplace =
{
	probability_expression = "nulla_chimney_short",
	tile_restriction = {"nulla-biome2", "nulla-biome3", "nulla-biome4", "nulla-biome5", "nulla-biome6"},
}


local nulla_huge_rock = table.deepcopy(data.raw["simple-entity"]["huge-volcanic-rock"])
nulla_huge_rock.name = "nulla-huge-rock"
nulla_huge_rock.order = "[nulla]-[nulla-huge-rock]"
nulla_huge_rock.autoplace =
{
	probability_expression = "nulla_huge_rock",
	tile_restriction = {"nulla-biome3", "nulla-biome4", "nulla-biome5", "nulla-biome6"},
}
nulla_huge_rock.minable =
{
    mining_particle = "stone-particle",
    mining_time = 3,
    results =
    {
        {type = "item", name = "stone", amount_min = 42, amount_max = 68},
    },
}
nulla_huge_rock.created_effect =
{
	type = "direct",
	action_delivery =
	{
		type = "instant",
		source_effects =
		{
			{
				type = "create-decorative",
				decorative = "nulla-medium-rock",
				spawn_min = 1,
				spawn_max = 3,
				spawn_min_radius = 1,
				spawn_max_radius = 3
			},
			{
				type = "create-decorative",
				decorative = "nulla-small-rock",
				spawn_min = 2,
				spawn_max = 4,
				spawn_min_radius = 1,
				spawn_max_radius = 3
			},
			{
				type = "create-decorative",
				decorative = "nulla-tiny-rock",
				spawn_min = 2,
				spawn_max = 6,
				spawn_min_radius = 1,
				spawn_max_radius = 3
			},
		}
	}
}


local nulla_big_rock = table.deepcopy(data.raw["simple-entity"]["big-volcanic-rock"])
nulla_big_rock.name = "nulla-big-rock"
nulla_big_rock.order = "[nulla]-[nulla-big-rock]"
nulla_big_rock.autoplace =
{
	probability_expression = "nulla_big_rock",
	tile_restriction = {"nulla-biome3", "nulla-biome4", "nulla-biome5", "nulla-biome6"},
}
nulla_big_rock.minable =
{
    mining_particle = "stone-particle",
    mining_time = 2,
    results =
    {
        {type = "item", name = "stone", amount_min = 18, amount_max = 30},
    },
}
nulla_big_rock.created_effect =
{
	type = "direct",
	action_delivery =
	{
		type = "instant",
		source_effects =
		{
			{
				type = "create-decorative",
				decorative = "nulla-medium-rock",
				spawn_min = 1,
				spawn_max = 3,
				spawn_min_radius = 1,
				spawn_max_radius = 3
			},
			{
				type = "create-decorative",
				decorative = "nulla-small-rock",
				spawn_min = 2,
				spawn_max = 4,
				spawn_min_radius = 1,
				spawn_max_radius = 3
			},
			{
				type = "create-decorative",
				decorative = "nulla-tiny-rock",
				spawn_min = 2,
				spawn_max = 6,
				spawn_min_radius = 1,
				spawn_max_radius = 3
			},
			{
				type = "create-decorative",
				decorative = "nulla-tiny-rock-cluster",
				spawn_min = 4,
				spawn_max = 6,
				spawn_min_radius = 1,
				spawn_max_radius = 3
			},
		}
	}
}
		
		

local nulla_medium_rock = table.deepcopy(data.raw["optimized-decorative"]["medium-volcanic-rock"])
nulla_medium_rock.name = "nulla-medium-rock"
nulla_medium_rock.order = "[nulla]-[nulla-medium-rock]"
nulla_medium_rock.autoplace = nil


local nulla_small_rock = table.deepcopy(data.raw["optimized-decorative"]["small-volcanic-rock"])
nulla_small_rock.name = "nulla-small-rock"
nulla_small_rock.order = "[nulla]-[nulla-small-rock]"
nulla_small_rock.autoplace = nil


local nulla_tiny_rock = table.deepcopy(data.raw["optimized-decorative"]["tiny-volcanic-rock"])
nulla_tiny_rock.name = "nulla-tiny-rock"
nulla_tiny_rock.order = "[nulla]-[nulla-tiny-rock]"
nulla_tiny_rock.autoplace = nil


local nulla_tiny_rock_cluster = table.deepcopy(data.raw["optimized-decorative"]["tiny-rock-cluster"])
nulla_tiny_rock_cluster.name = "nulla-tiny-rock-cluster"
nulla_tiny_rock_cluster.order = "[nulla]-[nulla-tiny-rock-cluster]"
nulla_tiny_rock.autoplace = nil


local nulla_ruin_decoration_tiny = table.deepcopy(data.raw["optimized-decorative"]["space-platform-decorative-tiny"])
nulla_ruin_decoration_tiny.name = "nulla-ruin-decoration-tiny"
nulla_ruin_decoration_tiny.order = "[nulla]-[ruin-decoration][nulla-ruin-decoration-tiny]"

local nulla_ruin_decoration_1x1 = table.deepcopy(data.raw["optimized-decorative"]["space-platform-decorative-1x1"])
nulla_ruin_decoration_1x1.name = "nulla-ruin-decoration-1x1"
nulla_ruin_decoration_1x1.order = "[nulla]-[ruin-decoration][nulla-ruin-decoration-1x1]"

local nulla_ruin_decoration_2x2 = table.deepcopy(data.raw["optimized-decorative"]["space-platform-decorative-2x2"])
nulla_ruin_decoration_2x2.name = "nulla-ruin-decoration-2x2"
nulla_ruin_decoration_2x2.order = "[nulla]-[ruin-decoration][nulla-ruin-decoration-2x2]"

local nulla_ruin_decoration_4x4 = table.deepcopy(data.raw["optimized-decorative"]["space-platform-decorative-4x4"])
nulla_ruin_decoration_4x4.name = "nulla-ruin-decoration-4x4"
nulla_ruin_decoration_4x4.order = "[nulla]-[ruin-decoration][nulla-ruin-decoration-4x4]"


data:extend
({
	nulla_dune_decal,
	nulla_chimney_truncated,
	nulla_chimney_short,
	nulla_huge_rock,
	nulla_big_rock,
	nulla_medium_rock,
	nulla_small_rock,
	nulla_tiny_rock,
	nulla_tiny_rock_cluster,
	
	nulla_ruin_decoration_tiny,
	nulla_ruin_decoration_1x1,
	nulla_ruin_decoration_2x2,
	nulla_ruin_decoration_4x4,
	
	{
		type = "corpse",
		name = "nulla-nuclear-crater",
		icon = "__base__/graphics/icons/small-scorchmark.png",
		flags = {"placeable-neutral", "not-on-map", "placeable-off-grid"},
		hidden_in_factoriopedia = true,
		collision_box = {{-9, -9}, {9, 9}},
		selection_box = {{-8, -8}, {8, 8}},
		collision_mask = {layers={doodad=true}},
		selectable_in_game = false,
		expires = false,
		final_render_layer = "decals",
		ground_patch_render_layer = "decals",
		subgroup = "scorchmarks",
		order = "[nulla]-[crater]-[nuclear-crater]",
		remove_on_entity_placement = false,
		remove_on_tile_placement = true,
		use_tile_color_for_ground_patch_tint = true,
		autoplace =
		{
			order="[nulla]-[nulla-nuclear-crater]",
			probability_expression = "nulla_nuclear_crater",
			tile_restriction = { "nulla-biome2", "nulla-biome3", "nulla-biome4", "nulla-biome5", "nulla-biome6" },
		},
		ground_patch =
		{
			layers =
			{
				{
					filename = "__base__/graphics/entity/scorchmark/big-scorchmark.png",
					dice_y = 2,
					width = 960,
					height = 704,
					line_length = 1,
					shift = util.by_pixel(0, -48),
					scale = 1.0
				},
				{
					filename = "__base__/graphics/entity/scorchmark/medium-scorchmark.png",
					width = 510,
					height = 352,
					line_length = 2,
					shift = util.by_pixel(88, -46),
					scale = 1.0
				},
				{
					filename = "__base__/graphics/entity/scorchmark/medium-scorchmark.png",
					width = 510,
					height = 352,
					line_length = 2,
					shift = util.by_pixel(-88, -46),
					scale = 1.0
				},
				{
					filename = "__base__/graphics/entity/scorchmark/big-scorchmark.png",
					dice_y = 2,
					width = 960,
					height = 704,
					line_length = 1,
					shift = util.by_pixel(64, 0),
					scale = 1.0
				},
				{
					filename = "__base__/graphics/entity/scorchmark/big-scorchmark.png",
					dice_y = 2,
					width = 960,
					height = 704,
					line_length = 1,
					shift = util.by_pixel(-64, 0),
					scale = 1.0
				},
				{
					filename = "__base__/graphics/entity/scorchmark/medium-scorchmark.png",
					width = 510,
					height = 352,
					line_length = 2,
					shift = util.by_pixel(88, 46),
					scale = 1.0
				},
				{
					filename = "__base__/graphics/entity/scorchmark/medium-scorchmark.png",
					width = 510,
					height = 352,
					line_length = 2,
					shift = util.by_pixel(-88, 46),
					scale = 1.0
				},
				{
					filename = "__base__/graphics/entity/scorchmark/big-scorchmark.png",
					dice_y = 2,
					width = 960,
					height = 704,
					line_length = 1,
					shift = util.by_pixel(0, 48),
					scale = 1.0
				}
			}
		},
		ground_patch_higher =
		{
			layers =
			{
				{
					filename = "__base__/graphics/entity/scorchmark/big-scorchmark-top.png",
					width = 274,
					height = 194,
					line_length = 1,
					shift = util.by_pixel(0, -48),
					scale = 1.0
				},
				{
					filename = "__base__/graphics/entity/scorchmark/medium-scorchmark-top.png",
					width = 136,
					height = 100,
					line_length = 2,
					shift = util.by_pixel(88, -46),
					scale = 1.0
				},
				{
					filename = "__base__/graphics/entity/scorchmark/medium-scorchmark-top.png",
					width = 136,
					height = 100,
					line_length = 2,
					shift = util.by_pixel(-88, -46),
					scale = 1.0
				},
				{
					filename = "__base__/graphics/entity/scorchmark/big-scorchmark-top.png",
					width = 274,
					height = 194,
					line_length = 1,
					shift = util.by_pixel(64, 0),
					scale = 1.0
				},
				{
					filename = "__base__/graphics/entity/scorchmark/big-scorchmark-top.png",
					width = 274,
					height = 194,
					line_length = 1,
					shift = util.by_pixel(-64, 0),
					scale = 1.0
				},
				{
					filename = "__base__/graphics/entity/scorchmark/medium-scorchmark-top.png",
					width = 136,
					height = 100,
					line_length = 2,
					shift = util.by_pixel(88, 46),
					scale = 1.0
				},
				{
					filename = "__base__/graphics/entity/scorchmark/medium-scorchmark-top.png",
					width = 136,
					height = 100,
					line_length = 2,
					shift = util.by_pixel(-88, 46),
					scale = 1.0
				},
				{
					filename = "__base__/graphics/entity/scorchmark/big-scorchmark-top.png",
					width = 274,
					height = 194,
					line_length = 1,
					shift = util.by_pixel(0, 48),
					scale = 1.0
				}
			}
		},
	},
	{
		name = "nulla-crater-small",
		type = "optimized-decorative",
		order = "[nulla]-[crater]-[crater-small]",
		collision_box = {{-0.5, -0.5}, {0.5, 0.5}},
		collision_mask = {layers={water_tile=true}, colliding_with_tiles_only=true},
		render_layer = "decals",
		tile_layer =  decal_tile_layer,
		walking_sound = base_tile_sounds.walking.pebble,
		autoplace =
		{
			probability_expression = "nulla_crater_small",
			tile_restriction = {"nulla-biome1", "nulla-biome2", "nulla-biome3", "nulla-biome4", "nulla-biome5", "nulla-biome6"},
		},
		pictures = get_decal_pictures("__space-age__/graphics/decorative/vulcanus-crater/vulcanus-crater-", "", 128, 20)
	},
	{
		name = "nulla-crater-large",
		type = "optimized-decorative",
		order = "[nulla]-[crater]-[crater-large]",
		collision_box = {{-2.5, -2.5}, {2.5, 2.5}},
		collision_mask = {layers={water_tile=true}, colliding_with_tiles_only=true},
		render_layer = "decals",
		tile_layer =  decal_tile_layer,
		walking_sound = base_tile_sounds.walking.pebble,
		autoplace =
		{
			probability_expression = "nulla_crater_large",
			tile_restriction = {"nulla-biome1", "nulla-biome2", "nulla-biome3", "nulla-biome4", "nulla-biome5", "nulla-biome6"},
		},
		pictures = get_decal_pictures("__space-age__/graphics/decorative/vulcanus-crater/vulcanus-crater-", "huge-", 512, 14)
	},
	{
		type = "simple-entity",
		name = "nulla-medium-remnants",
		localised_name = {"entity-name.medium-remnants"},
		icon = "__base__/graphics/icons/remnants.png",
		hidden_in_factoriopedia = true,
		flags = {"placeable-neutral"},
		order = "[nulla]-[remnants]-a[medium-remnants]",
		selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
		collision_box = {{-1.4, -1.4}, {1.4, 1.4}},
		map_color = {111, 95, 89},
		created_effect =
		{
			type = "direct",
			action_delivery =
			{
				type = "instant",
				source_effects =
				{
					{
						type = "create-decorative",
						decorative = "nulla-ruin-decoration-4x4",
						spawn_min = 1,
						spawn_max = 2,
						spawn_min_radius = 1,
						spawn_max_radius = 1
					},
					{
						type = "create-decorative",
						decorative = "nulla-ruin-decoration-2x2",
						spawn_min = 2,
						spawn_max = 5,
						spawn_min_radius = 1,
						spawn_max_radius = 2
					},
				}
			}
		},
		minable =
		{
			mining_time = 2,
			results =
			{
				{type = "item", name = "steel-plate", amount_min = 10, amount_max = 15},
				{type = "item", name = "iron-plate", amount_min = 5, amount_max = 10},
				{type = "item", name = "iron-stick", amount_min = 5, amount_max = 10},
				{type = "item", name = "electronic-circuit", amount_min = 5, amount_max = 10},
			}
		},
		resistances =
		{
			{
				type = "fire",
				percent = 100
			}
		},
		autoplace =
		{
			probability_expression = "nulla_medium_remnants",
			tile_restriction = {"nulla-biome2", "nulla-biome3", "nulla-biome4", "nulla-biome5", "nulla-biome6"},
		},
		pictures =
		{
		  {
			filename = "__base__/graphics/entity/remnants/medium-remnants.png",
			line_length = 1,
			width = 236,
			height = 246,
			direction_count = 1,
			shift = util.by_pixel(0, -4.5),
			scale = 0.5,
			y = 0
		  },
		  {
			filename = "__base__/graphics/entity/remnants/medium-remnants.png",
			line_length = 1,
			width = 236,
			height = 246,
			direction_count = 1,
			shift = util.by_pixel(0, -4.5),
			scale = 0.5,
			y = 246
		  },
		  {
			filename = "__base__/graphics/entity/remnants/medium-remnants.png",
			line_length = 1,
			width = 236,
			height = 246,
			direction_count = 1,
			shift = util.by_pixel(0, -4.5),
			scale = 0.5,
			y = 492
		  },
		  {
			filename = "__base__/graphics/entity/remnants/medium-remnants.png",
			line_length = 1,
			width = 236,
			height = 246,
			direction_count = 1,
			shift = util.by_pixel(0, -4.5),
			scale = 0.5,
			y = 738
		  }
		}
	},
	{
		type = "simple-entity",
		name = "nulla-small-remnants",
		localised_name = {"entity-name.small-remnants"},
		icon = "__base__/graphics/icons/remnants.png",
		hidden_in_factoriopedia = true,
		flags = {"placeable-neutral"},
		order = "[nulla]-[remnants]-d[small-remnants]",
		selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
		collision_box = {{-0.45, -0.45}, {0.45, 0.45}},
		map_color = {111, 95, 89},
		created_effect =
		{
			type = "direct",
			action_delivery =
			{
				type = "instant",
				source_effects =
				{
					{
						type = "create-decorative",
						decorative = "nulla-ruin-decoration-1x1",
						spawn_min = 3,
						spawn_max = 6,
						spawn_min_radius = 1,
						spawn_max_radius = 2
					},
					{
						type = "create-decorative",
						decorative = "nulla-ruin-decoration-tiny",
						spawn_min = 3,
						spawn_max = 6,
						spawn_min_radius = 1,
						spawn_max_radius = 1
					},
				}
			}
		},
		minable =
		{
			mining_time = 1,
			results =
			{
				{type = "item", name = "iron-plate", amount_min = 5, amount_max = 10},
				{type = "item", name = "iron-stick", amount_min = 3, amount_max = 6},
				{type = "item", name = "iron-gear-wheel", amount_min = 1, amount_max = 4},
			}
		},
		resistances =
		{
			{
				type = "fire",
				percent = 100
			}
		},
		autoplace =
		{
			probability_expression = "nulla_small_remnants",
			tile_restriction = {"nulla-biome2", "nulla-biome3", "nulla-biome4", "nulla-biome5", "nulla-biome6"},
		},
		pictures =
		{
		  {
			filename = "__base__/graphics/entity/remnants/small-remnants.png",
			line_length = 1,
			width = 112,
			height = 110,
			direction_count = 1,
			shift = util.by_pixel(0, 3.5),
			scale = 0.5,
			y = 0
		  },
		  {
			filename = "__base__/graphics/entity/remnants/small-remnants.png",
			line_length = 1,
			width = 112,
			height = 110,
			direction_count = 1,
			shift = util.by_pixel(0, 3.5),
			scale = 0.5,
			y = 110
		  }
		}
	},
})