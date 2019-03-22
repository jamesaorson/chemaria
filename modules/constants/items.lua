local M = {}

-----------
-- Items --
-----------

M.NONE = {
	id = 000000,
	type = "none"
}

M.DIRT = {
	id = 010001,
	stackSize = 64,
	type = "dirt"
}
M.STONE = {
	id = 010002,
	stackSize = 64,
	type = "stone"
}
M.SAND = {
	id = 010003,
	stackSize = 64,
	type = "sand"
}
M.CLAY = {
	id = 010004,
	stackSize = 64,
	type = "clay"
}
M.CLAY_BRICKS = {
	id = 010005,
	stackSize = 64,
	type = "clay_bricks"
}
M.STONE_BRICKS = {
	id = 010006,
	stackSize = 64,
	type = "stone_bricks"
}
M.WOOD_WALL = {
	id = 010007,
	stackSize = 64,
	type = "wood_wall"
}

M.WOOD_PICKAXE = {
	id = 040001,
	stackSize = 64,
	type = "wood_pickaxe"
}

M.WOOD_PLANKS = {
	id = 050001,
	stackSize = 64,
	type = "wood_planks"
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

M.PLACEABLE = {
	id_prefix = 01
}
M.PLACEABLE[M.DIRT.id] = M.DIRT
M.PLACEABLE[M.STONE.id] = M.STONE
M.PLACEABLE[M.SAND.id] = M.SAND
M.PLACEABLE[M.CLAY.id] = M.CLAY
M.PLACEABLE[M.CLAY_BRICKS.id] = M.CLAY_BRICKS
M.PLACEABLE[M.STONE_BRICKS.id] = M.STONE_BRICKS
M.PLACEABLE[M.WOOD_WALL.id] = M.WOOD_WALL

M.SMELTABLE = {
	id_prefix = 02
}

M.CRAFTABLE = {
	id_prefix = 03
}
M.CRAFTABLE[M.WOOD_PICKAXE.id] = M.WOOD_PICKAXE
M.CRAFTABLE[M.CLAY_BRICKS.id] = M.CLAY_BRICKS
M.CRAFTABLE[M.STONE_BRICKS.id] = M.STONE_BRICKS
M.CRAFTABLE[M.WOOD_WALL.id] = M.WOOD_WALL

M.TOOL = {
	id_prefix = 04
}
M.TOOL[M.WOOD_PICKAXE.id] = M.WOOD_PICKAXE

M.PICKUPS = {
	id_prefix = 05
}
M.PICKUPS[M.WOOD_PLANKS.id] = M.WOOD_PLANKS

---------------
-- End Items --
---------------

return M