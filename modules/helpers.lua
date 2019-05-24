local config = require "modules.config"
local item_constants = require "modules.constants.items"
local luatexts = require "modules.luatexts"
local world_constants = require "modules.constants.world"

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

function M.load_game()
	local worldFileName = sys.get_save_file(config.SAVE_PATH.folder, config.SAVE_PATH.name)
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

function M.save_game(world)
	local worldFileName = sys.get_save_file(config.SAVE_PATH.folder, config.SAVE_PATH.name)
	local worldFile = io.open(worldFileName, "w+")
	local minimalWorld = {
		chunks = {}
	}

	print("Begin world save minimization " .. os.clock())
	for chunkX = -world_constants.WORLD_DIMENSIONS.x, world_constants.WORLD_DIMENSIONS.x do
		for chunkY = -world_constants.WORLD_DIMENSIONS.y, world_constants.WORLD_DIMENSIONS.y do
			local chunk = World.get_chunk_at_position(world, { x = chunkX, y = chunkY })
			chunk.position = { x = chunk.position.x, y = chunk.position.y, z = chunk.position.z }
			chunk.isRendered = nil
			local blocks = chunk.blocks
			for blockY = 0, world_constants.CHUNK_SIZE - 1 do
				for blockX = 0, world_constants.CHUNK_SIZE - 1 do
					local block = Chunk.get_block_at_position(chunk, { x = blockX, y = blockY })
					if block then
						block.position = { x = block.position.x, y = block.position.y, z = block.position.z }
						if block.chunk then
							block.chunk = { x = block.chunk.x, y = block.chunk.y, z = block.chunk.z }
						end
						block.pickupId = nil
						block.stackSize = nil
						block.url = nil
					end
				end
			end
			if not minimalWorld.chunks[chunkX] then
				minimalWorld.chunks[chunkX] = {}
			end
			minimalWorld.chunks[chunkX][chunkY] = chunk
		end
	end
	print("End world save minimization " .. os.clock())

	print("Begin world save stringification " .. os.clock())
	local saveData = luatexts.save(minimalWorld)
	print("End world save stringification " .. os.clock())

	print("Begin world save file write " .. os.clock())
	worldFile:write(saveData)
	print("Begin world save file write " .. os.clock())
end

-------------------
-- End Save/Load --
-------------------

return M