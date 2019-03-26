local M = {}

-----------
-- Items --
-----------

M.NONE = {
	id = 000000,
	name = "none"
}

M.DIRT = {
	id = 010001,
	stackSize = 64,
	name = "dirt"
}
M.STONE = {
	id = 010002,
	stackSize = 64,
	name = "stone"
}
M.SAND = {
	id = 010003,
	stackSize = 64,
	name = "sand"
}
M.CLAY = {
	id = 010004,
	stackSize = 64,
	name = "clay"
}
M.CLAY_BRICKS = {
	id = 010005,
	stackSize = 64,
	name = "clay_bricks"
}
M.STONE_BRICKS = {
	id = 010006,
	stackSize = 64,
	name = "stone_bricks"
}
M.WOOD_WALL = {
	id = 010007,
	stackSize = 64,
	name = "wood_wall"
}

M.WOOD_PICKAXE = {
	id = 040001,
	stackSize = 64,
	name = "wood_pickaxe"
}

M.WOOD_PLANKS = {
	id = 050001,
	stackSize = 64,
	name = "wood_planks"
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
M.ALL_ITEMS[M.WOOD_PLANKS.id] = M.WOOD_PLANKS

M.PLACEABLE_ID_PREFIX = 01
M.PLACEABLE = {}
M.PLACEABLE[M.DIRT.id] = M.DIRT
M.PLACEABLE[M.STONE.id] = M.STONE
M.PLACEABLE[M.SAND.id] = M.SAND
M.PLACEABLE[M.CLAY.id] = M.CLAY
M.PLACEABLE[M.CLAY_BRICKS.id] = M.CLAY_BRICKS
M.PLACEABLE[M.STONE_BRICKS.id] = M.STONE_BRICKS
M.PLACEABLE[M.WOOD_WALL.id] = M.WOOD_WALL

M.SMELTABLE_ID_PREFIX = 02
M.SMELTABLE = {}

M.CRAFTABLE_ID_PREFIX = 03
M.CRAFTABLE = {}
M.CRAFTABLE[M.WOOD_PICKAXE.id] = M.WOOD_PICKAXE
M.CRAFTABLE[M.CLAY_BRICKS.id] = M.CLAY_BRICKS
M.CRAFTABLE[M.STONE_BRICKS.id] = M.STONE_BRICKS
M.CRAFTABLE[M.WOOD_WALL.id] = M.WOOD_WALL

M.TOOL_ID_PREFIX = 04
M.TOOL = {}
M.TOOL[M.WOOD_PICKAXE.id] = M.WOOD_PICKAXE

M.PICKUPS_ID_PREFIX = 05
M.PICKUPS = {}
M.PICKUPS[M.WOOD_PLANKS.id] = M.WOOD_PLANKS

---------------
-- End Items --
---------------

return M