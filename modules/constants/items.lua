local M = {}

-----------
-- Items --
-----------

M.NONE = {
	id = 000000,
	type = "none"
}

M.DIRT = {
	id = 010001,
	stackSize = 64,
	type = "dirt"
}

M.ALL_ITEMS = {}
M.ALL_ITEMS[M.NONE.id] = M.NONE
M.ALL_ITEMS[M.DIRT.id] = M.DIRT

M.PLACEABLE = {
	id_prefix = 01
}
M.PLACEABLE[M.DIRT.id] = M.DIRT

---------------
-- End Items --
---------------

return M