local M = {}

M.INVENTORY_SIZE = {
	rows = 3,
	rowSize = 10
}
M.INVENTORY_MAX_SLOTS = M.INVENTORY_SIZE.rows * M.INVENTORY_SIZE.rowSize
M.INVENTORY_SELECTED_COLOR = vmath.vector4(0.47, 0.9, 0.2, 1)
M.INVENTORY_UNSELECTED_COLOR = vmath.vector4(1, 1, 1, 1)

return M