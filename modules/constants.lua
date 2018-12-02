local helpers = require "modules.helpers"

local M = {}

-----------
-- World --
-----------

M.BLOCK_SIZE = 32
M.CHUNK_MAX = vmath.vector3(10, 10, 0)
M.CHUNK_SIZE = 12

---------------
-- End World --
---------------


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


---------------
-- Inventory --
---------------

M.INVENTORY_SIZE = {
	rows = 3,
	rowSize = 10
}
M.INVENTORY_SELECTED_COLOR = vmath.vector4(helpers.convert_rgba_to_native_range(120, 240, 50, 1.0))
M.INVENTORY_UNSELECTED_COLOR = vmath.vector4(helpers.convert_rgba_to_native_range(255, 255, 255, 1.0))

-------------------
-- End Inventory --
-------------------

return M