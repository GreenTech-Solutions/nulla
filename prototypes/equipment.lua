local sounds = require("__base__.prototypes.entity.sounds")

data:extend
({
	{
		type = "active-defense-equipment",
		name = "nulla-tesla-defense-equipment",
		sprite =
		{
		  filename = "__nulla__/graphics/equipment/nulla-tesla-defense-equipment.png",
		  width = 128,
		  height = 128,
		  priority = "medium",
		  scale = 0.5
		},
		shape =
		{
		  width = 2,
		  height = 2,
		  type = "full"
		},
		
		energy_source =
		{
		  type = "electric",
		  usage_priority = "secondary-input",
		  buffer_capacity = "2200kJ"
		},

		attack_parameters =
		{
		  type = "beam",
		  cooldown = 40,
		  range = 15,
		  range_mode = "center-to-bounding-box",
		  damage_modifier = 1,
		  ammo_category = "electric",
		  ammo_type =
		  {
			energy_consumption = "250kJ",
			action =
			{
			  type = "direct",
			  action_delivery =
			  {
				type = "beam",
				beam = "electric-beam-no-sound",
				max_length = 15,
				duration = 40,
				source_offset = {0, -0.5},
			  }
			}
		  }
		},
		
		automatic = true,
		categories = {"armor"}
	},
	{
		type = "roboport-equipment",
		name = "nulla-personal-roboport-equipment",
		take_result = "nulla-personal-roboport-equipment",
		sprite =
		{
		  filename = "__nulla__/graphics/equipment/nulla-personal-roboport-equipment.png",
		  width = 128,
		  height = 128,
		  priority = "medium",
		  scale = 0.5
		},
		shape =
		{
		  width = 2,
		  height = 2,
		  type = "full"
		},
		energy_source =
		{
		  type = "electric",
		  buffer_capacity = "35MJ",
		  input_flow_limit = "64000kW",
		  usage_priority = "secondary-input"
		},
		charging_energy = "1000kW",

		robot_limit = 50,
		construction_radius = 25,
		spawn_and_station_height = 0.4,
		spawn_and_station_shadow_height_offset = 0.5,
		charge_approach_distance = 2.6,
		robots_shrink_when_entering_and_exiting = true,

		recharging_animation =
		{
		  filename = "__base__/graphics/entity/roboport/roboport-recharging.png",
		  draw_as_glow = true,
		  priority = "high",
		  width = 37,
		  height = 35,
		  frame_count = 16,
		  scale = 1.5,
		  animation_speed = 0.5
		},
		recharging_light = {intensity = 0.2, size = 3, color = {r = 0.5, g = 0.5, b = 1.0}},
		stationing_offset = {0, -0.6},
		charging_station_shift = {0, 0.5},
		charging_station_count = 6,
		charging_station_count_affected_by_quality = true,
		charging_distance = 1.6,
		charging_threshold_distance = 5,
		categories = {"armor"}
	},
})
