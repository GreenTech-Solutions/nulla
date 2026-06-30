local tech = data.raw.technology["factory-robot-productivity"]

local robot_items = {}

for name, item in pairs(data.raw.item) do
  if item.place_result then
    local entity = data.raw["logistic-robot"][item.place_result] or data.raw["construction-robot"][item.place_result]

    if entity then
      robot_items[name] = true
    end
  end
end

local function produces_robot(recipe)
  if recipe.results then
    for _, result in pairs(recipe.results) do
      if result.name and robot_items[result.name] then
        return true
      end
    end
  end
  return false
end

for name, recipe in pairs(data.raw.recipe) do
  if not string.find(name, "recycling") and produces_robot(recipe) then
    tech.effects[#tech.effects + 1] = {
      type = "change-recipe-productivity",
      recipe = name,
      change = 0.1
    }
  end
end