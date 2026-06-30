local nulla_surface = "nulla"


local function is_valid_inserter(entity)
	if not (entity and entity.valid) then
		return false
	end
	
	if entity.type ~= "inserter" then
		return false
	end
	
	if entity.surface.name ~= nulla_surface then
		return false
	end

	local proto = entity.prototype
	if proto.fluid_energy_source_prototype ~= nil then 
		return false
	end

	return true
end


local function disable_inserter(entity)
	if not is_valid_inserter(entity) then return end

	entity.disabled_by_script = true

	rendering.draw_sprite
	{
		sprite = "nulla-disabled-icon",
		target = entity,
		surface = entity.surface,
		x_scale = 0.5,
		y_scale = 0.5,
		render_layer = "entity-info-icon-above",
		only_in_alt_mode = false
	}

end


local build_events =
{
	defines.events.on_built_entity,
	defines.events.on_robot_built_entity,
	defines.events.script_raised_built,
	defines.events.script_raised_revive
}

script.on_event(build_events, function(event)
	local entity = event.created_entity or event.entity
	disable_inserter(entity)
end)


script.on_init(function()
	for _, surface in pairs(game.surfaces) do
		if surface.name == nulla_surface then
			for _, entity in pairs(surface.find_entities_filtered{type = "inserter"}) do
				disable_inserter(entity)
			end
		end
	end
end)





local function generate_nuclear_waste(surface, area)

    local craters = surface.find_entities_filtered
	{
        area = area,
        name = "nulla-nuclear-crater"
    }

    local config = 
	{
        rx = 4.5,
        ry = 3.0,
        min_richness = 100,
        max_richness = 5000,
        power = 1.75
    }

    local richness_mult = 1

    if surface.map_gen_settings then
        local control = surface.map_gen_settings.autoplace_controls

        if control
        and control["nulla_nuclear_waste"]
        and control["nulla_nuclear_waste"].richness then
            richness_mult = control["nulla_nuclear_waste"].richness
        end
    end

    for _, crater in pairs(craters) do

        local cx = math.floor(crater.position.x)
        local cy = math.floor(crater.position.y)

        local center_x = cx + 0.5
        local center_y = cy + 0.5

        for dx = -5,4 do
            for dy = -3,3 do

                local px = cx + dx
                local py = cy + dy

                local ox = px - center_x
                local oy = py - center_y

                local d =
                    (ox * ox)/(config.rx * config.rx)
                    + (oy * oy)/(config.ry * config.ry)

                if d <= 1 then

                    local falloff = 1 - d

                    local base_richness =
                        config.min_richness +
                        (config.max_richness - config.min_richness)
                        * (falloff ^ config.power)

                    local local_noise =
                        math.abs(
                            math.sin(
                                px*12.9898 +
                                py*78.233 +
                                cx*37.719 +
                                cy*91.456
                            )
                        ) % 1

                    local richness_variation =
                        0.6 + local_noise * 0.8

                    local richness =
                        math.floor(
                            base_richness
                            * richness_mult
                            * richness_variation
                        )

                    if surface.can_place_entity{
                        name="depleted-uranium-fuel-cell",
                        position={px,py}
                    } then

                        surface.create_entity{
                            name="depleted-uranium-fuel-cell",
                            position={px,py},
                            amount=richness
                        }

                    end
                end
            end
        end
    end
end





local cargo_loot =
{
    {
        weight = 10,
        stacks =
        {
            {"iron-plate", 10, 100},
            {"copper-plate", 10, 100},
            {"steel-plate", 10, 100},
            {"iron-gear-wheel", 10, 100},
            {"electronic-circuit", 50, 200},
        }
    },
	
	{
        weight = 10,
        stacks =
        {
            {"electronic-circuit", 50, 200},
			{"advanced-circuit", 25, 100},
            {"processing-unit", 5, 50},
        }
    },

    {
        weight = 10,
        stacks =
        {
            {"repair-pack", 10, 100},
        }
    },
	
	{
        weight = 10,
        stacks =
        {
            {"explosives", 10, 100},
			{"cannon-shell", 5, 50},
            {"explosive-cannon-shell", 5, 50},
        }
    },

    {
        weight = 10,
        stacks =
        {
            {"pistol", 1, 1},
            {"firearm-magazine", 10, 100},
            {"piercing-rounds-magazine", 10, 100},
        }
    },
	
	{
        weight = 10,
        stacks =
        {
            {"submachine-gun", 1, 1},
            {"firearm-magazine", 10, 100},
            {"piercing-rounds-magazine", 10, 100},
        }
    },
	
	{
        weight = 10,
        stacks =
        {
            {"flamethrower", 1, 1},
			{"flamethrower-ammo", 10, 100},
        }
    },
	
	{
        weight = 10,
        stacks =
        {
            {"rocket-launcher", 1, 1},
            {"rocket", 10, 100},
			{"explosive-rocket", 10, 100},
        }
    },

    {
        weight = 10,
        stacks =
        {
            {"grenade", 10, 25},
            {"land-mine", 10, 25},
            {"defender-capsule", 5, 25},
        }
    },

    {
        weight = 10,
        stacks =
        {
            {"light-armor", 1, 1},
        }
    },
	
	{
        weight = 10,
        stacks =
        {
            {"heavy-armor", 1, 1},
        }
    },
}


local function choose_loot_group()
    local total_weight = 0

    for _, group in ipairs(cargo_loot) do
        total_weight = total_weight + group.weight
    end

    local roll = math.random() * total_weight

    for _, group in ipairs(cargo_loot) do
        roll = roll - group.weight
        if roll <= 0 then
            return group
        end
    end

    return cargo_loot[#cargo_loot]
end


local function fill_cargo_pods(surface, area)
    local pods = surface.find_entities_filtered{
        area = area,
        name = "nulla-cargo-pod"
    }

    for _, pod in pairs(pods) do
        local inventory = pod.get_inventory(defines.inventory.chest)

        if inventory and inventory.is_empty() then
            inventory.clear()

            local group = choose_loot_group()

            for _, stack in ipairs(group.stacks) do
                if prototypes.item[stack[1]] then
                    inventory.insert{
                        name = stack[1],
                        count = math.random(stack[2], stack[3])
                    }
                end
            end
        end
    end
end


script.on_event(defines.events.on_chunk_generated, function(event)

    local surface = event.surface
    if surface.name ~= nulla_surface then return end

    local area = event.area
	
	generate_nuclear_waste(surface, area)
	fill_cargo_pods(surface, area)
	
end)