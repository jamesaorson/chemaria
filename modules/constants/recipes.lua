local item_constants = require "modules.constants.items"

local M = {}

M.WOOD_PICKAXE = {
	itemId = item_constants.WOOD_PICKAXE.id,
	components = {}
}
M.WOOD_PICKAXE.components[item_constants.WOOD_PLANKS.id] = 120
M.WOOD_PICKAXE.components[item_constants.STONE_BRICKS.id] = 96

M.WOOD_PLANKS = {
	itemId = item_constants.WOOD_PLANKS.id,
	components = {}
}
M.WOOD_PLANKS.components[item_constants.WOOD_PLANKS.id] = 1

return M