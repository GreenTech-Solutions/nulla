local asteroid_util = require("__space-age__/prototypes/planet/asteroid-spawn-definitions")


data:extend
{
	{
		type = "space-connection",
		name = "aquilo-nulla",
		subgroup = "planet-connections",
		from = "aquilo",
		to = "nulla",
		order = "g[aquilo-nulla]",
		length = 1000,
		asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.aquilo_nulla)
	},
}