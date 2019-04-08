local item_constants = require "modules.constants.items"

local M = {}

M.WOOD_PICKAXE = {
	itemId = item_constants.WOOD_PICKAXE.id,
	components = {}
}
M.WOOD_PICKAXE.components[item_constants.WOOD_PLANKS.id] = 2
M.WOOD_PICKAXE.components[item_constants.STONE.id] = 3

M.WOOD_WALL = {
	itemId = item_constants.WOOD_WALL.id,
	components = {}
}
M.WOOD_WALL.components[item_constants.WOOD_PLANKS.id] = 2

return M