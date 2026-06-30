local util = require('util')
local sounds = require("__base__.prototypes.entity.sounds")
local base_sounds = require ("__base__.prototypes.entity.sounds")
local hit_effects = require ("__base__.prototypes.entity.hit-effects")



local nulla_cargo_pod_container_explosion = table.deepcopy(data.raw.explosion["cargo-pod-container-explosion"])
nulla_cargo_pod_container_explosion.name = "nulla-cargo-pod-container-explosion"
nulla_cargo_pod_container_explosion.animations =
{
    layers =
    {
        util.sprite_load("__base__/graphics/entity/cargo-pod/pod-death-shadow",
        {
          priority = "medium",
          scale = 0.5,
          animation_speed = 0.5,
          frame_count = 18,
          draw_as_shadow = true
        }),
        util.sprite_load("__nulla__/graphics/entity/nulla-cargo-pod/nulla-cargo-pod-death",
        {
          priority = "medium",
          scale = 0.5,
          animation_speed = 0.5,
          frame_count = 18
        })
    }
}
nulla_cargo_pod_container_explosion.created_effect =
{
    type = "direct",
    action_delivery =
    {
        type = "delayed",
        delayed_trigger = "nulla-cargo-pod-container-explosion-delay"
    }
}

local nulla_cargo_pod_container_explosion_delay = table.deepcopy(data.raw["delayed-active-trigger"]["cargo-pod-container-explosion-delay"])
nulla_cargo_pod_container_explosion_delay.name = "nulla-cargo-pod-container-explosion-delay"
nulla_cargo_pod_container_explosion_delay.action =
{
	{
		type = "direct",
		action_delivery =
		{
			type = "instant",
			source_effects =
			{
				{
					type = "create-entity",
					entity_name = "nulla-cargo-pod-container-remnants"
				}
			}
		}
	}
}


data:extend
({
	nulla_cargo_pod_container_explosion,
	nulla_cargo_pod_container_explosion_delay,

	
	{
		type = "corpse",
		name = "nulla-cargo-pod-container-remnants",
		hidden_in_factoriopedia = true,
		icon = "__base__/graphics/icons/cargo-pod.png",
		flags = {"placeable-neutral", "not-on-map"},
		subgroup = "generic-remnants",
		order = "c[cargo]-p[pod]-c[container]-r[remnants]",
		time_before_removed = 60 * 60 * 5, -- 5 minutes
		selectable_in_game = false,
		final_render_layer = "remnants",
		animation =
		util.sprite_load("__nulla__/graphics/entity/nulla-cargo-pod/nulla-cargo-pod-corpse",
		{
		  scale = 0.5,
		  direction_count = 1,
		  frame_count = 1
		})
	},
	
	{
		type = "container",
		name = "nulla-cargo-pod",
		icon = "__base__/graphics/icons/landed-cargo-pod.png",
		flags = {"placeable-neutral", "placeable-off-grid"},
		minable = {mining_time = 0.5},
		fast_replaceable_group = "container",
		hidden = true,
		impact_category = "metal",
		render_layer = "object",
		dying_explosion = "nulla-cargo-pod-container-explosion",
		remains_when_mined = {"nulla-cargo-pod-container-explosion"},
		max_health = 250,
		collision_mask = {layers={item=true, object=true, player=true, water_tile=true, elevated_rail=true, is_object=true, is_lower_object=true}},
		collision_box = {{-0.5, 0.0},{0.5, 1.3}},
		selection_box = {{-0.75, -1.25}, {0.75, 1.5}},
		inventory_size = 20,
		open_sound = { filename = "__base__/sound/open-close/metal-large-open.ogg", volume = 0.6 },
		close_sound = { filename = "__base__/sound/open-close/metal-large-close.ogg", volume = 0.6 },
		map_color = {35, 78, 145},
		autoplace =
		{
			probability_expression = "nulla_cargo_pod",
			tile_restriction = {"nulla-biome2", "nulla-biome3", "nulla-biome4", "nulla-biome5", "nulla-biome6"},
		},
		picture =
		{
		  layers =
		  {
			{
				filename = "__nulla__/graphics/entity/nulla-cargo-pod/nulla-cargo-pod.png",
				width = 192,
				height = 258,
				scale = 0.5,
				shift = util.by_pixel( -10.5, 8.0)
			},
			util.sprite_load("__base__/graphics/entity/cargo-pod/pod-landed-shadow",
			{
			  priority = "medium",
			  scale = 0.5,
			  draw_as_shadow = true,
			})
		  }
		},
	},
})