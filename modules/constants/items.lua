local M = {}

-----------
-- Items --
-----------

M.NONE = {
	id = 000000,
	name = "none",
	displayName = "None",
	stackSize = 64
}

M.DIRT = {
	id = 010001,
	name = "dirt",
	displayName = "Dirt",
	stackSize = 64
}
M.STONE = {
	id = 010002,
	name = "stone",
	displayName = "Stone",
	stackSize = 64
}
M.SAND = {
	id = 010003,
	name = "sand",
	displayName = "Sand",
	stackSize = 64
}
M.CLAY = {
	id = 010004,
	name = "clay",
	displayName = "Clay",
	stackSize = 64
}
M.CLAY_BRICKS = {
	id = 010005,
	name = "clay_bricks",
	displayName = "Clay Bricks",
	stackSize = 64
}
M.STONE_BRICKS = {
	id = 010006,
	name = "stone_bricks",
	displayName = "Stone Bricks",
	stackSize = 64
}
M.WOOD_WALL = {
	id = 010007,
	name = "wood_wall",
	displayName = "Wood Wall",
	stackSize = 64
}
M.GOLD_ORE = {
	id = 010008,
	name = "gold_ore",
	displayName = "Gold Ore",
	stackSize = 64
}
M.IRON_ORE = {
	id = 010009,
	name = "iron_ore",
	displayName = "Iron Ore",
	stackSize = 64
}
M.PLATINUM_ORE = {
	id = 010010,
	name = "platinum_ore",
	displayName = "Platinum Ore",
	stackSize = 64
}
M.SILVER_ORE = {
	id = 010011,
	name = "silver_ore",
	displayName = "Silver Ore",
	stackSize = 64
}
M.WOOD_PLANKS = {
	id = 010012,
	name = "wood_planks",
	displayName = "Wood Planks",
	stackSize = 64
}

M.GOLD_INGOT = {
	id = 020008,
	name = "gold_ingot",
	displayName = "Gold Ingot",
	stackSize = 64
}
M.IRON_INGOT = {
	id = 020009,
	name = "iron_ingot",
	displayName = "Iron Ingot",
	stackSize = 64
}
M.PLATINUM_INGOT = {
	id = 020010,
	name = "platinum_ingot",
	displayName = "Platinum Ingot",
	stackSize = 64
}
M.SILVER_INGOT = {
	id = 020011,
	name = "silver_ingot",
	displayName = "Silver Ingot",
	stackSize = 64
}

M.WOOD_PICKAXE = {
	id = 030001,
	name = "wood_pickaxe",
	displayName = "Wood Pickaxe",
	stackSize = 64
}

M.STONE_PICKAXE = {
	id = 030002,
	name = "stone_pickaxe",
	displayName = "Stone Pickaxe",
	stackSize = 64
}

M.ALL_ITEMS = {}
M.ALL_ITEMS[M.NONE.id] = M.NONE
M.ALL_ITEMS[M.DIRT.id] = M.DIRT
M.ALL_ITEMS[M.STONE.id] = M.STONE
M.ALL_ITEMS[M.SAND.id] = M.SAND
M.ALL_ITEMS[M.CLAY.id] = M.CLAY
M.ALL_ITEMS[M.CLAY_BRICKS.id] = M.CLAY_BRICKS
M.ALL_ITEMS[M.STONE_BRICKS.id] = M.STONE_BRICKS
M.ALL_ITEMS[M.WOOD_WALL.id] = M.WOOD_WALL
M.ALL_ITEMS[M.WOOD_PICKAXE.id] = M.WOOD_PICKAXE
M.ALL_ITEMS[M.STONE_PICKAXE.id] = M.STONE_PICKAXE
M.ALL_ITEMS[M.WOOD_PLANKS.id] = M.WOOD_PLANKS
M.ALL_ITEMS[M.GOLD_ORE.id] = M.GOLD_ORE
M.ALL_ITEMS[M.IRON_ORE.id] = M.IRON_ORE
M.ALL_ITEMS[M.PLATINUM_ORE.id] = M.PLATINUM_ORE
M.ALL_ITEMS[M.SILVER_ORE.id] = M.SILVER_ORE
M.ALL_ITEMS[M.GOLD_INGOT.id] = M.GOLD_INGOT
M.ALL_ITEMS[M.IRON_INGOT.id] = M.IRON_INGOT
M.ALL_ITEMS[M.PLATINUM_INGOT.id] = M.PLATINUM_INGOT
M.ALL_ITEMS[M.SILVER_INGOT.id] = M.SILVER_INGOT

M.PLACEABLE_ID_PREFIX = 01
M.PLACEABLE = {}
M.PLACEABLE[M.DIRT.id] = M.DIRT
M.PLACEABLE[M.STONE.id] = M.STONE
M.PLACEABLE[M.SAND.id] = M.SAND
M.PLACEABLE[M.CLAY.id] = M.CLAY
M.PLACEABLE[M.CLAY_BRICKS.id] = M.CLAY_BRICKS
M.PLACEABLE[M.STONE_BRICKS.id] = M.STONE_BRICKS
M.PLACEABLE[M.WOOD_WALL.id] = M.WOOD_WALL
M.PLACEABLE[M.GOLD_ORE.id] = M.GOLD_ORE
M.PLACEABLE[M.IRON_ORE.id] = M.IRON_ORE
M.PLACEABLE[M.PLATINUM_ORE.id] = M.PLATINUM_ORE
M.PLACEABLE[M.SILVER_ORE.id] = M.SILVER_ORE

M.SMELTABLE_ID_PREFIX = 02
M.SMELTABLE = {}
M.SMELTABLE[M.GOLD_INGOT.id] = M.GOLD_INGOT
M.SMELTABLE[M.IRON_INGOT.id] = M.IRON_INGOT
M.SMELTABLE[M.PLATINUM_INGOT.id] = M.PLATINUM_INGOT
M.SMELTABLE[M.SILVER_INGOT.id] = M.SILVER_INGOT

M.TOOL_ID_PREFIX = 03
M.TOOL = {}
M.TOOL[M.WOOD_PICKAXE.id] = M.WOOD_PICKAXE
M.TOOL[M.STONE_PICKAXE.id] = M.STONE_PICKAXE

M.CRAFTABLE = {}
M.CRAFTABLE[M.WOOD_PICKAXE.id] = M.WOOD_PICKAXE
M.CRAFTABLE[M.STONE_PICKAXE.id] = M.STONE_PICKAXE
M.CRAFTABLE[M.CLAY_BRICKS.id] = M.CLAY_BRICKS
M.CRAFTABLE[M.STONE_BRICKS.id] = M.STONE_BRICKS
M.CRAFTABLE[M.WOOD_WALL.id] = M.WOOD_WALL

---------------
-- End Items --
---------------

return M