local util = require("util")
local nulla_utils = {}


function nulla_utils.surface_conditions(planet)
	local surface_conditions
	if planet == "nulla" then
		surface_conditions = 
		{
			{
				property = "pressure",
				min = 3250,
				max = 3250
			},
			{
				property = "gravity",
				min = 32.5,
				max = 32.5
			}
		}
		return surface_conditions
	end
end


local function remove_runtime_tint(tbl)
  if type(tbl) ~= "table" then return end

  if tbl.apply_runtime_tint then
    tbl.apply_runtime_tint = false
  end

  for _, v in pairs(tbl) do
    if type(v) == "table" then
      remove_runtime_tint(v)
    end
  end
end

function nulla_utils.disable_spidertron_leg_tint(leg)
  remove_runtime_tint(leg.graphics_set)
end




function nulla_utils.add_radio_interference(proto, value)
	proto.emissions_per_second = proto.emissions_per_second or {}
    if proto.emissions_per_second.radio_interference then
        table.insert(proto.emissions_per_second, { radio_interference = value })
    else
        proto.emissions_per_second = { radio_interference = value }
    end
end


function nulla_utils.add_radio_interference_to_type(proto_type, value)
  local group = data.raw[proto_type]
  if not group then return end

  for _, proto in pairs(group) do
    nulla_utils.add_radio_interference(proto, value)
  end
end


function nulla_utils.add_radio_interference_energy(proto, value)
	if proto.energy_source then
		local es = proto.energy_source
		es.emissions_per_minute = es.emissions_per_minute or {}
		es.emissions_per_minute.radio_interference = value
	end
end


function nulla_utils.add_radio_interference_energy_to_type(proto_type, value)
  local group = data.raw[proto_type]
  if not group then return end

  for _, proto in pairs(group) do
    nulla_utils.add_radio_interference_energy(proto, value)
  end
end


function nulla_utils.add_tech_prerequisites(tech_name, prerequisites)
  local tech = data.raw.technology[tech_name]
  tech.prerequisites = tech.prerequisites or {}
  for _, prereq in ipairs(tech.prerequisites) do
    if prereq == prerequisites then
      return
    end
  end
  table.insert(tech.prerequisites, prerequisites)
end


function nulla_utils.add_science_pack(tech_name, science_pack)
  local tech = data.raw.technology[tech_name]
  -- If `tech.unit` doesn't exist then it is a trigger tech rather than a science tech, cannot modify it in this way
  if tech.unit then
    tech.unit.ingredients = tech.unit.ingredients or {}
    table.insert(tech.unit.ingredients, science_pack)
  else
    log("Nulla: Unable to add science to tech `" .. tech_name .. "` due to it being a trigger technology, skipped.")
  end
end

function nulla_utils.add_tech_effect(tech_name, effect)
  local tech = data.raw.technology[tech_name]
  tech.effects = tech.effects or {}
  table.insert(tech.effects, effect)
end

function nulla_utils.add_ingredient_to_recipe(recipe_name, ingredient)
  local recipe = data.raw.recipe[recipe_name]
  if not recipe or not recipe.ingredients then
    return
  end

  local new_name = ingredient.name or ingredient[1]

  for _, ing in pairs(recipe.ingredients) do
    local name = ing.name or ing[1]
    if name == new_name then
      return
    end
  end

  table.insert(recipe.ingredients, ingredient)
end


return nulla_utils