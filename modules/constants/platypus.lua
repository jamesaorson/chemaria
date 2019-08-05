local platypus = require "platypus.platypus"
local player_constants = require "modules.constants.player"

local PLATYPUS = {}

PLATYPUS.CONFIG = {
	collisions = {
		separation = platypus.SEPARATION_SHAPES,
		groups = {
			[hash("block")] = platypus.DIR_ALL
		},
		left = player_constants.WIDTH / 2,
		right = player_constants.WIDTH / 2,
		top = player_constants.HEIGHT / 2,
		bottom = player_constants.HEIGHT / 2
	},
	gravity = -800,
	max_velocity = player_constants.MAX_VELOCITY,
	allow_double_jump = true,
	allow_wall_jump = false
}

return PLATYPUS