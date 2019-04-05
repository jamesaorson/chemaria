local M = {}

-----------
-- Items --
-----------

M.NONE = {
	id = 000000,
	name = "none"
}

M.DIRT = {
	id = 010001
}
M.STONE = {
	id = 010002
}
M.SAND = {
	id = 010003
}
M.CLAY = {
	id = 010004
}
M.CLAY_BRICKS = {
	id = 010005
}
M.STONE_BRICKS = {
	id = 010006
}
M.WOOD_WALL = {
	id = 010007
}

M.GOLD_ORE = {
	id = 020001
}
M.IRON_ORE = {
	id = 020002
}
M.PLATINUM_ORE = {
	id = 020003
}
M.SILVER_ORE = {
	id = 020004
}

M.WOOD_PICKAXE = {
	id = 040001
}

M.WOOD_PLANKS = {
	id = 050001
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
M.ALL_ITEMS[M.GOLD_ORE.id] = M.GOLD_ORE
M.ALL_ITEMS[M.IRON_ORE.id] = M.IRON_ORE
M.ALL_ITEMS[M.PLATINUM_ORE.id] = M.PLATINUM_ORE
M.ALL_ITEMS[M.SILVER_ORE.id] = M.SILVER_ORE

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
M.SMELTABLE[M.GOLD_ORE.id] = M.GOLD_ORE
M.SMELTABLE[M.IRON_ORE.id] = M.IRON_ORE
M.SMELTABLE[M.PLATINUM_ORE.id] = M.PLATINUM_ORE
M.SMELTABLE[M.SILVER_ORE.id] = M.SILVER_ORE

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


---------------
-- Item Info --
---------------

M.ITEM_INFO = {}
M.ITEM_INFO[M.NONE.id] = {
	name = "none",
	displayName = "None",
	stackSize = 64
}
M.ITEM_INFO[M.DIRT.id] = {
	name = "dirt",
	displayName = "Dirt",
	stackSize = 64
}
M.ITEM_INFO[M.STONE.id] = {
	name = "stone",
	displayName = "Stone",
	stackSize = 64
}
M.ITEM_INFO[M.SAND.id] = {
	name = "sand",
	displayName = "Sand",
	stackSize = 64
}
M.ITEM_INFO[M.CLAY.id] = {
	name = "clay",
	displayName = "Clay",
	stackSize = 64
}
M.ITEM_INFO[M.CLAY_BRICKS.id] = {
	name = "clay_bricks",
	displayName = "Clay Bricks",
	stackSize = 64
}
M.ITEM_INFO[M.STONE_BRICKS.id] = {
	name = "stone_bricks",
	displayName = "Stone Bricks",
	stackSize = 64
}
M.ITEM_INFO[M.WOOD_WALL.id] = {
	name = "wood_wall",
	displayName = "Wood Wall",
	stackSize = 64
}
M.ITEM_INFO[M.WOOD_PICKAXE.id] = {
	name = "wood_pickaxe",
	displayName = "Wood Pickaxe",
	stackSize = 64
}
M.ITEM_INFO[M.WOOD_PLANKS.id] = {
	name = "wood_planks",
	displayName = "Wood Planks",
	stackSize = 64
}
M.ITEM_INFO[M.GOLD_ORE.id] = {
	name = "gold_ore",
	displayName = "Gold Ore",
	stackSize = 64
}
M.ITEM_INFO[M.IRON_ORE.id] = {
	name = "iron_ore",
	displayName = "Iron Ore",
	stackSize = 64
}
M.ITEM_INFO[M.PLATINUM_ORE.id] = {
	name = "platinum_ore",
	displayName = "Platinum Ore",
	stackSize = 64
}
M.ITEM_INFO[M.SILVER_ORE.id] = {
	name = "silver_ore",
	displayName = "Silver Ore",
	stackSize = 64
}

-------------------
-- End Item Info --
-------------------

return M