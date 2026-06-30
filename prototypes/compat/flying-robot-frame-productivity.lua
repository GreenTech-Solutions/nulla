



for _, tech in pairs(data.raw.technology) do
    if tech.effects then
        for _, effect in pairs(tech.effects) do
            if effect.type == "change-recipe-productivity"
            and effect.recipe == "flying-robot-frame"
            and effect.change then

                local already_exists = false

                for _, e in pairs(tech.effects) do
                    if e.type == "change-recipe-productivity"
                    and e.recipe == "nulla-flying-robot-frame" then
                        already_exists = true
                        break
                    end
                end

                if not already_exists then
                    table.insert(tech.effects,
                    {
                        type = "change-recipe-productivity",
                        recipe = "nulla-flying-robot-frame",
                        change = effect.change
                    })

                    log("Added Nulla flying robot frame productivity to: " .. tech.name)
                end

                break
            end
        end
    end
end