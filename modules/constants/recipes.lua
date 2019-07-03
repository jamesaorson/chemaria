local item_constants = require "modules.constants.items"

local RECIPES = {}

RECIPES.CRAFTABLES = {}
RECIPES.CRAFTABLES.FURNACE = {
	itemId = item_constants.FURNACE.id,
	components = {}
}
RECIPES.CRAFTABLES.FURNACE.components[item_constants.STONE.id] = 9

RECIPES.CRAFTABLES.WOOD_PICKAXE = {
	itemId = item_constants.WOOD_PICKAXE.id,
	components = {}
}
RECIPES.CRAFTABLES.WOOD_PICKAXE.components[item_constants.WOOD_PLANKS.id] = 5

RECIPES.CRAFTABLES.STONE_PICKAXE = {
	itemId = item_constants.STONE_PICKAXE.id,
	components = {}
}
RECIPES.CRAFTABLES.STONE_PICKAXE.components[item_constants.WOOD_PLANKS.id] = 3
RECIPES.CRAFTABLES.STONE_PICKAXE.components[item_constants.STONE.id] = 2

RECIPES.CRAFTABLES.WOOD_WALL = {
	itemId = item_constants.WOOD_WALL.id,
	components = {}
}
RECIPES.CRAFTABLES.WOOD_WALL.components[item_constants.WOOD_PLANKS.id] = 2

RECIPES.SMELTABLES = {}
RECIPES.SMELTABLES.GOLD_INGOT = {
	itemId = item_constants.GOLD_INGOT.id,
	components = {}
}
RECIPES.SMELTABLES.GOLD_INGOT.components[item_constants.GOLD_ORE.id] = 1

RECIPES.SMELTABLES.IRON_INGOT = {
	itemId = item_constants.IRON_INGOT.id,
	components = {}
}
RECIPES.SMELTABLES.IRON_INGOT.components[item_constants.IRON_ORE.id] = 1

RECIPES.SMELTABLES.PLATINUM_INGOT = {
	itemId = item_constants.PLATINUM_INGOT.id,
	components = {}
}
RECIPES.SMELTABLES.PLATINUM_INGOT.components[item_constants.PLATINUM_ORE.id] = 1

RECIPES.SMELTABLES.SILVER_INGOT = {
	itemId = item_constants.SILVER_INGOT.id,
	components = {}
}
RECIPES.SMELTABLES.SILVER_INGOT.components[item_constants.SILVER_ORE.id] = 1

return RECIPES