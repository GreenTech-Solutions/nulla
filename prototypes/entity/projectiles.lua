


local nulla_land_mine = table.deepcopy(data.raw["land-mine"]["land-mine"])
nulla_land_mine.name = "nulla-land-mine"
nulla_land_mine.hidden_in_factoriopedia = true
nulla_land_mine.max_health = 5
nulla_land_mine.created_effect =
{
    type = "direct",
    action_delivery =
    {
		type = "delayed",
        delayed_trigger = "nulla-land-mine-delay"
    }
}

data:extend
{
	nulla_land_mine,
	
	{
		type = "delayed-active-trigger",
		name = "nulla-land-mine-delay",
		delay = 10*60*60, -- 10 min
		action =
		{
		  {
			type = "direct",
			action_delivery =
			{
			  type = "instant",
			  source_effects =
			  {
				{
				  type = "damage",
				  damage = {amount = 10, type = "explosion"}
				},
			  }
			}
		  }
		}
	},
  
	{
		type = "projectile",
		name = "nulla-mine-projectile",
		flags = {"not-on-map"},
		hidden = true,
		acceleration = 0.005,
		action =
		{
		  {
			type = "direct",
			action_delivery =
			{
			  type = "instant",
			  target_effects =
			  {
				{
					type = "create-entity",
					entity_name = "lamp-explosion"
				},
				{
					type = "create-entity",
					entity_name = "small-scorchmark-tintable",
					check_buildability = true
				}
			  }
			}
		  },
		  {
			type = "cluster",
			probability = 1,
			cluster_count = 2,
			distance = 4,
			distance_deviation = 3,
			action_delivery =
			{
			  type = "projectile",
			  projectile = "nulla-mine-fragment",
			  direction_deviation = 0.6,
			  starting_speed = 0.25,
			  starting_speed_deviation = 0.3
			}
		  },
		  {
			type = "cluster",
			probability = 0.5,
			cluster_count = 2,
			distance = 5,
			distance_deviation = 3,
			action_delivery =
			{
			  type = "projectile",
			  projectile = "nulla-mine-fragment",
			  direction_deviation = 0.6,
			  starting_speed = 0.25,
			  starting_speed_deviation = 0.3
			}
		  },
		  {
			type = "cluster",
			probability = 0.25,
			cluster_count = 2,
			distance = 6,
			distance_deviation = 3,
			action_delivery =
			{
			  type = "projectile",
			  projectile = "nulla-mine-fragment",
			  direction_deviation = 0.6,
			  starting_speed = 0.25,
			  starting_speed_deviation = 0.3
			}
		  }
		},
		animation =
		{
		  filename = "__base__/graphics/entity/cluster-grenade/cluster-grenade.png",
		  draw_as_glow = true,
		  frame_count = 15,
		  line_length = 8,
		  animation_speed = 0.250,
		  width = 48,
		  height = 54,
		  shift = util.by_pixel(0.5, 0.5),
		  priority = "high",
		  scale = 0.5
		},
		shadow =
		{
		  filename = "__base__/graphics/entity/grenade/grenade-shadow.png",
		  frame_count = 15,
		  line_length = 8,
		  animation_speed = 0.250,
		  width = 50,
		  height = 40,
		  shift = util.by_pixel(2, 6),
		  priority = "high",
		  draw_as_shadow = true,
		  scale = 0.5
		},
		smoke = capsule_smoke
	},
	{
	  type = "projectile",
	  name = "nulla-mine-fragment",
	  hidden_in_factoriopedia = true,
	  flags = {"not-on-map"},
	  acceleration = 0.0001,
	  action =
	  {
		{
		  type = "direct",
		  action_delivery =
		  {
			type = "instant",
			target_effects =
			{
			  {
				type = "create-entity",
				entity_name = "nulla-land-mine",
				check_buildability = true
			  },
			  {
				type = "invoke-tile-trigger",
				repeat_count = 1
			  }
			}
		  }
		}
	  }
	},
}