local nulla_utils = require("lib")
local sounds = require("__base__.prototypes.entity.sounds")
local math3d = require("math3d")
require("__base__/prototypes/entity/fire")
local fireutil = require("__base__/prototypes/fire-util")


local turret_gun_shift =
{
  north = util.by_pixel(0.0, -6.0 -25),
  east = util.by_pixel(18.5, 9.5 -25),
  south = util.by_pixel(0.0, 19.0 -25),
  west = util.by_pixel(-12.0, 5.5 -25)
}

local function flamethrowerbot_torso_graphics_set(spidertron_scale)
return
  {
  base_animation =
  {
    layers =
    {
      {
        filename = "__base__/graphics/entity/spidertron/torso/spidertron-body-bottom.png",
        width = 126,
        height = 106,
        line_length = 1,
        direction_count = 1,
        scale = 0.2 * spidertron_scale,
        shift = util.by_pixel(0 * spidertron_scale, 0 * spidertron_scale)
      },
      {
        filename = "__base__/graphics/entity/spidertron/torso/spidertron-body-bottom-mask.png",
        width = 124,
        height = 90,
        line_length = 1,
        direction_count = 1,
        scale = 0.2 * spidertron_scale,
		tint = {0,0,0,1},
        --apply_runtime_tint = true,
        shift = util.by_pixel(0 * spidertron_scale, 3.5 * spidertron_scale)
      }
    }
  },

  shadow_base_animation =
  {
    filename = "__base__/graphics/entity/spidertron/torso/spidertron-body-bottom-shadow.png",
    width = 144,
    height = 96,
    line_length = 1,
    direction_count = 1,
    scale = 0.2 * spidertron_scale,
    draw_as_shadow = true,
    shift = util.by_pixel(-1 * spidertron_scale, -1 * spidertron_scale)
  },
  
  animation =
  {
	layers =
	{
		{
			filename = "__base__/graphics/entity/flamethrower-turret/flamethrower-turret-gun.png",
			priority = "medium",
			counterclockwise = true,
			line_length = 8,
			width = 158,
			height = 128,
			direction_count = 64,
			shift = util.by_pixel(-1, -25 +10),
			scale = 0.5
		},
		{
			filename = "__base__/graphics/entity/flamethrower-turret/flamethrower-turret-gun-active.png",
			counterclockwise = true,
			line_length = 8,
			width = 158,
			height = 126,
			direction_count = 64,
			shift = util.by_pixel(-1, -25 +10),
			tint = util.premul_color{1, 1, 1, 0.5},
			blend_mode = "additive",
			scale = 0.5
		},
		{
			filename = "__base__/graphics/entity/flamethrower-turret/flamethrower-turret-gun-mask.png",
			flags = { "mask" },
			counterclockwise = true,
			line_length = 8,
			width = 144,
			height = 112,
			direction_count = 64,
			shift = util.by_pixel(-1, -28 +10),
			apply_runtime_tint = false,
			scale = 0.5
		},
	}
  },
  
  shadow_animation =
  {
	layers =
	{
		{
			filename = "__base__/graphics/entity/flamethrower-turret/flamethrower-turret-gun-shadow.png",
			counterclockwise = true,
			line_length = 8,
			width = 182,
			height = 116,
			direction_count = 64,
			shift = util.by_pixel(31, -1),
			draw_as_shadow = true,
			scale = 0.5
		}
	}
  },
  
  water_reflection =
  {
    pictures =
    {
      filename = "__base__/graphics/entity/spidertron/torso/spidertron-body-water-reflection.png",
      width = 448,
      height = 448,
      variation_count = 1,
      scale = 1 * spidertron_scale,
      shift = util.by_pixel(0 * spidertron_scale, 0 * spidertron_scale)
    }
  },
}
end

local scale = 1
local leg_scale = scale * 1
local body_height = 1.5 * scale * leg_scale
local leg_thickness = 1
local leg_movement_speed = 1
				  
data:extend
({
	{
		type = "spider-unit",
		name = "flamethrowerbot-unit",
		icons =
		{
			{icon = "__base__/graphics/icons/spidertron.png"},
		},
		order = "[nulla]-[unit]-[flamethrowerbot-unit]",
		subgroup = "enemies",
		flags = {"placeable-player", "placeable-enemy", "placeable-off-grid", "breaths-air", "not-repairable"},
		max_health = 2000,
		collision_box = {{-1 * scale, -1 * scale}, {1 * scale, 1 * scale}},
		sticker_box = {{-1.25 * scale, -1.25 * scale}, {1.25 * scale, 1.25 * scale}},
		selection_box = {{-1 * scale, -1 * scale}, {1 * scale, 1 * scale}},
		dying_explosion = "spidertron-explosion",
		resistances =
		{
		  {
			type = "fire",
			decrease = 0,
			percent = 90
		  },
		  {
			type = "physical",
			decrease = 15,
			percent = 60
		  },
		  {
			type = "impact",
			decrease = 50,
			percent = 80
		  },
		  {
			type = "explosion",
			decrease = 20,
			percent = 75
		  },
		  {
			type = "acid",
			decrease = 0,
			percent = 70
		  },
		  {
			type = "laser",
			decrease = 0,
			percent = 70
		  },
		  {
			type = "electric",
			decrease = 0,
			percent = 70
		  }
		},
		working_sound =
		{
		  sound = { filename = "__base__/sound/spidertron/spidertron-vox.ogg", volume = 0.35 },
		  activate_sound = { filename = "__base__/sound/spidertron/spidertron-activate.ogg", volume = 0.5 },
		  deactivate_sound = { filename = "__base__/sound/spidertron/spidertron-deactivate.ogg", volume = 0.5 },
		  match_speed_to_activity = true,
		  activity_to_speed_modifiers =
		  {
			multiplier = 6.0,
			minimum = 1.0,
			offset = 0.93333333333
		  }
		},
		graphics_set = flamethrowerbot_torso_graphics_set(scale),
		absorptions_to_join_attack = { radio_interference = 150 },
		ai_settings =
		{
			destroy_when_commands_fail = true,
			allow_try_return_to_spawner = true,
			size_in_group = 4,
			strafe_settings =
			{
				max_distance = 36,
				ideal_distance = 26,
				ideal_distance_tolerance = 2.5,
				ideal_distance_variance = 1,
				ideal_distance_importance = 0.25,
				ideal_distance_importance_variance = 0.1,
				face_target = true
			},
		},
		attack_parameters =
		{
		  type = "stream",
		  cooldown = 3,
		  range = 30,
		  min_range = 8,
	
		  turn_range = 1.0 / 3.0,
		  fire_penalty = 15,

		  ammo_category = "flamethrower",
		  ammo_type =
		  {
			action =
			{
			  type = "direct",
			  action_delivery =
			  {
				type = "stream",
				stream = "flamethrower-fire-stream",
				source_offset = {0.15, -0.5},
			  }
			}
		  },
		  
		  gun_center_shift =
		  {
			north = math3d.vector2.add(fireutil.gun_center_base, turret_gun_shift.north),
			east = math3d.vector2.add(fireutil.gun_center_base, turret_gun_shift.east),
			south = math3d.vector2.add(fireutil.gun_center_base, turret_gun_shift.south),
			west = math3d.vector2.add(fireutil.gun_center_base, turret_gun_shift.west)
		  },
		  gun_barrel_length = 0.4,

		  cyclic_sound =
		  {
			begin_sound = sound_variations("__base__/sound/fight/flamethrower-turret-start", 3, 0.5),
			middle_sound = sound_variations("__base__/sound/fight/flamethrower-turret-mid", 3, 0.5),
			end_sound = sound_variations("__base__/sound/fight/flamethrower-turret-end", 3, 0.5)
		  }
		},
		
		torso_rotation_speed = 0.005,
		vision_distance = 40,
		height = 1.5,
		call_for_help_radius = 40,
		
		healing_per_tick = 2000/1000/60,
		distraction_cooldown = 30,
		min_pursue_time = 10 * 60,
		max_pursue_distance = 50,
	  
		spider_engine =
		{
			legs =
			{
			  { -- передняя центральная нога
				leg = "flamethrowerbot-unit-leg-1",
				mount_position = util.by_pixel(0 * scale, -6.8 * scale),
				ground_position = {0 * leg_scale, -4 * leg_scale},
				walking_group = 1,
				leg_hit_the_ground_trigger = get_leg_hit_the_ground_trigger()
			  },
			  { -- задняя правая нога
				leg = "flamethrowerbot-unit-leg-2",
				mount_position = util.by_pixel(7.2 * scale, 5.6 * scale),
				ground_position = {3 * leg_scale, 3 * leg_scale},
				walking_group = 2,
				leg_hit_the_ground_trigger = get_leg_hit_the_ground_trigger()
			  },
			  { -- задняя левая нога
				leg = "flamethrowerbot-unit-leg-3",
				mount_position = util.by_pixel(-7.2 * scale, 5.6 * scale),
				ground_position = {-3 * leg_scale, 3 * leg_scale},
				walking_group = 3,
				leg_hit_the_ground_trigger = get_leg_hit_the_ground_trigger()
			  }
			}
		},
		is_military_target = true,
	},
})


local legs = {}

for i = 1, 3 do
  local leg = make_spidertron_leg("flamethrowerbot-unit", leg_scale, leg_thickness, leg_movement_speed, i, spidertron_leg_resistances)
  nulla_utils.disable_spidertron_leg_tint(leg)
  table.insert(legs, leg)
end

data:extend(legs)