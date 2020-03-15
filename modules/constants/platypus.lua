local platypus = require 'platypus.platypus'
local player_constants = require 'modules.constants.player'

local PLATYPUS = {}

PLATYPUS.CONFIG = {
	collisions = {
		separation = platypus.SEPARATION_SHAPES,
		groups = {
			[hash('block')] = platypus.DIR_ALL
		},
		left = player_constants.WIDTH / 2,
		right = player_constants.WIDTH / 2,
		top = player_constants.HEIGHT / 2 - 2,
		bottom = player_constants.HEIGHT / 2 + 2
	},
	gravity = -600,
	max_velocity = player_constants.MAX_VELOCITY,
	allow_double_jump = false,
	allow_wall_jump = false
}

return PLATYPUS