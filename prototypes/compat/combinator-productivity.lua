local tech = data.raw.technology["combinator-productivity"]

if tech then
    local combinator_items = {}

    local combinator_types =
    {
        "arithmetic-combinator",
        "constant-combinator",
        "decider-combinator",
        "selector-combinator"
    }

    for item_name, item in pairs(data.raw.item) do
        if item.place_result then
            for _, entity_type in pairs(combinator_types) do
                local entity_table = data.raw[entity_type]

                if entity_table and entity_table[item.place_result] then
                    combinator_items[item_name] = true
                    break
                end
            end
        end
    end

    local function produces_combinator(recipe)
        local results = recipe.results

        if not results and recipe.result then
            results =
            {{
                name = recipe.result
            }}
        end

        if results then
            for _, result in pairs(results) do
                local name = result.name or result[1]

                if name and combinator_items[name] then
                    return true
                end
            end
        end

        return false
    end

    for recipe_name, recipe in pairs(data.raw.recipe) do
        if not string.find(recipe_name, "recycling")
        and produces_combinator(recipe) then

            tech.effects[#tech.effects+1] =
            {
                type = "change-recipe-productivity",
                recipe = recipe_name,
                change = 0.1
            }
        end
    end
end