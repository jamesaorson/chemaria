local item_constants = require "modules.constants.items"

local M = {}

M.WOOD_PICKAXE = {
	itemId = item_constants.WOOD_PICKAXE.id,
	components = {}
}
M.WOOD_PICKAXE.components[item_constants.WOOD_PLANKS.id] = 120
M.WOOD_PICKAXE.components[item_constants.STONE_BRICKS.id] = 96

return M