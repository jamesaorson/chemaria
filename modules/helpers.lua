local config = require "modules.config"
local defsave = require "defsave.defsave"
local globals = require "modules.globals"
local item_constants = require "modules.constants.items"
local world_constants = require "modules.constants.world"
local luatexts = require "modules.luatexts"

require "modules.models.Block"
require "modules.models.Chunk"
require "modules.models.World"

local HELPERS = {}

--------------------
-- Category Check --
--------------------

function HELPERS.is_craftable(item)
	if item == nil then
		return false
	end
	return item_constants.CRAFTABLE[item.id]
end

function HELPERS.is_placeable(item)
	if item == nil then
		return false
	end
	return item_constants.PLACEABLE[item.id]
end

function HELPERS.is_smeltable(item)
	if item == nil then
		return false
	end
	return item_constants.SMELTABLE[item.id]
end

function HELPERS.is_tool(item)
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

function HELPERS.apply_config()
	HELPERS.init_config_data()

	-- local isFullscreen = HELPERS.get_config_data("FULLSCREEN")
	-- if not isFullscreen then
	-- 	isFullscreen = config.FULLSCREEN
	-- 	HELPERS.set_config_data("FULLSCREEN", isFullscreen)
	-- end
	-- defos.set_fullscreen(isFullscreen)

	local vsync = HELPERS.get_config_data("VSYNC")
	if not vsync then
		vsync = config.VSYNC
		HELPERS.set_config_data("VSYNC", vsync)
	end
	if vsync then
		vsync = 1
	else
		vsync = 0
	end
	sys.set_vsync_swap_interval(vsync)

	HELPERS.save_config_data()
end

function HELPERS.init_config_data()
	defsave.default_data = config
	defsave.set_appname(config.APPNAME)
	defsave.load(settingsFileName)

	for key, value in pairs(config) do
		local configValue = HELPERS.get_config_data(key)
		if configValue ~= nil then
			config[key] = configValue
		end
	end
end

function HELPERS.get_config_data(key)
	key = string.upper(key)
	if key ~= nil and type(key) == "string" and defsave.is_loaded(settingsFileName) and defsave.key_exists(settingsFileName, key) and defsave.isset(settingsFileName, key) then
		return defsave.get(settingsFileName, key)
	end
	return nil
end

function HELPERS.save_config_data(filename)
	if filename ~= nil and type(filename) == "string" then
		defsave.save(filename)
	else
		for key, value in pairs(config) do
			if HELPERS.get_config_data(key) == nil then
				HELPERS.set_config_data(key, value)
			end
		end
		defsave.save_all()
	end
end

function HELPERS.set_config_data(key, value)
	if key ~= nil and type(key) == "string" and defsave.is_loaded(settingsFileName) then
		defsave.set(settingsFileName, string.upper(key), value)
	end
end

----------------
-- End Config --
----------------


--------------
-- Crafting --
--------------

function HELPERS.check_for_crafting_components(self, recipe, componentsToCheck, materialsToUse, container)
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

function HELPERS.convert_rgba_to_native_range(r, g, b, a)
	return HELPERS.convert_rgba_vector_to_native_range(vmath.vector4(r, g, b, a))
end

function HELPERS.convert_rgba_vector_to_native_range(rgba)
	return vmath.vector4(rgba.x / 255, rgba.y / 255, rgba.z / 255, rgba.w)
end

---------------
-- End Color --
---------------


----------
-- Math --
----------

function HELPERS.distance(v1, v2)
	return math.sqrt(
		math.pow(v1.x - v2.x, 2)
		+ math.pow(v1.y - v2.y, 2)
		+ math.pow(v1.z - v2.z, 2)
	)
end

function HELPERS.round(num)
	if num > 0 then
		return math.floor(num + 0.5)
	else
		return math.ceil(num - 0.5)
	end
end

function HELPERS.linear_scale(inputLow, inputHigh, outputLow, outputHigh, numberToScale)
	local inputRange = (inputHigh - inputLow)  
	local outputRange = (outputHigh - outputLow)  
	return(((numberToScale - inputLow) * outputRange) / inputRange) + outputLow
end

--------------
-- End Math --
--------------


-----------
-- Mouse --
-----------

function HELPERS.load_cursor(cursorName)
	if cursorName then
		local systemName = sys.get_sys_info().system_name
		local cursor = nil

		if systemName == "Linux" then
			local function extract_to_savefolder(res)
				local appname = sys.get_config("project.title")
				local resbuff = resource.load("/assets/" .. res)
				local rawBytes = buffer.get_bytes(resbuff, hash("data"))
				local path = sys.get_save_file(appname, res)
				local f = io.open(path, "wb")
				f:write(raw_bytes)
				f:flush()
				f:close()
				return path
			end
			cursor = defos.load_cursor(extract_to_savefolder(cursorName .. ".xcur"))
		elseif systemName == "Windows" then
			cursor = defos.load_cursor("assets/mouse/" .. cursorName .. ".cur")
		elseif systemName == "Darwin" then
			cursor = defos.load_cursor({
				image = resource.load("/assets/mouse/" .. cursorName .. ".tiff"),
				hot_spot_x = 0,
				hot_spot_y = 0
			})
		end

		if cursor then
			defos.set_cursor(cursor)
		end
	end
end

---------------
-- End Mouse --
---------------


---------------
-- Save/Load --
---------------

function HELPERS.load_game(saveFileName)
	if saveFileName == nil then
		return nil
	end
	local worldFileName = sys.get_save_file(config.APPNAME, saveFileName .. ".json")

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

function HELPERS.save_game(worldMutation, saveFileName)
	if saveFileName == nil then
		return
	end
	print("Begin world save stringification " .. os.clock())
	local saveData = luatexts.save(worldMutation)
	print("End world save stringification " .. os.clock())

	print("Begin world save file write " .. os.clock())
	local worldFileName = sys.get_save_file(config.APPNAME, saveFileName .. ".json")
	local worldFile = io.open(worldFileName, "w+")
	worldFile:write(saveData)
	worldFile:close()
	print("Begin world save file write " .. os.clock())
end

-------------------
-- End Save/Load --
-------------------

------------
-- Screen --
------------

function HELPERS.get_current_display()
	local displays = defos.get_displays()
	local displayId = defos.get_current_display_id()
	return displays[displayId]
end

function HELPERS.set_resolution(resolution)
	local currentDisplay = HELPERS.get_current_display()
	local modes = defos.get_display_modes(currentDisplay.id)

	if not resolution or not (resolution.width and resolution.height) then
		resolution = {
			width = currentDisplay.mode.width,
			height = currentDisplay.mode.height
		}
	end
	local isValidResolution = false
	for _, mode in pairs(modes) do
		if mode.width == resolution.width and mode.height == resolution.height then
			isValidResolution = true
			break
		end
	end
	if isValidResolution then
		defos.set_fullscreen(true)
		defos.set_window_size(0, 0, resolution.width, resolution.height)
		defos.set_always_on_top(true)
		defos.disable_maximize_button()
		defos.disable_minimize_button()
		defos.disable_window_resize()
	end
end

----------------
-- End Screen --
----------------

--

return HELPERS