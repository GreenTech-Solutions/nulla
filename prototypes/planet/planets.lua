require("__space-age__/prototypes/planet/planet-vulcanus-map-gen")
local planet_map_gen = require("__space-age__/prototypes/planet/planet-map-gen")
local asteroid_functions = require("__space-age__/prototypes/planet/asteroid-spawn-definitions")
local effects = require("__core__.lualib.surface-render-parameter-effects")
local planet_catalogue_aquilo = require("__space-age__.prototypes.planet.procession-catalogue-aquilo")
local planet_map_gen = require("__base__/prototypes/planet/planet-map-gen")
local planet_lib = require("__PlanetsLib__.lib.planet")


PlanetsLib:extend
{
	{
		type = "planet",
		name = "nulla",
		icon = "__nulla__/graphics/icons/space/nulla.png",
		starmap_icon = "__nulla__/graphics/icons/space/starmap-planet-nulla.png",
		map_gen_settings = planet_map_gen.nulla(),
		starmap_icon_size = 512,
		gravity_pull = 10,
		magnitude = 0.75,
		label_orientation = 0.25,
		order = "e[aquilo]-z[nulla]",
		subgroup = "satellites",
		draw_orbit = false,
		orbit =
		{
			parent =
			{
				type = "planet",
				name = "aquilo",
			},
			distance = 2,
			orientation = 0.35,
			sprite =
			{
				type = "sprite",
				filename = "__nulla__/graphics/icons/space/aquilo-orbit.png",
				size = 380,
				scale = 0.35,
			},
			is_satellite = true,
		},
		--entities_require_heating = true,
		pollutant_type = "radio_interference",
		solar_power_in_space = 60,
		surface_properties =
		{
			["day-night-cycle"] = 30 * minute,
			["magnetic-field"] = 25,
			["solar-power"] = 1,
			["pressure"] = 3250,
			["gravity"] = 32.5
		},
		platform_procession_set =
		{
		  arrival = {"planet-to-platform-b", "platform-to-platform-b"},
		  departure = {"platform-to-planet-a", "platform-to-platform-a"}
		},
		planet_procession_set =
		{
		  arrival = {"platform-to-planet-b"},
		  departure = {"planet-to-platform-a"}
		},
		procession_graphic_catalogue = planet_catalogue_aquilo, 
		asteroid_spawn_influence = 1,
		asteroid_spawn_definitions = asteroid_functions.spawn_definitions(asteroid_functions.aquilo_nulla, 0.9),
		persistent_ambient_sounds =
		{
		  base_ambience = {filename = "__space-age__/sound/wind/base-wind-vulcanus.ogg", volume = 0.8},
		  wind = {filename = "__space-age__/sound/wind/wind-vulcanus.ogg", volume = 0.8},
		  crossfade =
		  {
			order = {"wind", "base_ambience"},
			curve_type = "cosine",
			from = {control = 0.35, volume_percentage = 0.0},
			to = {control = 2, volume_percentage = 100.0}
		  },
		  semi_persistent =
		  {
			{
			  sound = {variations = sound_variations("__space-age__/sound/world/semi-persistent/distant-rumble", 3, 0.5)},
			  delay_mean_seconds = 10,
			  delay_variance_seconds = 5
			},
			{
			  sound = {variations = sound_variations("__space-age__/sound/world/semi-persistent/distant-flames", 5, 0.6)},
			  delay_mean_seconds = 15,
			  delay_variance_seconds = 7.0
			}
		  }
		},
		surface_render_parameters =
		{
			fog = 
			{
				shape_noise_texture =
				{
					filename = "__core__/graphics/clouds-noise.png",
					size = 2048
				},
				detail_noise_texture =
				{
					filename = "__core__/graphics/clouds-detail-noise.png",
					size = 2048
				},
				color1 = {0.5961, 0.3176, 0.0941},
				color2 = {0.5961, 0.3255, 0.0902},
				tick_factor = 0.000005,
			},
		  -- clouds = effects.default_clouds_effect_properties(),

		  -- Should be based on the default day/night times, ie
		  -- sun starts to set at 0.25
		  -- sun fully set at 0.45
		  -- sun starts to rise at 0.55
		  -- sun fully risen at 0.75
		  day_night_cycle_color_lookup =
		  {
			{0.0, "__space-age__/graphics/lut/vulcanus-1-day.png"},
			{0.20, "__space-age__/graphics/lut/vulcanus-1-day.png"},
			{0.45, "__space-age__/graphics/lut/vulcanus-2-night.png"},
			{0.55, "__space-age__/graphics/lut/vulcanus-2-night.png"},
			{0.80, "__space-age__/graphics/lut/vulcanus-1-day.png"},
		  },

		  terrain_tint_effect =
		  {
			noise_texture =
			{
			  filename = "__space-age__/graphics/terrain/vulcanus/tint-noise.png",
			  size = 4096
			},

			offset = { 0.2, 0, 0.4, 0.8 },
			intensity = { 0.5, 0.2, 0.3, 1.0 },
			scale_u = { 3, 1, 1, 1 },
			scale_v = { 1, 1, 1, 1 },

			global_intensity = 0.3,
			global_scale = 0.1,
			zoom_factor = 3,
			zoom_intensity = 0.6
		  }
		},
		platform_surface_render_parameters =
		{
			platform_backdrop =
			{
			  emission_scales_with_shadow = false,
			  radius = data.raw.planet["nauvis"].platform_surface_render_parameters.platform_backdrop.radius * 0.7,
			  rotation_seconds = data.raw.planet["nauvis"].platform_surface_render_parameters.platform_backdrop.rotation_seconds / 0.6,
			  light_radius = data.raw.planet["nauvis"].platform_surface_render_parameters.platform_backdrop.light_radius * 0.75,
			  cloudiness = 0.5,
			  surface_vertical_offset = 0.1,
			  cloud_vertical_offset = 0.05,
			  specular_intensity = 0,
			  specular_color = {0.62, 0.435, 0.498, 1.0},
			  atmosphere_color = {0.072, 0.073, 0.067, 0.1},
			  cloud_flow_intensity = 0.8,
			  cloud_panning_rate = -0.01,
			  planet_axis = {-37.0, 18.0},
			  planet_axis_deviation_amplitude = {10.0, 10.0},
			  planet_axis_deviation_seconds = {890.5/0.6, 753.7/0.6},
			  position = {-400, 270},
			  parallax_strength = {0.95, 0.95},
			  light_direction = {-0.42, 0.23, 0.67},
			  light_intensity_contrast = 0.3,
			  light_radius = 13.9,
			  planet_surface =
			  {
				filename = "__nulla__/graphics/icons/space/nulla-surface.png",
				width = 1774,
				height = 887
			  },
			  planet_normal = nil,
			  planet_reflectivity =
			  {
				filename = "__nulla__/graphics/icons/space/nulla-reflectivity.png",
				width = 1774,
				height = 887
			  },
			  global_cloud =
			  {
				filename = "__nulla__/graphics/icons/space/nulla-cloud.png",
				width = 2048,
				height = 1024
			  },
			  global_cloud_normal =
			  {
				filename = "__space-age__/graphics/space/vulcanus-cloud-normal.png",
				width = 2048,
				height = 1024
			  },
			  global_cloud_flow =
			  {
				filename = "__space-age__/graphics/space/vulcanus-cloud-flow.png",
				width = 2048,
				height = 1024
			  }
			}
		},
	},
}