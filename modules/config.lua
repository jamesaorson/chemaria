local platypus = require "platypus.platypus"
local platypus_constants = require "modules.constants.platypus"
local player_constants = require "modules.constants.player"

local M = {}

------------
-- Camera --
------------

M.CAMERA_DEADZONE = { left = 25, right = 25, bottom = 0, top = 0 }
M.CAMERA_ZOOM_LEVEL = { zoom = 1.25 }

----------------
-- End Camera --
----------------


--------------
-- Platypus --
--------------

M.PLATYPUS_CONFIG = {
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
	gravity = platypus_constants.GRAVITY,
	max_velocity = player_constants.PLAYER_MAX_VELOCITY,
	allow_double_jump = true,
	allow_wall_jump = false
}

------------------
-- End Platypus --
------------------


----------
-- Save --
----------

M.SAVE_PATH = {
	folder = "Chemaria",
	name = "world_save"
}

--------------
-- End Save --
--------------


-----------
-- Video --
-----------

M.IS_FULLSCREEN = true

---------------
-- End Video --
---------------

return M