local constants = require "modules.constants"
local platypus = require "platypus.platypus"

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
		left = constants.PLAYER_WIDTH / 2,
		right = constants.PLAYER_WIDTH / 2,
		top = constants.PLAYER_HEIGHT / 2,
		bottom = constants.PLAYER_HEIGHT / 2
	},
	gravity = constants.GRAVITY,
	max_velocity = constants.PLAYER_MAX_VELOCITY,
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