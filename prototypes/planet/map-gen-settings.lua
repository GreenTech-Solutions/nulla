local planet_map_gen = require("__space-age__/prototypes/planet/planet-map-gen")



planet_map_gen.nulla = function()
  return
  {
    property_expression_names =
    {
      elevation = "nulla_elevation",
      temperature = "nulla_temperature",
      moisture = "nulla_moisture",
      aux = "nulla_aux",
      cliffiness = "cliffiness_basic",
      cliff_elevation = "cliff_elevation_from_elevation",
	  ["entity:nulla-scrap:probability"] = "nulla_scrap_probability",
      ["entity:nulla-scrap:richness"] = "nulla_scrap_richness",
	  enemy_base_radius = "nulla_enemy_base_radius",
      enemy_base_frequency = "nulla_enemy_base_frequency",
    },
    cliff_settings =
    {
      name = "cliff-vulcanus",
      cliff_elevation_interval = 10,
      cliff_elevation_0 = 5
    },
    autoplace_controls =
	{
		["nulla_remnants"] = {},
		["nulla_nuclear_waste"] = {},
		["nulla_scrap"] = {},
		["nulla_enemy_base"] = {},
	},
    autoplace_settings =
    {
      ["tile"] =
      {
        settings =
        {
			["nulla-biome1"] = {},
			["nulla-biome2"] = {},
			["nulla-biome3"] = {},
			["nulla-biome4"] = {},
			["nulla-biome5"] = {},
			["nulla-biome6"] = {},
			["nulla-ocean"] = {},
			["nulla-deep-ocean"] = {},
        }
      },
      ["decorative"] =
      {
        settings =
        {
			["nulla-crater-small"] = {},
			["nulla-crater-large"] = {},
			["nulla-dune-decal"] = {},
        }
      },
      ["entity"] =
      {
        settings =
        {
			["nulla-nuclear-crater"] = {},
			--["depleted-uranium-fuel-cell"] = {},
			["crater-cliff"] = {},
			["nulla-chimney-truncated"] = {},
			["nulla-chimney-short"] = {},
			["nulla-huge-rock"] = {},
			["nulla-big-rock"] = {},
			["nulla-scrap"] = {},
			["nulla-medium-remnants"] = {},
			["nulla-small-remnants"] = {},
			["nulla-cargo-pod"] = {},
        }
      }
    }
  }
end