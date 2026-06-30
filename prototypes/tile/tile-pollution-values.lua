local base_tile_pollution_values = require("__base__/prototypes/tile/tile-pollution-values")
local nulla_tile_pollution_values =
{
  nulla =       { radio_interference    = 0.000010 },
  nulla_water = { radio_interference    = 0.000030 },
  nulla_ice =   { radio_interference = 0.000005 }
}
return util.merge{base_tile_pollution_values, nulla_tile_pollution_values}
