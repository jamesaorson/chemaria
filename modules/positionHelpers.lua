local rendercam = require "rendercam.rendercam"

local M = {}

function M.screen_to_block_position(position)
	position = rendercam.screen_to_world_2d(position.x, position.y)
	return vmath.vector3(math.floor(position.x / 32 + 0.5), math.floor(position.y / 32 + 0.5), 0)
end

return M