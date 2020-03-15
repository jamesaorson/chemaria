local item_constants = require 'modules.constants.items'

local RECIPES = {}

RECIPES.CRAFTABLES = {}
RECIPES.CRAFTABLES.FURNACE = {
	item_id = item_constants.FURNACE.id,
	components = {}
}
RECIPES.CRAFTABLES.FURNACE.components[item_constants.STONE.id] = 9

RECIPES.CRAFTABLES.STONE_PICKAXE = {
	item_id = item_constants.STONE_PICKAXE.id,
	components = {}
}
RECIPES.CRAFTABLES.STONE_PICKAXE.components[item_constants.WOOD_PLANKS.id] = 3
RECIPES.CRAFTABLES.STONE_PICKAXE.components[item_constants.STONE.id] = 2

RECIPES.CRAFTABLES.IRON_PICKAXE = {
	item_id = item_constants.IRON_PICKAXE.id,
	components = {}
}
RECIPES.CRAFTABLES.IRON_PICKAXE.components[item_constants.WOOD_PLANKS.id] = 3
RECIPES.CRAFTABLES.IRON_PICKAXE.components[item_constants.IRON_INGOT.id] = 2

RECIPES.CRAFTABLES.WOOD_WALL = {
	item_id = item_constants.WOOD_WALL.id,
	components = {}
}
RECIPES.CRAFTABLES.WOOD_WALL.components[item_constants.WOOD_PLANKS.id] = 2

RECIPES.SMELTABLES = {}
RECIPES.SMELTABLES.CLAY_BRICKS = {
	item_id = item_constants.CLAY_BRICKS.id,
	components = {}
}
RECIPES.SMELTABLES.CLAY_BRICKS.components[item_constants.CLAY.id] = 4

RECIPES.SMELTABLES.GOLD_INGOT = {
	item_id = item_constants.GOLD_INGOT.id,
	components = {}
}
RECIPES.SMELTABLES.GOLD_INGOT.components[item_constants.GOLD_ORE.id] = 1

RECIPES.SMELTABLES.IRON_INGOT = {
	item_id = item_constants.IRON_INGOT.id,
	components = {}
}
RECIPES.SMELTABLES.IRON_INGOT.components[item_constants.IRON_ORE.id] = 1

RECIPES.SMELTABLES.PLATINUM_INGOT = {
	item_id = item_constants.PLATINUM_INGOT.id,
	components = {}
}
RECIPES.SMELTABLES.PLATINUM_INGOT.components[item_constants.PLATINUM_ORE.id] = 1

RECIPES.SMELTABLES.SILVER_INGOT = {
	item_id = item_constants.SILVER_INGOT.id,
	components = {}
}
RECIPES.SMELTABLES.SILVER_INGOT.components[item_constants.SILVER_ORE.id] = 1

RECIPES.SMELTABLES.STONE_BRICKS = {
	item_id = item_constants.STONE_BRICKS.id,
	components = {}
}
RECIPES.SMELTABLES.STONE_BRICKS.components[item_constants.STONE.id] = 4

RECIPES.MATERIALS = {}

return RECIPES