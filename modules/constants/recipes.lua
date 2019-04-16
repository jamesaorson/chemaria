local item_constants = require "modules.constants.items"

local M = {}

M.CRAFTABLES = {}
M.CRAFTABLES.WOOD_PICKAXE = {
	itemId = item_constants.WOOD_PICKAXE.id,
	components = {}
}
M.CRAFTABLES.WOOD_PICKAXE.components[item_constants.WOOD_PLANKS.id] = 5

M.CRAFTABLES.STONE_PICKAXE = {
	itemId = item_constants.STONE_PICKAXE.id,
	components = {}
}
M.CRAFTABLES.STONE_PICKAXE.components[item_constants.WOOD_PLANKS.id] = 3
M.CRAFTABLES.STONE_PICKAXE.components[item_constants.STONE.id] = 2

M.CRAFTABLES.WOOD_WALL = {
	itemId = item_constants.WOOD_WALL.id,
	components = {}
}
M.CRAFTABLES.WOOD_WALL.components[item_constants.WOOD_PLANKS.id] = 2

M.SMELTABLES = {}
M.SMELTABLES.GOLD_INGOT = {
	itemId = item_constants.GOLD_INGOT.id,
	components = {}
}
M.SMELTABLES.GOLD_INGOT.components[item_constants.IRON_ORE.id] = 1

M.SMELTABLES.IRON_INGOT = {
	itemId = item_constants.IRON_INGOT.id,
	components = {}
}
M.SMELTABLES.IRON_INGOT.components[item_constants.IRON_INGOT.id] = 1

M.SMELTABLES.PLATINUM_INGOT = {
	itemId = item_constants.PLATINUM_INGOT.id,
	components = {}
}
M.SMELTABLES.PLATINUM_INGOT.components[item_constants.PLATINUM_ORE.id] = 1

M.SMELTABLES.SILVER_INGOT = {
	itemId = item_constants.SILVER_INGOT.id,
	components = {}
}
M.SMELTABLES.SILVER_INGOT.components[item_constants.SILVER_ORE.id] = 1

return M