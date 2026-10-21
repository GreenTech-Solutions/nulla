local util = require("util")
local nulla_utils = require("lib")



nulla_utils.add_radio_interference_to_type("rail-signal", 1 / 60)
nulla_utils.add_radio_interference_to_type("rail-chain-signal", 1 / 60)
nulla_utils.add_radio_interference_to_type("logistic-container", 4 / 60)
nulla_utils.add_radio_interference_to_type("spider-vehicle", 10 / 60)
nulla_utils.add_radio_interference_to_type("roboport", 6 / 60)
nulla_utils.add_radio_interference_to_type("beacon", 16 / 60)
nulla_utils.add_radio_interference_to_type("constant-combinator", 1 / 60)
nulla_utils.add_radio_interference_to_type("fusion-reactor", 30 / 60)
nulla_utils.add_radio_interference_to_type("fusion-generator", 10 / 60)


nulla_utils.add_radio_interference_energy(data.raw["assembling-machine"]["electromagnetic-plant"], 40)
nulla_utils.add_radio_interference_energy(data.raw["assembling-machine"]["centrifuge"], 8)
nulla_utils.add_radio_interference_energy(data.raw["assembling-machine"]["foundry"], 4)
-- Krastorio 2 turns the electric furnace into an assembling machine
nulla_utils.add_radio_interference_energy(data.raw["furnace"]["electric-furnace"] or data.raw["assembling-machine"]["electric-furnace"], 2)
nulla_utils.add_radio_interference_energy_to_type("radar", 12)
nulla_utils.add_radio_interference_energy_to_type("rocket-silo", 4)
nulla_utils.add_radio_interference_energy_to_type("car", 1)
nulla_utils.add_radio_interference_energy_to_type("locomotive", 2)
nulla_utils.add_radio_interference_energy_to_type("lab", 4)
nulla_utils.add_radio_interference_energy_to_type("programmable-speaker", 1)




local lubricant = data.raw.fluid["lubricant"]
	if not lubricant then return end

	if not lubricant.fuel_value then
		lubricant.fuel_value = "22kJ"
end