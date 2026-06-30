local resource_autoplace = require("resource-autoplace")
local tile_sounds = require("__base__.prototypes.tile.tile-sounds")
local hit_effects = require("__base__/prototypes/entity/hit-effects")
local sounds = require("__base__/prototypes/entity/sounds")
local movement_triggers = require("__base__/prototypes/entity/movement-triggers")
local space_age_sounds = require("__space-age__.prototypes.entity.sounds")
local item_sounds = require("__base__.prototypes.item_sounds")
local space_age_item_sounds = require("__space-age__.prototypes.item_sounds")
local item_tints = require("__base__.prototypes.item-tints")
local item_effects = require("__space-age__.prototypes.item-effects")
local meld = require("meld")
local simulations = require("__space-age__.prototypes.factoriopedia-simulations")
local decorative_trigger_effects = require("__base__/prototypes/decorative/decorative-trigger-effects")
local base_tile_sounds = require("__base__.prototypes.tile.tile-sounds")



data:extend
({
	{
		type = "autoplace-control",
		name = "nulla_enemy_base",
		richness = false,
		order = "z-a",
		category = "enemy",
		can_be_disabled = false,
		related_to_fight_achievements = true
	},
	{
		type = "autoplace-control",
		name = "nulla_scrap",
		localised_name = {"", "[entity=nulla-scrap] ", {"entity-name.nulla-scrap"}},
		richness = true,
		order = "z-b",
		category = "resource"
	},
	{
		type = "autoplace-control",
		name = "nulla_nuclear_waste",
		localised_name = {"", "[entity=depleted-uranium-fuel-cell] ", {"entity-name.depleted-uranium-fuel-cell"}},
		richness = true,
		order = "z-c",
		category = "resource"
	},
	{
		type = "autoplace-control",
		name = "nulla_remnants",
		order = "z-z-a",
		category = "terrain",
	},
	{
		type = "resource",
		name = "nulla-scrap",
		icon = "__nulla__/graphics/entity/nulla-scrap/scrap.png",
		flags = {"placeable-neutral"},
		order = "a[scrap]-a[nulla-scrap]",
		subgroup = "nulla-processes",
		category = "basic-solid",
		walking_sound = base_tile_sounds.walking.ore,
		driving_sound = tile_sounds.driving.stone,
		minable =
		{
			mining_particle = "scrap-particle",
			mining_time = 0.5,
			results =
			{
				-- Normal (80%)
				{type = "item", name = "nulla-scrap", amount = 1, quality_change = 0, shared_probability = { min = 0.00, max = 0.80 }, show_details_in_recipe_tooltip = false},
				-- Uncommon (18%)
				{type = "item", name = "nulla-scrap", amount = 1, quality_change = 1, shared_probability = { min = 0.80, max = 0.98 }, show_details_in_recipe_tooltip = false},
				-- Rare (1.8%)
				{type = "item", name = "nulla-scrap", amount = 1, quality_change = 2, shared_probability = { min = 0.98, max = 0.998 }, show_details_in_recipe_tooltip = false},
				-- Epic (0.18%)
				{type = "item", name = "nulla-scrap", amount = 1, quality_change = 3, shared_probability = { min = 0.998, max = 0.9998 }, show_details_in_recipe_tooltip = false},
				-- Legendary (0.02%)
				{type = "item", name = "nulla-scrap", amount = 1, quality_change = 4, shared_probability = { min = 0.9998, max = 1.00 }, show_details_in_recipe_tooltip = false},
			},
		},
		collision_mask = nil,
		collision_box = {{-0.1, -0.1}, {0.1, 0.1}},
		selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
		autoplace =
		{
			order="[nulla]-[nulla-scrap]",
			probability_expression = "nulla_scrap_probability",
			richness_expression = "nulla_scrap_richness"
		},
		stage_counts = {15000, 9500, 5500, 2900, 1300, 400, 150, 80},
		stages =
		{
			sheet =
			{
			  filename = "__nulla__/graphics/entity/nulla-scrap/nulla-scrap-sheet.png",
			  priority = "extra-high",
			  size = 128,
			  frame_count = 8,
			  variation_count = 8,
			  scale = 0.5
			}
		},
		map_color = {0.9, 0.9, 0.9},
		mining_visualisation_tint = {r = 0.77, g = 0.77, b = 0.9, a = 1.000},
	},
	{
		type = "resource",
		name = "depleted-uranium-fuel-cell",
		icon = "__base__/graphics/icons/depleted-uranium-fuel-cell.png",
		flags = {"placeable-neutral"},
		order = "b[uranium-products]-b[depleted-uranium-fuel-cell]",
		category = "basic-solid",
		walking_sound = tile_sounds.walking.ore,
		driving_sound = tile_sounds.driving.stone,
		collision_mask = {layers={resource=true}},
		minable =
		{
			mining_particle = "stone-particle",
			mining_time = 2,
			result = "depleted-uranium-fuel-cell",
			fluid_amount = 10,
			required_fluid = "sulfuric-acid"
		},
		collision_box = {{-0.1, -0.1}, {0.1, 0.1}},
		selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
		autoplace = nil,
		stage_counts = {10000, 6330, 3670, 1930, 870, 270, 100, 50},
		stages =
		{
		  sheet =
		  {
			filename = "__nulla__/graphics/entity/nulla-nuclear-waste/nulla-nuclear-waste.png",
			priority = "extra-high",
			width = 128,
			height = 128,
			frame_count = 8,
			variation_count = 8,
			scale = 0.5
		  }
		},
		mining_visualisation_tint = {r = 0.814, g = 1.000, b = 0.499, a = 1.000},
		map_color = {25, 53, 25}
	},
})