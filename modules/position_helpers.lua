local constants = require "modules.constants"
local helpers = require "modules.helpers"
local orthographic = require "orthographic.camera"

local M = {}

--------------------------
-- Block Transformation --
--------------------------

function M.block_to_screen_position(block)
	return vmath.vector3(block.position.x + (block.chunk.x) * constants.CHUNK_SIZE, block.position.y + (block.chunk.y) * 12, 0) * constants.BLOCK_SIZE
end

------------------------------
-- End Block Transformation --
------------------------------


---------------------------
-- Screen Transformation --
---------------------------

function M.screen_to_block_position(position)
	position = orthographic.screen_to_world(hash("/camera"), position)
	local blockPosition =  vmath.vector3(
		helpers.round(position.x / constants.BLOCK_SIZE) % constants.CHUNK_SIZE,
		helpers.round(position.y / constants.BLOCK_SIZE) % constants.CHUNK_SIZE,
		0)
	return blockPosition
end

function M.screen_to_chunk_position(position)
	position = orthographic.screen_to_world(hash("/camera"), position)
	
	local chunkPosition = vmath.vector3(
		math.floor((position.x + constants.BLOCK_SIZE / 2) / constants.BLOCK_SIZE / constants.CHUNK_SIZE),
		math.floor((position.y + constants.BLOCK_SIZE / 2) / constants.BLOCK_SIZE / constants.CHUNK_SIZE),
		0)
	return chunkPosition
end

-------------------------------
-- End Screen Transformation --
-------------------------------

return M