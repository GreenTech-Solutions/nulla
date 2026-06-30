local nulla_utils = require("lib")
local sounds = require("__base__.prototypes.entity.sounds")
local space_age_sounds = require("__space-age__.prototypes.entity.sounds")
local stomp_sound = space_age_sounds.stomper_pentapod.big.stomp


local function teslabot_torso_graphics_set(spidertron_scale)
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
        scale = 0.4 * spidertron_scale,
        shift = util.by_pixel(0 * spidertron_scale, 0 * spidertron_scale)
      },
      {
        filename = "__base__/graphics/entity/spidertron/torso/spidertron-body-bottom-mask.png",
        width = 124,
        height = 90,
        line_length = 1,
        direction_count = 1,
        scale = 0.4 * spidertron_scale,
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
    scale = 0.4 * spidertron_scale,
    draw_as_shadow = true,
    shift = util.by_pixel(-1 * spidertron_scale, -1 * spidertron_scale)
  },
	
  animation =
  {
	layers =
	{
		{
			filename = "__space-age__/graphics/entity/lightning-rod/lightning-rod.png",
			width = 108,
			height = 352,
			shift = util.by_pixel( -2.0, -93.0 * 0.95),
			line_length = 1,
			priority = "high",
			scale = 0.65,
			repeat_count = 46,
			line_length = 1
		},
		{
		  filename = "__space-age__/graphics/entity/lightning-rod/lightning-rod-charge.png",
		  priority = "high",
		  blend_mode = "additive",
		  scale = 0.5,
		  draw_as_glow = true,
		  frame_count = 24,
		  width = 72,       -- кадр
		  height = 330,     -- кадр
		  line_length = 8,
		  shift = util.by_pixel(-1.5, -67.5),
		  run_mode = "forward-then-backward",
		  animation_speed = 0.1,
		},
	}
  },

  shadow_animation =
  {
	layers =
	{
		{
			filename = "__space-age__/graphics/entity/lightning-rod/lightning-rod-shadow.png",
			width = 768,
			height = 742,
			shift = util.by_pixel( 0.0, -9.75 * 0.95),
			line_length = 1,
			priority = "high",
			scale = 0.65,
			repeat_count = repeat_count,
			draw_as_shadow = true,
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
      scale = 0.5 * spidertron_scale,
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
		name = "teslabot-unit",
		icons =
		{
			{icon = "__base__/graphics/icons/spidertron.png"},
		},
		order = "[nulla]-[unit]-[teslabot-unit]",
		subgroup = "enemies",
		flags = {"placeable-player", "placeable-enemy", "placeable-off-grid", "breaths-air", "not-repairable"},
		max_health = 1200,
		collision_box = {{-1 * scale, -1 * scale}, {1 * scale, 1 * scale}},
		sticker_box = {{-1.5 * scale, -1.5 * scale}, {1.5 * scale, 1.5 * scale}},
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
			percent = 90
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
		graphics_set = teslabot_torso_graphics_set(scale),
		absorptions_to_join_attack = { radio_interference = 80 },
		ai_settings =
		{
			destroy_when_commands_fail = true,
			allow_try_return_to_spawner = true,
			size_in_group = 3,
			strafe_settings =
			{
				max_distance = 22,
				ideal_distance = 15,
				ideal_distance_tolerance = 2.5,
				ideal_distance_variance = 1,
				ideal_distance_importance = 0.25,
				ideal_distance_importance_variance = 0.1,
				face_target = true
			},
		},
		attack_parameters =
		{
			type = "beam",
			cooldown = 120,
			range = 20,
			range_mode = "center-to-bounding-box",
			fire_penalty = 0.9,
			source_direction_count = 64,
			source_offset = {0, 0},
			ammo_category = "tesla",
			ammo_type =
			{
				energy_consumption = "12MJ",
				action =
				{
					type = "direct",
					action_delivery =
					{
						type = "instant",
						target_effects =
						{
						  -- Chain effect must go first in case the beam kills the target
						  {
							type = "nested-result",
							action =
							{
							  type = "direct",
							  action_delivery =
							  {
								type = "chain",
								chain = "chain-tesla-turret-chain",
							  }
							}
						  },
						  {
							type = "nested-result",
							action =
							{
							  type = "direct",
							  action_delivery =
							  {
								type = "beam",
								beam = "chain-tesla-turret-beam-start",
								max_length = 40,
								duration = 30,
								add_to_shooter = false,
								destroy_with_source_or_target = false,
								source_offset = {0, -4.8}
							  }
							}
						  }
						}
					}
				}
			}
		},
		torso_rotation_speed = 0.005,
		vision_distance = 40,
		height = 1.5,
		call_for_help_radius = 40,
		
		healing_per_tick = 1200/1000/60,
		distraction_cooldown = 30,
		min_pursue_time = 10 * 60,
		max_pursue_distance = 50,
	  
		spider_engine =
		{
		  legs =
		  {
			{
			  leg = "teslabot-unit-leg-1",
			  mount_position = util.by_pixel(15 * scale, -22 * scale),
			  ground_position = {2.25 * leg_scale, -2.5 * leg_scale},
			  walking_group = 1,
			  leg_hit_the_ground_trigger = get_leg_hit_the_ground_trigger(),
			},
			{
			  leg = "teslabot-unit-leg-2",
			  mount_position = util.by_pixel(24 * scale, -3 * scale), -- среднее между -10 и 4
			  ground_position = {3 * leg_scale, 0 * leg_scale},
			  walking_group = 2,
			  leg_hit_the_ground_trigger = get_leg_hit_the_ground_trigger(),
			},
			{
			  leg = "teslabot-unit-leg-3",
			  mount_position = util.by_pixel(15 * scale, 17 * scale),
			  ground_position = {2.25 * leg_scale, 2.5 * leg_scale},
			  walking_group = 1,
			  leg_hit_the_ground_trigger = get_leg_hit_the_ground_trigger(),
			},
			{
			  leg = "teslabot-unit-leg-4",
			  mount_position = util.by_pixel(-15 * scale, -22 * scale),
			  ground_position = {-2.25 * leg_scale, -2.5 * leg_scale},
			  walking_group = 2,
			  leg_hit_the_ground_trigger = get_leg_hit_the_ground_trigger(),
			},
			{
			  leg = "teslabot-unit-leg-5",
			  mount_position = util.by_pixel(-24 * scale, -3 * scale),
			  ground_position = {-3 * leg_scale, 0 * leg_scale},
			  walking_group = 1,
			  leg_hit_the_ground_trigger = get_leg_hit_the_ground_trigger(),
			},
			{
			  leg = "teslabot-unit-leg-6",
			  mount_position = util.by_pixel(-15 * scale, 17 * scale),
			  ground_position = {-2.25 * leg_scale, 2.5 * leg_scale},
			  walking_group = 2,
			  leg_hit_the_ground_trigger = get_leg_hit_the_ground_trigger(),
			}
		  },
		},
		is_military_target = true,
	},
})


local legs = {}

for i = 1, 6 do
  local leg = make_spidertron_leg("teslabot-unit", leg_scale, leg_thickness, leg_movement_speed, i, spidertron_leg_resistances)
  nulla_utils.disable_spidertron_leg_tint(leg)
  table.insert(legs, leg)
end

data:extend(legs)