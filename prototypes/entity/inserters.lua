local item_sounds = require("__base__.prototypes.item_sounds")
local hit_effects = require("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")
local util = require("util")

local function platform_picture()
	return
	{
		west =
		{
			layers =
			{
				{
					filename = "__base__/graphics/entity/pipe/pipe-straight-vertical.png",
					priority = "extra-high",
					width = 128,
					height = 128,
					scale = 0.5
				},
			}
		},
		east =
		{
			layers =
			{
				{
					filename = "__base__/graphics/entity/pipe/pipe-straight-vertical.png",
					priority = "extra-high",
					width = 128,
					height = 128,
					scale = 0.5
				},
			}
		},
		north =
		{
			layers =
			{
				{
					filename = "__base__/graphics/entity/pipe/pipe-straight-horizontal.png",
					priority = "extra-high",
					width = 128,
					height = 128,
					scale = 0.5
				},
			}
		},
		south =
		{
			layers =
			{
				{
					filename = "__base__/graphics/entity/pipe/pipe-straight-horizontal.png",
					priority = "extra-high",
					width = 128,
					height = 128,
					scale = 0.5
				},
			}
		},
	}
end

local function platform_frozen()
	return
	{
		west =
		{
			layers =
			{
				{
					filename = "__space-age__/graphics/entity/frozen/pipe/pipe-straight-vertical.png",
					priority = "extra-high",
					width = 128,
					height = 128,
					scale = 0.5
				},
			}
		},
		east =
		{
			layers =
			{
				{
					filename = "__space-age__/graphics/entity/frozen/pipe/pipe-straight-vertical.png",
					priority = "extra-high",
					width = 128,
					height = 128,
					scale = 0.5
				},
			}
		},
		north =
		{
			layers =
			{
				{
					filename = "__space-age__/graphics/entity/frozen/pipe/pipe-straight-horizontal.png",
					priority = "extra-high",
					width = 128,
					height = 128,
					scale = 0.5
				},
			}
		},
		south =
		{
			layers =
			{
				{
					filename = "__space-age__/graphics/entity/frozen/pipe/pipe-straight-horizontal.png",
					priority = "extra-high",
					width = 128,
					height = 128,
					scale = 0.5
				},
			}
		},
	}
end

local function integration_patch()
	return
	{
		layers =
		{
			{
				filename = "__nulla__/graphics/entity/nulla-inserters/inserter-platform-integration-patch.png",
				priority = "extra-high",
				width = 105,
				height = 79,
				shift = util.by_pixel(1.5, 7.5 - 3),
				scale = 0.5
			},
		},
	}
end

local nulla_lubricant_fast_inserter = table.deepcopy(data.raw.inserter["fast-inserter"])
nulla_lubricant_fast_inserter.name = "nulla-lubricant-fast-inserter"
nulla_lubricant_fast_inserter.icon = "__nulla__/graphics/icons/nulla-lubricant-fast-inserter.png"
nulla_lubricant_fast_inserter.minable =
{
    mining_time = 0.1,
    result = "nulla-lubricant-fast-inserter"
}
nulla_lubricant_fast_inserter.energy_source =
{
    type = "fluid",
    burns_fluid = true,
    scale_fluid_usage = true,
    fluid_box =
    {
        pipe_covers = pipecoverspictures(),
        always_draw_covers = false,
        volume = 100,
        filter = "lubricant",
        pipe_connections =
        {
            { direction = defines.direction.west, position = { 0, 0 } },
            { direction = defines.direction.east, position = { 0, 0 } },
        },
        production_type = "input-output",
    },
}
nulla_lubricant_fast_inserter.nulla_energy_multiplier = 0.028
nulla_lubricant_fast_inserter.next_upgrade = "nulla-lubricant-bulk-inserter"
nulla_lubricant_fast_inserter.hand_base_picture =
{
    filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-base.png",
    priority = "extra-high",
    width = 32,
    height = 136,
    scale = 0.25
}
nulla_lubricant_fast_inserter.hand_closed_picture =
{
    filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-closed.png",
    priority = "extra-high",
    width = 72,
    height = 164,
    scale = 0.25
}
nulla_lubricant_fast_inserter.hand_open_picture =
{
    filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-open.png",
    priority = "extra-high",
    width = 72,
    height = 164,
    scale = 0.25
}
nulla_lubricant_fast_inserter.platform_picture = platform_picture()
nulla_lubricant_fast_inserter.platform_frozen = platform_frozen()
nulla_lubricant_fast_inserter.integration_patch_render_layer = "object"
nulla_lubricant_fast_inserter.integration_patch = integration_patch()



local nulla_lubricant_long_handed_inserter = table.deepcopy(data.raw.inserter["long-handed-inserter"])
nulla_lubricant_long_handed_inserter.name = "nulla-lubricant-long-handed-inserter"
nulla_lubricant_long_handed_inserter.icon = "__nulla__/graphics/icons/nulla-lubricant-long-handed-inserter.png"
nulla_lubricant_long_handed_inserter.minable =
{
    mining_time = 0.1,
    result = "nulla-lubricant-long-handed-inserter"
}
nulla_lubricant_long_handed_inserter.energy_source =
{
    type = "fluid",
    burns_fluid = true,
    scale_fluid_usage = true,
    fluid_box =
    {
        pipe_covers = pipecoverspictures(),
        always_draw_covers = false,
        volume = 100,
        filter = "lubricant",
        pipe_connections =
        {
            { direction = defines.direction.west, position = { 0, 0 } },
            { direction = defines.direction.east, position = { 0, 0 } },
        },
        production_type = "input-output",
    },
}
nulla_energy_multiplier = 0.02
nulla_lubricant_long_handed_inserter.hand_base_picture =
{
    filename = "__nulla__/graphics/entity/nulla-inserters/long-handed-inserter-hand-base.png",
    priority = "extra-high",
    width = 32,
    height = 136,
    scale = 0.25
}
nulla_lubricant_long_handed_inserter.hand_closed_picture =
{
    filename = "__nulla__/graphics/entity/nulla-inserters/long-handed-inserter-hand-closed.png",
    priority = "extra-high",
    width = 72,
    height = 164,
    scale = 0.25
}
nulla_lubricant_long_handed_inserter.hand_open_picture =
{
    filename = "__nulla__/graphics/entity/nulla-inserters/long-handed-inserter-hand-open.png",
    priority = "extra-high",
    width = 72,
    height = 164,
    scale = 0.25
}
nulla_lubricant_long_handed_inserter.platform_picture = platform_picture()
nulla_lubricant_long_handed_inserter.platform_frozen = platform_frozen()
nulla_lubricant_long_handed_inserter.integration_patch_render_layer = "object"
nulla_lubricant_long_handed_inserter.integration_patch = integration_patch()



local nulla_lubricant_bulk_inserter = table.deepcopy(data.raw.inserter["bulk-inserter"])
nulla_lubricant_bulk_inserter.name = "nulla-lubricant-bulk-inserter"
nulla_lubricant_bulk_inserter.icon = "__nulla__/graphics/icons/nulla-lubricant-bulk-inserter.png"
nulla_lubricant_bulk_inserter.minable =
{
    mining_time = 0.1,
    result = "nulla-lubricant-bulk-inserter"
}
nulla_lubricant_bulk_inserter.energy_source =
{
    type = "fluid",
    burns_fluid = true,
    scale_fluid_usage = true,
    fluid_box =
    {
        pipe_covers = pipecoverspictures(),
        always_draw_covers = false,
        volume = 100,
        filter = "lubricant",
        pipe_connections =
        {
            { direction = defines.direction.west, position = { 0, 0 } },
            { direction = defines.direction.east, position = { 0, 0 } },
        },
        production_type = "input-output",
    },
}
nulla_lubricant_bulk_inserter.nulla_energy_multiplier = 0.08
nulla_lubricant_bulk_inserter.next_upgrade = "nulla-lubricant-stack-inserter"
nulla_lubricant_bulk_inserter.hand_base_picture =
{
    filename = "__nulla__/graphics/entity/nulla-inserters/bulk-inserter-hand-base.png",
    priority = "extra-high",
    width = 32,
    height = 136,
    scale = 0.25
}
nulla_lubricant_bulk_inserter.hand_closed_picture =
{
    filename = "__nulla__/graphics/entity/nulla-inserters/bulk-inserter-hand-closed.png",
    priority = "extra-high",
    width = 100,
    height = 164,
    scale = 0.25
}
nulla_lubricant_bulk_inserter.hand_open_picture =
{
    filename = "__nulla__/graphics/entity/nulla-inserters/bulk-inserter-hand-open.png",
    priority = "extra-high",
    width = 130,
    height = 164,
    scale = 0.25
}
nulla_lubricant_bulk_inserter.platform_picture = platform_picture()
nulla_lubricant_bulk_inserter.platform_frozen = platform_frozen()
nulla_lubricant_bulk_inserter.integration_patch_render_layer = "object"
nulla_lubricant_bulk_inserter.integration_patch = integration_patch()



local nulla_lubricant_stack_inserter = table.deepcopy(data.raw.inserter["stack-inserter"])
nulla_lubricant_stack_inserter.name = "nulla-lubricant-stack-inserter"
nulla_lubricant_stack_inserter.icon = "__nulla__/graphics/icons/nulla-lubricant-stack-inserter.png"
nulla_lubricant_stack_inserter.minable =
{
    mining_time = 0.1,
    result = "nulla-lubricant-stack-inserter"
}
nulla_lubricant_stack_inserter.energy_source =
{
    type = "fluid",
    burns_fluid = true,
    scale_fluid_usage = true,
    fluid_box =
    {
        pipe_covers = pipecoverspictures(),
        always_draw_covers = false,
        volume = 100,
        filter = "lubricant",
        pipe_connections =
        {
            { direction = defines.direction.west, position = { 0, 0 } },
            { direction = defines.direction.east, position = { 0, 0 } },
        },
        production_type = "input-output",
    },
}
nulla_lubricant_stack_inserter.nulla_energy_multiplier = 0.16
nulla_lubricant_stack_inserter.hand_base_picture =
{
    filename = "__nulla__/graphics/entity/nulla-inserters/stack-inserter-hand-base.png",
    priority = "extra-high",
    width = 32,
    height = 136,
    scale = 0.25
}
nulla_lubricant_stack_inserter.hand_closed_picture =
{
    filename = "__nulla__/graphics/entity/nulla-inserters/stack-inserter-hand-closed.png",
    priority = "extra-high",
    width = 112,
    height = 164,
    scale = 0.25
}
nulla_lubricant_stack_inserter.hand_open_picture =
{
    filename = "__nulla__/graphics/entity/nulla-inserters/stack-inserter-hand-open.png",
    priority = "extra-high",
    width = 134,
    height = 164,
    scale = 0.25
}
nulla_lubricant_stack_inserter.platform_picture = platform_picture()
nulla_lubricant_stack_inserter.platform_frozen = platform_frozen()
nulla_lubricant_stack_inserter.integration_patch_render_layer = "object"
nulla_lubricant_stack_inserter.integration_patch = integration_patch()



data:extend
({
	nulla_lubricant_fast_inserter,
	nulla_lubricant_long_handed_inserter,
	nulla_lubricant_bulk_inserter,
	nulla_lubricant_stack_inserter,
	
	{
		type = "item",
		name = "nulla-lubricant-fast-inserter",
		icon = "__nulla__/graphics/icons/nulla-lubricant-fast-inserter.png",
		subgroup = "inserter",
		color_hint = { text = "F" },
		order = "z-z-a",
		inventory_move_sound = item_sounds.inserter_inventory_move,
		pick_sound = item_sounds.inserter_inventory_pickup,
		drop_sound = item_sounds.inserter_inventory_move,
		place_result = "nulla-lubricant-fast-inserter",
		stack_size = 50,
		default_import_location = "nulla",
		weight = 20*kg
	},
	{
		type = "item",
		name = "nulla-lubricant-long-handed-inserter",
		icon = "__nulla__/graphics/icons/nulla-lubricant-long-handed-inserter.png",
		subgroup = "inserter",
		color_hint = { text = "L" },
		order = "z-z-b",
		inventory_move_sound = item_sounds.inserter_inventory_move,
		pick_sound = item_sounds.inserter_inventory_pickup,
		drop_sound = item_sounds.inserter_inventory_move,
		place_result = "nulla-lubricant-long-handed-inserter",
		stack_size = 50,
		default_import_location = "nulla",
		weight = 20*kg
	},
	{
		type = "item",
		name = "nulla-lubricant-bulk-inserter",
		icon = "__nulla__/graphics/icons/nulla-lubricant-bulk-inserter.png",
		subgroup = "inserter",
		color_hint = { text = "Y" },
		order = "z-z-c",
		inventory_move_sound = item_sounds.inserter_inventory_move,
		pick_sound = item_sounds.inserter_inventory_pickup,
		drop_sound = item_sounds.inserter_inventory_move,
		place_result = "nulla-lubricant-bulk-inserter",
		stack_size = 50,
		default_import_location = "nulla",
		weight = 20*kg
	},
	{
		type = "item",
		name = "nulla-lubricant-stack-inserter",
		icon = "__nulla__/graphics/icons/nulla-lubricant-stack-inserter.png",
		subgroup = "inserter",
		color_hint = { text = "S" },
		order = "z-z-d",
		inventory_move_sound = item_sounds.wire_inventory_move,
		pick_sound = item_sounds.wire_inventory_pickup,
		drop_sound = item_sounds.wire_inventory_move,
		place_result = "nulla-lubricant-stack-inserter",
		stack_size = 50,
		default_import_location = "nulla",
		weight = 20*kg
	},
})