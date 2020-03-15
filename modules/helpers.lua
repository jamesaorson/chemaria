local config = require 'modules.config'
local defsave = require 'defsave.defsave'
local globals = require 'modules.globals'
local item_constants = require 'modules.constants.items'
local world_constants = require 'modules.constants.world'
local luatexts = require 'modules.luatexts'

require 'modules.models.Block'
require 'modules.models.Chunk'
require 'modules.models.World'

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

local settings_file_name = 'settings.bin'

function HELPERS.apply_config()
	HELPERS.init_config_data()

	local is_fullscreen = HELPERS.get_config_data('FULLSCREEN')
	if not is_fullscreen then
		is_fullscreen = config.FULLSCREEN
		HELPERS.set_config_data('FULLSCREEN', is_fullscreen)
	end
	HELPERS.set_resolution(nil, is_fullscreen)

	local vsync = HELPERS.get_config_data('VSYNC')
	if not vsync then
		vsync = config.VSYNC
		HELPERS.set_config_data('VSYNC', vsync)
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
	defsave.set_appname(config.APP_NAME)
	defsave.load(settings_file_name)

	for key, value in pairs(config) do
		local config_value = HELPERS.get_config_data(key)
		if config_value ~= nil then
			config[key] = config_value
		end
	end
end

function HELPERS.get_config_data(key)
	key = string.upper(key)
	if (
		key ~= nil
		and type(key) == 'string'
		and defsave.is_loaded(settings_file_name)
		and defsave.key_exists(settings_file_name, key)
		and defsave.isset(settings_file_name, key)
	) then
		return defsave.get(settings_file_name, key)
	end
	return nil
end

function HELPERS.save_config_data(file_name)
	if file_name ~= nil and type(file_name) == 'string' then
		defsave.save(file_name)
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
	if key ~= nil and type(key) == 'string' and defsave.is_loaded(settings_file_name) then
		defsave.set(settings_file_name, string.upper(key), value)
	end
end

----------------
-- End Config --
----------------


--------------
-- Crafting --
--------------

function HELPERS.check_for_crafting_components(self, recipe, components_to_check, materials_to_use, container)
	for id, requirement in pairs(recipe.components) do
		if components_to_check[id] == nil then
			components_to_check[id] = {
				requirement = requirement,
				actual = 0,
				fulfilled = false
			}
		end
	end
	
	for i, item in pairs(container) do
		local component = components_to_check[item.id]
		if (component and not component.fulfilled) then
			local amount_to_take
			local requirement = component.requirement
			if component.actual + item.count > requirement then
				amount_to_take = requirement - component.actual
			else
				amount_to_take = item.count
			end
			component.actual = component.actual + amount_to_take
			if component.actual == component.requirement then
				component.fulfilled = true
			end

			table.insert(
				materials_to_use,
				{
					index = item.index, count = amount_to_take
				}
			)
		end
	end

	for i, component in pairs(components_to_check) do
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

function HELPERS.linear_scale(inputLow, input_high, output_low, output_high, number_to_scale)
	local input_range = (input_high - inputLow)  
	local outputRange = (output_high - output_low)  
	return(((number_to_scale - inputLow) * outputRange) / input_range) + output_low
end

--------------
-- End Math --
--------------


-----------
-- Mouse --
-----------

function HELPERS.load_cursor(cursor_name)
	if cursor_name then
		local system_name = sys.get_sys_info().system_name
		local cursor = nil

		if system_name == 'Linux' then
			local function extract_to_savefolder(res)
				local app_name = sys.get_config('project.title')
				local resource_buffer = resource.load('/assets/' .. res)
				local raw_bytes = buffer.get_bytes(resource_buffer, hash('data'))
				local path = sys.get_save_file(app_name, res)
				local f = io.open(path, 'wb')
				f:write(raw_bytes)
				f:flush()
				f:close()
				return path
			end
			cursor = defos.load_cursor(extract_to_savefolder(cursor_name .. '.xcur'))
		elseif system_name == 'Windows' then
			cursor = defos.load_cursor('assets/mouse/' .. cursor_name .. '.cur')
		elseif system_name == 'Darwin' then
			cursor = defos.load_cursor(
				{
					image = resource.load('/assets/mouse/' .. cursor_name .. '.tiff'),
					hot_spot_x = 0,
					hot_spot_y = 0
				}
			)
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

function HELPERS.load_game(save_file_name)
	if save_file_name == nil then
		return nil
	end
	local world_file_name = sys.get_save_file(config.APP_NAME, save_file_name .. '.json')

	local saved_world_file = io.open(world_file_name, 'r')
	if saved_world_file then
		print('Begin reading "' .. world_file_name .. '" ' .. os.clock())
		local data = saved_world_file:read('*all')
		print('Finished reading "' .. world_file_name .. '" ' .. os.clock())

		print('Begin parsing "' .. world_file_name .. '" ' .. os.clock())
		_, data = luatexts.load(data)
		print('Finished parsing "' .. world_file_name .. '" ' .. os.clock())

		return data
	end

	return nil
end

function HELPERS.save_game(world_mutation, save_file_name)
	if save_file_name == nil then
		return
	end
	pprint(world_mutation)
	print('Begin world save stringification ' .. os.clock())
	local save_data = luatexts.save(world_mutation)
	print('End world save stringification ' .. os.clock())

	print('Begin world save file write ' .. os.clock())
	local world_file_name = sys.get_save_file(config.APP_NAME, save_file_name .. '.json')
	local world_file = io.open(world_file_name, 'w+')
	world_file:write(save_data)
	world_file:close()
	print('Begin world save file write ' .. os.clock())
end

-------------------
-- End Save/Load --
-------------------

------------
-- Screen --
------------

function HELPERS.get_current_display()
	local displays = defos.get_displays()
	local display_id = defos.get_current_display_id()
	return displays[display_id]
end

function HELPERS.set_resolution(resolution, is_fullscreen)
	local current_display = HELPERS.get_current_display()
	local modes = defos.get_display_modes(current_display.id)

	if not resolution or not (resolution.width and resolution.height) then
		resolution = {
			width = current_display.mode.width,
			height = current_display.mode.height
		}
	end
	local is_valid_resolution = false
	for _, mode in pairs(modes) do
		if mode.width == resolution.width and mode.height == resolution.height then
			is_valid_resolution = true
			break
		end
	end
	if is_valid_resolution then
		defos.set_fullscreen(is_fullscreen)
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

-----------
-- Proxy --
-----------

function HELPERS.switch_proxy(proxy)
	msg.post(
		'main:/loader#loader',
		'switch_proxy',
		{
			switch_to = proxy
		}
	)
end

---------------
-- End Proxy --
---------------

return HELPERS