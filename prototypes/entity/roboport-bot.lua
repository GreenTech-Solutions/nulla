local nulla_utils = require("lib")
local sounds = require("__base__.prototypes.entity.sounds")



local function roboportbot_torso_graphics_set(spidertron_scale)
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
        scale = 0.5 * spidertron_scale,
        shift = util.by_pixel(0 * spidertron_scale, 0 * spidertron_scale)
      },
      {
        filename = "__base__/graphics/entity/spidertron/torso/spidertron-body-bottom-mask.png",
        width = 124,
        height = 90,
        line_length = 1,
        direction_count = 1,
        scale = 0.5 * spidertron_scale,
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
    scale = 0.5 * spidertron_scale,
    draw_as_shadow = true,
    shift = util.by_pixel(-1 * spidertron_scale, -1 * spidertron_scale)
  },
  
  animation =
  {
	layers =
	{
		util.sprite_load("__space-age__/graphics/entity/capture-robot-rocket/capture-robot",
        {
          direction_count = 32,
          scale = 0.5,
          priority = "high",
		  shift = util.by_pixel(0, 40 * spidertron_scale)
        }),
        util.sprite_load("__space-age__/graphics/entity/capture-robot-rocket/capture-robot-mask",
        {
          direction_count = 32,
          scale = 0.5,
          priority = "high",
		  shift = util.by_pixel(0, 40 * spidertron_scale)
        }),
	}
  },
  
  shadow_animation =
  {
	layers =
	{
		util.sprite_load("__space-age__/graphics/entity/capture-robot-rocket/capture-robot-shadow",
        {
          direction_count = 32,
          scale = 0.5,
          priority = "high",
          draw_as_shadow = true,
		  shift = util.by_pixel(-20 * spidertron_scale, 0)
        }),
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
		name = "roboportbot-unit",
		icons =
		{
			{icon = "__base__/graphics/icons/spidertron.png"},
		},
		order = "[nulla]-[unit]-[roboportbot-unit]",
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
			decrease = 15,
			percent = 60
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
		graphics_set = roboportbot_torso_graphics_set(scale),
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
			type = "projectile",
			activation_type = "throw",
			ammo_category = "capsule",
			cooldown = 60*2,
			projectile_creation_distance = 0.6,
			source_offset = {0, -30},
			range = 31,
			ammo_type =
			{
			  target_type = "position",
			  action =
			  {
				{
				  type = "direct",
				  action_delivery =
				  {
					type = "projectile",
					projectile = "defender-capsule",
					starting_speed = 0.3,
					max_range = 31 * 2
				  }
				},
				{
				  type = "direct",
				  action_delivery =
				  {
					type = "instant",
					target_effects =
					{
					  {
						type = "play-sound",
						sound = sounds.throw_projectile
					  }
					}
				  }
				}
			  }
			},
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
				leg = "roboportbot-unit-leg-1",
				mount_position = util.by_pixel(0 * scale, -18 * scale),
				ground_position = {0 * leg_scale, -5 * leg_scale},
				walking_group = 1,
				leg_hit_the_ground_trigger = get_leg_hit_the_ground_trigger(),
			  },
			  { -- передняя правая
				leg = "roboportbot-unit-leg-2",
				mount_position = util.by_pixel(16 * scale, -6 * scale),
				ground_position = {3 * leg_scale, -2 * leg_scale},
				walking_group = 2,
				leg_hit_the_ground_trigger = get_leg_hit_the_ground_trigger(),
			  },
			  { -- передняя левая
				leg = "roboportbot-unit-leg-3",
				mount_position = util.by_pixel(-16 * scale, -6 * scale),
				ground_position = {-3 * leg_scale, -2 * leg_scale},
				walking_group = 3,
				leg_hit_the_ground_trigger = get_leg_hit_the_ground_trigger(),
			  },
			  { -- задняя правая
				leg = "roboportbot-unit-leg-4",
				mount_position = util.by_pixel(18 * scale, 14 * scale),
				ground_position = {3 * leg_scale, 3 * leg_scale},
				walking_group = 3,
				leg_hit_the_ground_trigger = get_leg_hit_the_ground_trigger(),
			  },
			  { -- задняя левая
				leg = "roboportbot-unit-leg-5",
				mount_position = util.by_pixel(-18 * scale, 14 * scale),
				ground_position = {-3 * leg_scale, 3 * leg_scale},
				walking_group = 2,
				leg_hit_the_ground_trigger = get_leg_hit_the_ground_trigger(),
			  }
			}
		},
		is_military_target = true,
	},
})


local legs = {}

for i = 1, 5 do
  local leg = make_spidertron_leg("roboportbot-unit", leg_scale, leg_thickness, leg_movement_speed, i, spidertron_leg_resistances)
  nulla_utils.disable_spidertron_leg_tint(leg)
  table.insert(legs, leg)
end

data:extend(legs)