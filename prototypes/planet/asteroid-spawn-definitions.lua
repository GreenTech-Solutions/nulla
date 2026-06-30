local asteroid_functions = require("__space-age__/prototypes/planet/asteroid-spawn-definitions")


asteroid_functions.nulla_ratio = {5, 2, 16, 0}

asteroid_functions.nulla_chunks      = 0.0010
asteroid_functions.nulla_big         = 0.0025

asteroid_functions.aquilo_nulla =
{
  probability_on_range_chunk =
  {
    {position = 0.1, probability = asteroid_functions.aquilo_chunks, angle_when_stopped = asteroid_functions.chunk_angle},
    {position = 0.9, probability = asteroid_functions.nulla_chunks, angle_when_stopped = asteroid_functions.chunk_angle}
  },
  probability_on_range_medium =
  {
    {position = 0.1, probability = asteroid_functions.fulgora_medium, angle_when_stopped = asteroid_functions.medium_angle},
    {position = 0.9, probability = 0, angle_when_stopped = asteroid_functions.medium_angle}
  },
  probability_on_range_big =
  {
    {position = 0.1, probability = 0, angle_when_stopped = asteroid_functions.big_angle},
    {position = 0.9, probability = asteroid_functions.nulla_big, angle_when_stopped = asteroid_functions.big_angle}
  },
  type_ratios =
  {
    {position = 0.1, ratios = asteroid_functions.aquilo_ratio},
    {position = 0.4, ratios = asteroid_functions.nulla_ratio},
    {position = 0.9, ratios = asteroid_functions.nulla_ratio}
  }
  
}