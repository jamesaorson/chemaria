local M = {}

------------
-- Camera --
------------

M.CAMERA_ID = hash("/camera")

----------------
-- End Camera --
----------------


---------------
-- Inventory --
---------------

M.INVENTORY_SIZE = {
	rows = 3,
	rowSize = 10
}
M.INVENTORY_MAX_SLOTS = M.INVENTORY_SIZE.rows * M.INVENTORY_SIZE.rowSize
M.INVENTORY_SELECTED_COLOR = vmath.vector4(0.47, 0.9, 0.2, 1)
M.INVENTORY_UNSELECTED_COLOR = vmath.vector4(1, 1, 1, 1)

-------------------
-- End Inventory --
-------------------


----------
-- Item --
----------

M.NONE = {
	id = 0000,
	type = "none"
}

M.DIRT = {
	id = 0101,
	stackSize = 64,
	type = "dirt"
}
M.STONE = {
	id = 0102,
	stackSize = 64,
	type = "stone"
}
M.WOOD_PLANKS = {
	id = 0501,
	stackSize = 64,
	type = "wood_planks"
}
M.WOOD_PICKAXE = {
	id = 0401,
	stackSize = 64,
	type = "wood_pickaxe"
}

M.ALL_ITEMS = {}
M.ALL_ITEMS[0000] = M.NONE
M.ALL_ITEMS[0101] = M.DIRT
M.ALL_ITEMS[0102] = M.STONE
M.ALL_ITEMS[0401] = M.WOOD_PICKAXE
M.ALL_ITEMS[0401] = M.WOOD_PLANKS

M.PLACEABLE = {
	id_prefix = 01
}
M.PLACEABLE[0101] = M.DIRT
M.PLACEABLE[0102] = M.STONE

M.SMELTABLE = {
	id_prefix = 02
}

M.CRAFTABLE = {
	id_prefix = 03
}
M.CRAFTABLE[0401] = M.WOOD_PICKAXE

M.TOOL = {
	id_prefix = 04
}
M.TOOL[0401] = M.WOOD_PICKAXE

M.PICKUPS = {
	id_prefix = 05
}
M.PICKUPS[0501] = M.WOOD_PLANKS

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

M.PLAYER_HEIGHT = 60
M.PLAYER_JUMP_FORCE = 800
M.PLAYER_LINEAR_DAMPING = 0.9
M.PLAYER_MAX_VELOCITY = 600
M.PLAYER_VELOCITY = vmath.vector3(300, 0, 0)
M.PLAYER_WIDTH = 36
M.PLAYER_BASE_MINING_INTERVAL = 0.5
M.PLAYER_BASE_PLACING_INTERVAL = 0.05

----------------
-- End Player --
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


-------------
-- Toolbar --
-------------

M.TOOLBAR_MAX_SLOTS = 10
M.TOOLBAR_SELECTED_COLOR = vmath.vector4(0.47, 0.9, 0.2, 1)
M.TOOLBAR_UNSELECTED_COLOR = vmath.vector4(1, 1, 1, 1)

-----------------
-- End Toolbar --
-----------------


-----------
-- World --
-----------

M.BLOCK_SIZE = 24
M.WORLD_DIMENSIONS = vmath.vector3(20, 20, 0)
M.CHUNK_SIZE = 12
M.RENDER_DISTANCE = 4

---------------
-- End World --
---------------

return M