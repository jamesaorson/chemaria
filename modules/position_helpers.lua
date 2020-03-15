local camera_constants = require 'modules.constants.camera'
local helpers = require 'modules.helpers'
local orthographic = require 'orthographic.camera'
local world_constants = require 'modules.constants.world'

local POSITION_HELPERS = {}

------------------------
-- Background Helpers --
------------------------

function POSITION_HELPERS.get_updated_background_position(background_self, current_position)
	local camera_position = go.get_position(camera_constants.CAMERA_ID)
	local relative_camera = vmath.vector3()
	relative_camera.x = math.floor(
		camera_position.x
		/ background_self.background_width
	)
	relative_camera.y = math.floor(
		camera_position.y
		/ background_self.background_height
	)

	local new_position = vmath.vector3()

	background_self.initial_position.x = (
		background_self.background_width
		* (
			(
				background_self.index.x
				- 1
			)
			+ relative_camera.x
		)
	)
	background_self.initial_position.y = current_position.y
	if background_self.index.y > 0 then
		background_self.initial_position.y = (
			background_self.background_height
			* (
				(
					background_self.index.y
					- 1
				)
				+ relative_camera.y
			)
		)
	end
	new_position = vmath.vector3(
		background_self.initial_position.x,
		background_self.initial_position.y,
		current_position.z
	)

	background_self.offset_from_camera = vmath.vector3()
	background_self.offset_from_camera.x = camera_position.x * -1 * background_self.scrolling_speed.x

	local position = new_position
	position.x = position.x + background_self.offset_from_camera.x

	return position
end

----------------------------
-- End Background Helpers --
----------------------------


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