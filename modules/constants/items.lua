local ITEMS = {}

-----------
-- Items --
-----------

ITEMS.NONE = {
	id = 000000,
	name = "none",
	displayName = "None",
	holdingOffset = vmath.vector3(),
	stackSize = 0
}

ITEMS.DIRT = {
	id = 010001,
	maxDurability = 2,
	name = "dirt",
	displayName = "Dirt",
	holdingOffset = vmath.vector3(),
	stackSize = 64
}
ITEMS.STONE = {
	id = 010002,
	maxDurability = 4,
	name = "stone",
	displayName = "Stone",
	holdingOffset = vmath.vector3(),
	stackSize = 64
}
ITEMS.SAND = {
	id = 010003,
	maxDurability = 1,
	name = "sand",
	displayName = "Sand",
	holdingOffset = vmath.vector3(),
	stackSize = 64
}
ITEMS.CLAY = {
	id = 010004,
	maxDurability = 3,
	name = "clay",
	displayName = "Clay",
	holdingOffset = vmath.vector3(),
	stackSize = 64
}
ITEMS.CLAY_BRICKS = {
	id = 010005,
	maxDurability = 4,
	name = "clay_bricks",
	displayName = "Clay Bricks",
	holdingOffset = vmath.vector3(),
	stackSize = 64
}
ITEMS.STONE_BRICKS = {
	id = 010006,
	maxDurability = 6,
	name = "stone_bricks",
	displayName = "Stone Bricks",
	holdingOffset = vmath.vector3(),
	stackSize = 64
}
ITEMS.WOOD_WALL = {
	id = 010007,
	maxDurability = 3,
	name = "wood_wall",
	displayName = "Wood Wall",
	holdingOffset = vmath.vector3(),
	stackSize = 64
}

ITEMS.WOOD_PLANKS = {
	id = 010012,
	name = "wood_planks",
	displayName = "Wood Planks",
	holdingOffset = vmath.vector3(),
	stackSize = 64
}
ITEMS.FURNACE = {
	id = 010013,
	maxDurability = 8,
	name = "furnace",
	displayName = "Furnace",
	holdingOffset = vmath.vector3(),
	stackSize = 1
}

ITEMS.GOLD_INGOT = {
	id = 020008,
	name = "gold_ingot",
	displayName = "Gold Ingot",
	holdingOffset = vmath.vector3(),
	stackSize = 64
}
ITEMS.IRON_INGOT = {
	id = 020009,
	name = "iron_ingot",
	displayName = "Iron Ingot",
	holdingOffset = vmath.vector3(),
	stackSize = 64
}
ITEMS.PLATINUM_INGOT = {
	id = 020010,
	name = "platinum_ingot",
	displayName = "Platinum Ingot",
	holdingOffset = vmath.vector3(),
	stackSize = 64
}
ITEMS.SILVER_INGOT = {
	id = 020011,
	name = "silver_ingot",
	displayName = "Silver Ingot",
	holdingOffset = vmath.vector3(),
	stackSize = 64
}

ITEMS.WOOD_PICKAXE = {
	id = 030001,
	name = "wood_pickaxe",
	displayName = "Wood Pickaxe",
	holdingOffset = vmath.vector3(9, 12, 0),
	miningPower = 2,
	stackSize = 64
}

ITEMS.STONE_PICKAXE = {
	id = 030002,
	name = "stone_pickaxe",
	displayName = "Stone Pickaxe",
	holdingOffset = vmath.vector3(9, 12, 0),
	miningPower = 4,
	stackSize = 64
}

ITEMS.GOLD_ORE = {
	id = 040008,
	maxDurability = 3,
	name = "gold_ore",
	displayName = "Gold Ore",
	holdingOffset = vmath.vector3(),
	stackSize = 64
}
ITEMS.IRON_ORE = {
	id = 040009,
	maxDurability = 6,
	name = "iron_ore",
	displayName = "Iron Ore",
	holdingOffset = vmath.vector3(),
	stackSize = 64
}
ITEMS.PLATINUM_ORE = {
	id = 040010,
	maxDurability = 6,
	name = "platinum_ore",
	displayName = "Platinum Ore",
	holdingOffset = vmath.vector3(),
	stackSize = 64
}
ITEMS.SILVER_ORE = {
	id = 040011,
	maxDurability = 6,
	name = "silver_ore",
	displayName = "Silver Ore",
	holdingOffset = vmath.vector3(),
	stackSize = 64
}

ITEMS.ALL_ITEMS = {}
ITEMS.ALL_ITEMS[ITEMS.NONE.id] = ITEMS.NONE
ITEMS.ALL_ITEMS[ITEMS.DIRT.id] = ITEMS.DIRT
ITEMS.ALL_ITEMS[ITEMS.STONE.id] = ITEMS.STONE
ITEMS.ALL_ITEMS[ITEMS.SAND.id] = ITEMS.SAND
ITEMS.ALL_ITEMS[ITEMS.CLAY.id] = ITEMS.CLAY
ITEMS.ALL_ITEMS[ITEMS.CLAY_BRICKS.id] = ITEMS.CLAY_BRICKS
ITEMS.ALL_ITEMS[ITEMS.STONE_BRICKS.id] = ITEMS.STONE_BRICKS
ITEMS.ALL_ITEMS[ITEMS.WOOD_WALL.id] = ITEMS.WOOD_WALL
ITEMS.ALL_ITEMS[ITEMS.WOOD_PICKAXE.id] = ITEMS.WOOD_PICKAXE
ITEMS.ALL_ITEMS[ITEMS.STONE_PICKAXE.id] = ITEMS.STONE_PICKAXE
ITEMS.ALL_ITEMS[ITEMS.WOOD_PLANKS.id] = ITEMS.WOOD_PLANKS
ITEMS.ALL_ITEMS[ITEMS.GOLD_ORE.id] = ITEMS.GOLD_ORE
ITEMS.ALL_ITEMS[ITEMS.IRON_ORE.id] = ITEMS.IRON_ORE
ITEMS.ALL_ITEMS[ITEMS.PLATINUM_ORE.id] = ITEMS.PLATINUM_ORE
ITEMS.ALL_ITEMS[ITEMS.SILVER_ORE.id] = ITEMS.SILVER_ORE
ITEMS.ALL_ITEMS[ITEMS.GOLD_INGOT.id] = ITEMS.GOLD_INGOT
ITEMS.ALL_ITEMS[ITEMS.IRON_INGOT.id] = ITEMS.IRON_INGOT
ITEMS.ALL_ITEMS[ITEMS.PLATINUM_INGOT.id] = ITEMS.PLATINUM_INGOT
ITEMS.ALL_ITEMS[ITEMS.SILVER_INGOT.id] = ITEMS.SILVER_INGOT
ITEMS.ALL_ITEMS[ITEMS.FURNACE.id] = ITEMS.FURNACE

ITEMS.PLACEABLE_ID_PREFIX = 01
ITEMS.PLACEABLE = {}
ITEMS.PLACEABLE[ITEMS.DIRT.id] = ITEMS.DIRT
ITEMS.PLACEABLE[ITEMS.STONE.id] = ITEMS.STONE
ITEMS.PLACEABLE[ITEMS.SAND.id] = ITEMS.SAND
ITEMS.PLACEABLE[ITEMS.CLAY.id] = ITEMS.CLAY
ITEMS.PLACEABLE[ITEMS.CLAY_BRICKS.id] = ITEMS.CLAY_BRICKS
ITEMS.PLACEABLE[ITEMS.STONE_BRICKS.id] = ITEMS.STONE_BRICKS
ITEMS.PLACEABLE[ITEMS.WOOD_WALL.id] = ITEMS.WOOD_WALL
ITEMS.PLACEABLE[ITEMS.GOLD_ORE.id] = ITEMS.GOLD_ORE
ITEMS.PLACEABLE[ITEMS.IRON_ORE.id] = ITEMS.IRON_ORE
ITEMS.PLACEABLE[ITEMS.PLATINUM_ORE.id] = ITEMS.PLATINUM_ORE
ITEMS.PLACEABLE[ITEMS.SILVER_ORE.id] = ITEMS.SILVER_ORE
ITEMS.PLACEABLE[ITEMS.FURNACE.id] = ITEMS.FURNACE

ITEMS.SMELTABLE_ID_PREFIX = 02
ITEMS.SMELTABLE = {}
ITEMS.SMELTABLE[ITEMS.GOLD_INGOT.id] = ITEMS.GOLD_INGOT
ITEMS.SMELTABLE[ITEMS.IRON_INGOT.id] = ITEMS.IRON_INGOT
ITEMS.SMELTABLE[ITEMS.PLATINUM_INGOT.id] = ITEMS.PLATINUM_INGOT
ITEMS.SMELTABLE[ITEMS.SILVER_INGOT.id] = ITEMS.SILVER_INGOT

ITEMS.TOOL_ID_PREFIX = 03
ITEMS.TOOL = {}
ITEMS.TOOL[ITEMS.WOOD_PICKAXE.id] = ITEMS.WOOD_PICKAXE
ITEMS.TOOL[ITEMS.STONE_PICKAXE.id] = ITEMS.STONE_PICKAXE

ITEMS.ORE_ID_PREFIX = 04
ITEMS.ORE = {}
ITEMS.ORE[ITEMS.GOLD_ORE.id] = ITEMS.GOLD_ORE
ITEMS.ORE[ITEMS.IRON_ORE.id] = ITEMS.IRON_ORE
ITEMS.ORE[ITEMS.PLATINUM_ORE.id] = ITEMS.PLATINUM_ORE
ITEMS.ORE[ITEMS.SILVER_ORE.id] = ITEMS.SILVER_ORE

ITEMS.CRAFTABLE = {}
ITEMS.CRAFTABLE[ITEMS.WOOD_PICKAXE.id] = ITEMS.WOOD_PICKAXE
ITEMS.CRAFTABLE[ITEMS.STONE_PICKAXE.id] = ITEMS.STONE_PICKAXE
ITEMS.CRAFTABLE[ITEMS.CLAY_BRICKS.id] = ITEMS.CLAY_BRICKS
ITEMS.CRAFTABLE[ITEMS.STONE_BRICKS.id] = ITEMS.STONE_BRICKS
ITEMS.CRAFTABLE[ITEMS.WOOD_WALL.id] = ITEMS.WOOD_WALL
ITEMS.CRAFTABLE[ITEMS.FURNACE.id] = ITEMS.FURNACE

---------------
-- End Items --
---------------

return ITEMS