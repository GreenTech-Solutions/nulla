local util = require("util")
local nulla_utils = require("lib")



if mods["apia"] then 
	nulla_utils.add_tech_effect("combat-robot-productivity", { type = "change-recipe-productivity", recipe = "flamethrower-capsule", change = 0.1 }) 
end