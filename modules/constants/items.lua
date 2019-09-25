local ITEMS = {}

-----------
-- Items --
-----------

ITEMS.NONE = {
	id = 000000,
	name = "none",
	display_name = "None",
	holding_offset = vmath.vector3(),
	stack_size = 0
}

ITEMS.DIRT = {
	id = 010001,
	max_durability = 2,
	name = "dirt",
	display_name = "Dirt",
	holding_offset = vmath.vector3(),
	stack_size = 64
}
ITEMS.STONE = {
	id = 010002,
	max_durability = 4,
	name = "stone",
	display_name = "Stone",
	holding_offset = vmath.vector3(),
	stack_size = 64
}
ITEMS.SAND = {
	id = 010003,
	max_durability = 1,
	name = "sand",
	display_name = "Sand",
	holding_offset = vmath.vector3(),
	stack_size = 64
}
ITEMS.CLAY = {
	id = 010004,
	max_durability = 3,
	name = "clay",
	display_name = "Clay",
	holding_offset = vmath.vector3(),
	stack_size = 64
}
ITEMS.CLAY_BRICKS = {
	id = 010005,
	max_durability = 4,
	name = "clay_bricks",
	display_name = "Clay Bricks",
	holding_offset = vmath.vector3(),
	stack_size = 64
}
ITEMS.STONE_BRICKS = {
	id = 010006,
	max_durability = 6,
	name = "stone_bricks",
	display_name = "Stone Bricks",
	holding_offset = vmath.vector3(),
	stack_size = 64
}
ITEMS.WOOD_WALL = {
	id = 010007,
	max_durability = 3,
	name = "wood_wall",
	display_name = "Wood Wall",
	holding_offset = vmath.vector3(),
	stack_size = 64
}

ITEMS.WOOD_PLANKS = {
	id = 010012,
	name = "wood_planks",
	display_name = "Wood Planks",
	holding_offset = vmath.vector3(),
	stack_size = 64
}
ITEMS.FURNACE = {
	id = 010013,
	max_durability = 8,
	name = "furnace",
	display_name = "Furnace",
	holding_offset = vmath.vector3(),
	stack_size = 1
}

ITEMS.GOLD_INGOT = {
	id = 020008,
	name = "gold_ingot",
	display_name = "Gold Ingot",
	holding_offset = vmath.vector3(),
	stack_size = 64
}
ITEMS.IRON_INGOT = {
	id = 020009,
	name = "iron_ingot",
	display_name = "Iron Ingot",
	holding_offset = vmath.vector3(),
	stack_size = 64
}
ITEMS.PLATINUM_INGOT = {
	id = 020010,
	name = "platinum_ingot",
	display_name = "Platinum Ingot",
	holding_offset = vmath.vector3(),
	stack_size = 64
}
ITEMS.SILVER_INGOT = {
	id = 020011,
	name = "silver_ingot",
	display_name = "Silver Ingot",
	holding_offset = vmath.vector3(),
	stack_size = 64
}

ITEMS.WOOD_PICKAXE = {
	id = 030001,
	name = "wood_pickaxe",
	display_name = "Wood Pickaxe",
	holding_offset = vmath.vector3(9, 12, 0),
	miningPower = 2,
	stack_size = 64
}

ITEMS.STONE_PICKAXE = {
	id = 030002,
	name = "stone_pickaxe",
	display_name = "Stone Pickaxe",
	holding_offset = vmath.vector3(9, 12, 0),
	miningPower = 4,
	stack_size = 64
}

ITEMS.GOLD_ORE = {
	id = 040008,
	max_durability = 3,
	name = "gold_ore",
	display_name = "Gold Ore",
	holding_offset = vmath.vector3(),
	stack_size = 64
}
ITEMS.IRON_ORE = {
	id = 040009,
	max_durability = 6,
	name = "iron_ore",
	display_name = "Iron Ore",
	holding_offset = vmath.vector3(),
	stack_size = 64
}
ITEMS.PLATINUM_ORE = {
	id = 040010,
	max_durability = 6,
	name = "platinum_ore",
	display_name = "Platinum Ore",
	holding_offset = vmath.vector3(),
	stack_size = 64
}
ITEMS.SILVER_ORE = {
	id = 040011,
	max_durability = 6,
	name = "silver_ore",
	display_name = "Silver Ore",
	holding_offset = vmath.vector3(),
	stack_size = 64
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