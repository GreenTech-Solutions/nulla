local tile_trigger_effects = require("__base__.prototypes.tile.tile-trigger-effects")
local tile_pollution = require("__nulla__/prototypes/tile/tile-pollution-values")
local tile_collision_masks = require("__base__/prototypes/tile/tile-collision-masks")
local base_sounds = require("__base__/prototypes/entity/sounds")
local base_tile_sounds = require("__base__/prototypes/tile/tile-sounds")
local tile_sounds = require("__space-age__/prototypes/tile/tile-sounds")

local tile_graphics = require("__base__/prototypes/tile/tile-graphics")
local tile_spritesheet_layout = tile_graphics.tile_spritesheet_layout

local patch_for_inner_corner_of_transition_between_transition = tile_graphics.patch_for_inner_corner_of_transition_between_transition


local function material_background(picture, count)
  return
  {
    transition = tile_graphics.generic_masked_tile_transitions1,
    material_background =
    {
      picture = picture,
      count = count,
      scale = 0.5
    }
  }
end

local ash_ice_transitions_between_transitions =
{
  {
    transition_group1 = default_transition_group_id,
    transition_group2 = water_transition_group_id,

    spritesheet = "__nulla__/graphics/terrain/ash-ice-transition.png",
    layout = tile_spritesheet_layout.transition_3_3_3_1_0,
    background_enabled = false,
    effect_map_layout =
    {
      spritesheet = "__base__/graphics/terrain/effect-maps/water-dirt-to-land-mask.png",
      o_transition_count = 0
    },
    water_patch = {
      filename = "__nulla__/graphics/terrain/ash-ice-patch.png",
      scale = 0.5,
      width = 64,
      height = 64
    }
  },
  {
    transition_group1 = default_transition_group_id,
    transition_group2 = out_of_map_transition_group_id,

    background_layer_offset = 1,
    background_layer_group = "zero",
    offset_background_layer_by_tile_layer = true,

    spritesheet = "__base__/graphics/terrain/out-of-map-transition/dirt-out-of-map-transition.png",
    layout = tile_spritesheet_layout.transition_3_3_3_1_0,
    overlay_enabled = false
  },
  {
    transition_group1 = water_transition_group_id,
    transition_group2 = out_of_map_transition_group_id,

    background_layer_offset = 1,
    background_layer_group = "zero",
    offset_background_layer_by_tile_layer = true,

    spritesheet = "__base__/graphics/terrain/out-of-map-transition/dry-dirt-shore-out-of-map-transition.png",
    layout = tile_spritesheet_layout.transition_3_3_3_1_0,
    effect_map_layout =
    {
      spritesheet = "__base__/graphics/terrain/effect-maps/water-dirt-to-out-of-map-mask.png",
      u_transition_count = 0,
      o_transition_count = 0
    }
  }
}

local ash_ice_transitions =
{
  {
    to_tiles = water_tile_type_names,
    transition_group = water_transition_group_id,

    spritesheet = "__nulla__/graphics/terrain/ash-ice-2.png",
    layout = tile_spritesheet_layout.transition_16_16_16_4_4,
    effect_map_layout =
    {
      spritesheet = "__base__/graphics/terrain/effect-maps/water-dirt-mask.png",
      inner_corner_count = 8,
      outer_corner_count = 8,
      side_count = 8,
      u_transition_count = 2,
      o_transition_count = 1
    }
  },
  {
    to_tiles = lava_tile_type_names,
    transition_group = lava_transition_group_id,
    spritesheet = "__space-age__/graphics/terrain/lava-transitions/lava-stone.png",
    lightmap_layout = { spritesheet = "__space-age__/graphics/terrain/lava-transitions/lava-stone-lightmap.png" },
     -- this added the lightmap spritesheet
    layout = tile_spritesheet_layout.transition_16_16_16_4_4,
     -- this added the lightmap spritesheet
    effect_map_layout =
    {
      spritesheet = "__space-age__/graphics/terrain/effect-maps/lava-dirt-mask.png",
      inner_corner_count = 8,
      outer_corner_count = 8,
      side_count = 8,
      u_transition_count = 2,
      o_transition_count = 1
    }
  },
  {
    to_tiles = {"out-of-map","empty-space","oil-ocean-shallow"},
    transition_group = out_of_map_transition_group_id,

    background_layer_offset = 1,
    background_layer_group = "zero",
    offset_background_layer_by_tile_layer = true,

    spritesheet = "__space-age__/graphics/terrain/out-of-map-transition/volcanic-out-of-map-transition.png",
    layout = tile_spritesheet_layout.transition_4_4_8_1_1,
    overlay_enabled = false
  }
}



local nulla_deep_ocean = table.deepcopy(data.raw.tile["water"])
nulla_deep_ocean.name = "nulla-deep-ocean"
nulla_deep_ocean.order = "[nulla][nulla-deep-ocean]"
nulla_deep_ocean.subgroup = "nulla-tiles"
nulla_deep_ocean.map_color= { 49, 40, 35 }
nulla_deep_ocean.autoplace = {probability_expression = "nulla_deep_ocean"}
nulla_deep_ocean.collision_mask = tile_collision_masks.lava()
nulla_deep_ocean.effect_color = { 42, 42, 42 }
nulla_deep_ocean.fluid = "heavy-oil-solution"
nulla_deep_ocean.absorptions_per_second = tile_pollution.nulla_water


local nulla_ocean = table.deepcopy(data.raw.tile["water"])
nulla_ocean.name = "nulla-ocean"
nulla_ocean.order = "[nulla][nulla-ocean]"
nulla_ocean.subgroup = "nulla-tiles"
nulla_ocean.map_color= { 58, 49, 44 }
nulla_ocean.autoplace = {probability_expression = "nulla_ocean"}
nulla_ocean.collision_mask = tile_collision_masks.lava()
nulla_ocean.effect_color = { 51, 51, 51 }
nulla_ocean.fluid = "heavy-oil-solution"
nulla_ocean.absorptions_per_second = tile_pollution.nulla_water


data:extend
({
	nulla_deep_ocean,
	nulla_ocean,
})
table.insert(water_tile_type_names, "nulla-ocean")
table.insert(water_tile_type_names, "nulla-deep-ocean")


local nulla_biome2 = table.deepcopy(data.raw.tile["volcanic-ash-flats"])
nulla_biome2.name = "nulla-biome2"
nulla_biome2.order = "[nulla][nulla-biome2]"
nulla_biome2.subgroup = "nulla-tiles"
nulla_biome2.map_color= { 170, 170, 170 }
nulla_biome2.autoplace = {probability_expression = "nulla_biome2"}
nulla_biome2.absorptions_per_second = tile_pollution.nulla


local nulla_biome3 = table.deepcopy(data.raw.tile["volcanic-pumice-stones"])
nulla_biome3.name = "nulla-biome3"
nulla_biome3.order = "[nulla][nulla-biome3]"
nulla_biome3.subgroup = "nulla-tiles"
nulla_biome3.map_color= { 150, 150, 150 }
nulla_biome3.autoplace = {probability_expression = "nulla_biome3"}
nulla_biome3.absorptions_per_second = tile_pollution.nulla


local nulla_biome4 = table.deepcopy(data.raw.tile["volcanic-ash-light"])
nulla_biome4.name = "nulla-biome4"
nulla_biome4.order = "[nulla][nulla-biome4]"
nulla_biome4.subgroup = "nulla-tiles"
nulla_biome4.map_color= { 130, 130, 130 }
nulla_biome4.autoplace = {probability_expression = "nulla_biome4"}
nulla_biome4.absorptions_per_second = tile_pollution.nulla


local nulla_biome5 = table.deepcopy(data.raw.tile["volcanic-ash-dark"])
nulla_biome5.name = "nulla-biome5"
nulla_biome5.order = "[nulla][nulla-biome5]"
nulla_biome5.subgroup = "nulla-tiles"
nulla_biome5.map_color= { 100, 100, 100 }
nulla_biome5.autoplace = {probability_expression = "nulla_biome5"}
nulla_biome5.absorptions_per_second = tile_pollution.nulla


local nulla_biome6 = table.deepcopy(data.raw.tile["volcanic-ash-cracks"])
nulla_biome6.name = "nulla-biome6"
nulla_biome6.order = "[nulla][nulla-biome6]"
nulla_biome6.subgroup = "nulla-tiles"
nulla_biome6.map_color= { 80, 80, 80 }
nulla_biome6.autoplace = {probability_expression = "nulla_biome6"}
nulla_biome6.absorptions_per_second = tile_pollution.nulla


data:extend({
	{
		type = "tile",
		name = "nulla-biome1",
		subgroup = "nulla-tiles",
		order = "[nulla][nulla-biome1]",
		collision_mask = tile_collision_masks.meltable_tile(),
		autoplace = {probability_expression = "nulla_biome1"},
		layer = 20,
		sprite_usage_surface = "gleba",
		variants = material_background("__nulla__/graphics/terrain/ash-ice-smooth.png", 4),

		transitions = ash_ice_transitions,
		transitions_between_transitions = ash_ice_transitions_between_transitions,

		walking_sound = base_tile_sounds.walking.shallow_water,
		landing_steps_sound = tile_sounds.landing.wet,
		driving_sound = tile_sounds.driving.wetland,
	
		map_color = {118, 62, 48},
		scorch_mark_color = {r = 0.318, g = 0.222, b = 0.152, a = 1.000},
		absorptions_per_second = tile_pollution.nulla_ice,
		walking_speed_modifier = 1,
        vehicle_friction_modifier = 1,
        trigger_effect = tile_trigger_effects.dirt_2_trigger_effect()
	},
	
	nulla_biome2,
	nulla_biome3,
	nulla_biome4,
	nulla_biome5,
	nulla_biome6,
})


local function add_landfillable_stuff(landfill_name, new_surface)
  local item = data.raw.item[landfill_name]
  item.place_as_tile.tile_condition = item.place_as_tile.tile_condition or {}
  table.insert(item.place_as_tile.tile_condition, new_surface)
end
add_landfillable_stuff("ice-platform", "nulla-deep-ocean")
add_landfillable_stuff("ice-platform", "nulla-ocean")
add_landfillable_stuff("foundation", "nulla-deep-ocean")
add_landfillable_stuff("foundation", "nulla-ocean")