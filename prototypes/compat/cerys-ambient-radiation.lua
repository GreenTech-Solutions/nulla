



local planet = data.raw.planet["nulla"]

if planet then
    planet.surface_properties = planet.surface_properties or {}

    if not (mods["Cerys-Moon-of-Fulgora"] and data.raw["surface-property"]["cerys-ambient-radiation"]) then

        data:extend
		({
            {
                type = "surface-property",
                name = "nulla-ambient-radiation",
                default_value = 10
            }
        })

        planet.surface_properties["nulla-ambient-radiation"] = 320

        if data.raw["assembling-machine"]["cryogenic-plant"] then
            PlanetsLib.restrict_surface_conditions(
                data.raw["assembling-machine"]["cryogenic-plant"],
                {
                    property = "nulla-ambient-radiation",
                    max = 300
                }
            )
        end

    else
        planet.surface_properties["cerys-ambient-radiation"] = 320
    end
end