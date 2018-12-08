local helpers = require "modules.helpers"

local M = {}

------------
-- Camera --
------------

M.CAMERA_ID = hash("/camera")

----------------
-- End Camera --
----------------


-----------------
-- Screen Size --
-----------------

M.SCREEN = {
	x = 0,
	y = 0,
	w = 0,
	h = 0
}

---------------------
-- End Screen Size --
---------------------


---------------
-- Inventory --
---------------

M.INVENTORY_SIZE = {
	rows = 3,
	rowSize = 10
}
M.INVENTORY_MAX_SLOTS = M.INVENTORY_SIZE.rows * M.INVENTORY_SIZE.rowSize
M.INVENTORY_SELECTED_COLOR = vmath.vector4(helpers.convert_rgba_to_native_range(120, 240, 50, 1.0))
M.INVENTORY_UNSELECTED_COLOR = vmath.vector4(helpers.convert_rgba_to_native_range(255, 255, 255, 1.0))

-------------------
-- End Inventory --
-------------------


----------
-- Item --
----------

M.NONE = {
	type = "none"
}

M.DIRT = {
	stackSize = 64,
	type = "dirt"
}
M.STONE = {
	stackSize = 64,
	type = "stone"
}

M.ALL_ITEMS = {
	dirt = M.DIRT,
	none = M.NONE,
	stone = M.STONE
}

--------------
-- End Item --
--------------


--------------
-- Platypus --
--------------

M.GRAVITY = -800

------------------
-- End Platypus --
------------------


------------
-- Player --
------------

M.PLAYER_HEIGHT = 76
M.PLAYER_JUMP_FORCE = 800
M.PLAYER_LINEAR_DAMPING = 0.9
M.PLAYER_MAX_VELOCITY = 600
M.PLAYER_VELOCITY = vmath.vector3(300, 0, 0)
M.PLAYER_WIDTH = 48
M.PLAYER_BASE_MINING_INTERVAL = 0.5
M.PLAYER_BASE_PLACING_INTERVAL = 0.05

----------------
-- End Player --
----------------


-------------
-- Toolbar --
-------------

M.TOOLBAR_MAX_SLOTS = 10
M.TOOLBAR_SELECTED_COLOR = vmath.vector4(helpers.convert_rgba_to_native_range(120, 240, 50, 1.0))
M.TOOLBAR_UNSELECTED_COLOR = vmath.vector4(helpers.convert_rgba_to_native_range(255, 255, 255, 1.0))

-----------------
-- End Toolbar --
-----------------


-----------
-- World --
-----------

M.BLOCK_SIZE = 32
M.CHUNK_MAX = vmath.vector3(10, 10, 0)
M.CHUNK_SIZE = 12
M.RENDER_DISTANCE = 1

---------------
-- End World --
---------------

return M