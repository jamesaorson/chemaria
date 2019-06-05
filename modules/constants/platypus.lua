local platypus = require "platypus.platypus"
local player_constants = require "modules.constants.player"

local M = {}

M.CONFIG = {
	collisions = {
		separation = platypus.SEPARATION_SHAPES,
		groups = {
			[hash("block")] = platypus.DIR_ALL
		},
		left = player_constants.PLAYER_WIDTH / 2,
		right = player_constants.PLAYER_WIDTH / 2,
		top = player_constants.PLAYER_HEIGHT / 2,
		bottom = player_constants.PLAYER_HEIGHT / 2
	},
	gravity = -800,
	max_velocity = player_constants.PLAYER_MAX_VELOCITY,
	allow_double_jump = true,
	allow_wall_jump = false
}

return M