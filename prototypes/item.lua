local sounds = require("__base__.prototypes.entity.sounds")
local space_age_sounds = require("__space-age__.prototypes.entity.sounds")
local space_age_item_sounds = require("__space-age__.prototypes.item_sounds")
local item_sounds = require("__base__.prototypes.item_sounds")
local item_tints = require("__base__.prototypes.item-tints")
local simulations = require("__base__.prototypes.factoriopedia-simulations")


data:extend
{
	{
		type = "item",
		name = "nulla-scrap",
		icon = "__nulla__/graphics/entity/nulla-scrap/scrap.png",
		pictures =
		{
		  { size = 64, filename = "__nulla__/graphics/entity/nulla-scrap/scrap.png",   scale = 0.5, mipmap_count = 4 },
		  { size = 64, filename = "__nulla__/graphics/entity/nulla-scrap/scrap-1.png", scale = 0.5, mipmap_count = 4 },
		  { size = 64, filename = "__nulla__/graphics/entity/nulla-scrap/scrap-2.png", scale = 0.5, mipmap_count = 4 },
		  { size = 64, filename = "__nulla__/graphics/entity/nulla-scrap/scrap-3.png", scale = 0.5, mipmap_count = 4 },
		  { size = 64, filename = "__nulla__/graphics/entity/nulla-scrap/scrap-4.png", scale = 0.5, mipmap_count = 4 },
		  { size = 64, filename = "__nulla__/graphics/entity/nulla-scrap/scrap-5.png", scale = 0.5, mipmap_count = 4 }
		},
		subgroup = "nulla-processes",
		order = "a[scrap]-a[nulla-scrap]",
		inventory_move_sound = item_sounds.resource_inventory_move,
		pick_sound = item_sounds.resource_inventory_pickup,
		drop_sound = item_sounds.resource_inventory_move,
		stack_size = 50,
		default_import_location = "nulla",
		weight = 2*kg
	},
	{
		type = "item",
		name = "nulla-tesla-defense-equipment",
		icon = "__nulla__/graphics/icons/nulla-tesla-defense-equipment.png",
		place_as_equipment_result = "nulla-tesla-defense-equipment",
		subgroup = "military-equipment",
		order = "b[active-defense]-b[nulla-tesla-defense-equipment]-a[equipment]",
		inventory_move_sound = item_sounds.electric_large_inventory_move,
		pick_sound = item_sounds.electric_large_inventory_pickup,
		drop_sound = item_sounds.electric_large_inventory_move,
		stack_size = 20,
		weight = 200*kg
	},
	{
		type = "item",
		name = "nulla-personal-roboport-equipment",
		localised_description = {"item-description.personal-roboport-equipment"},
		icon = "__nulla__/graphics/icons/nulla-personal-roboport-equipment.png",
		place_as_equipment_result = "nulla-personal-roboport-equipment",
		subgroup = "utility-equipment",
		order = "e[robotics]-bz[nulla-personal-roboport-equipment]",
		inventory_move_sound = item_sounds.roboport_inventory_move,
		pick_sound = item_sounds.roboport_inventory_pickup,
		drop_sound = item_sounds.roboport_inventory_move,
		stack_size = 20,
		weight = 1000*kg
	},
	{
		type = "tool",
		name = "robotic-science-pack",
		localised_description = {"item-description.science-pack"},
		icon = "__nulla__/graphics/icons/robotic-science-pack.png",
		subgroup = "science-pack",
		color_hint = { text = "AP" },
		order = "k-z",
		inventory_move_sound = item_sounds.science_inventory_move,
		pick_sound = item_sounds.science_inventory_pickup,
		drop_sound = item_sounds.science_inventory_move,
		stack_size = 200,
		default_import_location = "nulla",
		weight = 1*kg,
		durability = 1,
		durability_description_key = "description.science-pack-remaining-amount-key",
		factoriopedia_durability_description_key = "description.factoriopedia-science-pack-remaining-amount-key",
		durability_description_value = "description.science-pack-remaining-amount-value",
		random_tint_color = item_tints.bluish_science,
		spoil_ticks = 60 * minute,
		spoil_to_trigger_result =
		{
		  items_per_trigger = 1,
		  trigger =
		  {
			type = "direct",
			action_delivery =
			{
			  type = "instant",
			  source_effects =
			  {
				{
				  type = "create-entity",
				  entity_name = "destroyer",
				  affects_target = true,
				  show_in_tooltip = true,
				  as_enemy = true,
				  find_non_colliding_position = true,
				  offset_deviation = {{-1, -1}, {1, 1}},
				  non_colliding_fail_result =
				  {
					type = "direct",
					action_delivery =
					{
					  type = "instant",
					  source_effects =
					  {
						{
						  type = "create-entity",
						  entity_name = "destroyer",
						  affects_target = true,
						  show_in_tooltip = false,
						  as_enemy = true,
						  offset_deviation = {{-1, -1}, {1, 1}},
						}
					  }
					}
				  }
				}
			  }
			}
		  }
		}
	},
}
