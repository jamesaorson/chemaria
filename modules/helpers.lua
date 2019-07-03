local config = require "modules.config"
local defsave = require "defsave.defsave"
local globals = require "modules.globals"
local item_constants = require "modules.constants.items"
local world_constants = require "modules.constants.world"
local luatexts = require "modules.luatexts"

require "modules.models.Block"
require "modules.models.Chunk"
require "modules.models.World"

local M = {}

--------------------
-- Category Check --
--------------------

function M.is_craftable(item)
	if item == nil then
		return false
	end
	return item_constants.CRAFTABLE[item.id]
end

function M.is_placeable(item)
	if item == nil then
		return false
	end
	return item_constants.PLACEABLE[item.id]
end

function M.is_smeltable(item)
	if item == nil then
		return false
	end
	return item_constants.SMELTABLE[item.id]
end

function M.is_tool(item)
	if item == nil then
		return false
	end
	return item_constants.TOOL[item.id]
end

------------------------
-- End Category Check --
------------------------


------------
-- Config --
------------

local settingsFileName = "settings.bin"

function M.init_config_data()
	defsave.default_data = config
	defsave.set_appname(config.APPNAME)
	defsave.load(settingsFileName)

	for key, value in pairs(config) do
		local configValue = M.get_config_data(key)
		if configValue ~= nil then
			config[key] = configValue
		end
	end
end

function M.get_config_data(key)
	key = string.upper(key)
	if key ~= nil and type(key) == "string" and defsave.is_loaded(settingsFileName) and defsave.key_exists(settingsFileName, key) and defsave.isset(settingsFileName, key) then
		return defsave.get(settingsFileName, key)
	end
	return nil
end

function M.set_config_data(key, value)
	if key ~= nil and type(key) == "string" and defsave.is_loaded(settingsFileName) then
		defsave.set(settingsFileName, string.upper(key), value)
	end
end

function M.save_config_data(filename)
	if filename ~= nil and type(filename) == "string" then
		defsave.save(filename)
	else
		for key, value in pairs(config) do
			if M.get_config_data(key) == nil then
				M.set_config_data(key, value)
			end
		end
		defsave.save_all()
	end
end

----------------
-- End Config --
----------------


--------------
-- Crafting --
--------------

function M.check_for_crafting_components(self, recipe, componentsToCheck, materialsToUse, container)
	for id, requirement in pairs(recipe.components) do
		if componentsToCheck[id] == nil then
			componentsToCheck[id] = { requirement = requirement, actual = 0, fulfilled = false }
		end
	end
	
	for i, item in pairs(container) do
		local component = componentsToCheck[item.id]
		if (component and not component.fulfilled) then
			local amountToTake
			local requirement = component.requirement
			if component.actual + item.count > requirement then
				amountToTake = requirement - component.actual
			else
				amountToTake = item.count
			end
			component.actual = component.actual + amountToTake
			if component.actual == component.requirement then
				component.fulfilled = true
			end

			table.insert(materialsToUse, { index = item.index, count = amountToTake })
		end
	end

	for i, component in pairs(componentsToCheck) do
		if not component.fulfilled then
			return false
		end
	end
	return true
end

------------------
-- End Crafting --
------------------

-----------
-- Color --
-----------

function M.convert_rgba_to_native_range(r, g, b, a)
	return M.convert_rgba_vector_to_native_range(vmath.vector4(r, g, b, a))
end

function M.convert_rgba_vector_to_native_range(rgba)
	return vmath.vector4(rgba.x / 255, rgba.y / 255, rgba.z / 255, rgba.w)
end

---------------
-- End Color --
---------------


----------
-- Math --
----------

function M.round(num)
	if num > 0 then
		return math.floor(num + 0.5)
	else
		return math.ceil(num - 0.5)
	end
end

--------------
-- End Math --
--------------


---------------
-- Save/Load --
---------------

function M.load_game(saveFileName)
	if saveFileName == nil then
		return nil
	end
	local worldFileName = sys.get_save_file(config.APPNAME, saveFileName)

	local savedWorldFile = io.open(worldFileName, "r")
	if savedWorldFile then
		print("Begin reading '" .. worldFileName .. "' " .. os.clock())
		local data = savedWorldFile:read("*all")
		print("Finished reading '" .. worldFileName .. "' " .. os.clock())

		print("Begin parsing '" .. worldFileName .. "' " .. os.clock())
		_, data = luatexts.load(data)
		print("Finished parsing '" .. worldFileName .. "' " .. os.clock())

		return data
	end

	return nil
end

function M.save_game(worldMutation, saveFileName)
	if saveFileName == nil then
		return
	end
	print("Begin world save stringification " .. os.clock())
	local saveData = luatexts.save(worldMutation)
	print("End world save stringification " .. os.clock())

	print("Begin world save file write " .. os.clock())
	local worldFileName = sys.get_save_file(config.APPNAME, saveFileName)
	local worldFile = io.open(worldFileName, "w+")
	worldFile:write(saveData)
	worldFile:close()
	print("Begin world save file write " .. os.clock())
end

-------------------
-- End Save/Load --
-------------------

return M