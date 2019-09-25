local camera_constants = require "modules.constants.camera"
local helpers = require "modules.helpers"
local orthographic = require "orthographic.camera"
local world_constants = require "modules.constants.world"

local POSITION_HELPERS = {}

--------------------------
-- Block Transformation --
--------------------------

function POSITION_HELPERS.block_to_screen_position(block)
	return vmath.vector3(
		block.position.x + (block.chunk.x) * world_constants.CHUNK_SIZE,
		block.position.y + (block.chunk.y) * world_constants.CHUNK_SIZE,
		0
	) * world_constants.BLOCK_SIZE
end

------------------------------
-- End Block Transformation --
------------------------------


---------------------------
-- Player Transformation --
---------------------------

function POSITION_HELPERS.player_to_screen_position()
	local camera_position = go.get_position(camera_constants.CAMERA_ID)
	local screen_position = orthographic.world_to_screen(camera_constants.CAMERA_ID, camera_position)
	return screen_position
end

-------------------------------
-- End Player Transformation --
-------------------------------


---------------------------
-- Screen Transformation --
---------------------------

function POSITION_HELPERS.screen_to_block_position(position)
	position = orthographic.screen_to_world(camera_constants.CAMERA_ID, position)
	local block_position =  vmath.vector3(
		helpers.round(position.x / world_constants.BLOCK_SIZE) % world_constants.CHUNK_SIZE,
		helpers.round(position.y / world_constants.BLOCK_SIZE) % world_constants.CHUNK_SIZE,
		0
	)
	return block_position
end

function POSITION_HELPERS.screen_to_chunk_position(position)
	position = orthographic.screen_to_world(camera_constants.CAMERA_ID, position)
	
	local chunk_position = vmath.vector3(
		(
			math.floor((position.x + world_constants.BLOCK_SIZE / 2)
			/ world_constants.BLOCK_SIZE
			/ world_constants.CHUNK_SIZE)
		),
		(
			math.floor((position.y + world_constants.BLOCK_SIZE / 2)
			/ world_constants.BLOCK_SIZE
			/ world_constants.CHUNK_SIZE)
		),
		0
	)
	return chunk_position
end

-------------------------------
-- End Screen Transformation --
-------------------------------

return POSITION_HELPERS