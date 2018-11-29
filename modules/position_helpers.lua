local rendercam = require "rendercam.rendercam"
local constants = require "modules.constants"

local M = {}

function M.screen_to_block_position(position)
	position = rendercam.screen_to_world_2d(position.x, position.y)
	return vmath.vector3(math.floor(position.x / constants.BLOCK_SIZE + 0.5), math.floor(position.y / constants.BLOCK_SIZE + 0.5), 0)
end

function M.screen_to_chunk_position(position)
	position = rendercam.screen_to_world_2d(position.x, position.y)
	return vmath.vector3(
		math.floor(position.x / constants.BLOCK_SIZE / constants.CHUNK_SIZE + 0.5),
		math.floor(position.y / constants.BLOCK_SIZE / constants.CHUNK_SIZE + 0.5),
		0)
end

return M