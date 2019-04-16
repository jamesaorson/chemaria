local item_constants = require "modules.constants.items"

local M = {}

M.WOOD_PICKAXE = {
	itemId = item_constants.WOOD_PICKAXE.id,
	components = {}
}
M.WOOD_PICKAXE.components[item_constants.WOOD_PLANKS.id] = 5

M.STONE_PICKAXE = {
	itemId = item_constants.STONE_PICKAXE.id,
	components = {}
}
M.STONE_PICKAXE.components[item_constants.WOOD_PLANKS.id] = 3
M.STONE_PICKAXE.components[item_constants.STONE.id] = 2

M.WOOD_WALL = {
	itemId = item_constants.WOOD_WALL.id,
	components = {}
}
M.WOOD_WALL.components[item_constants.WOOD_PLANKS.id] = 2

return M