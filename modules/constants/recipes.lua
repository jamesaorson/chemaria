local item_constants = require "modules.constants.items"

local M = {}

M.WOOD_PICKAXE = {
	itemId = item_constants.WOOD_PICKAXE.id,
	components = {
		{
			id = item_constants.WOOD_PLANKS.id,
			requirement = 120
		},
		{
			id = item_constants.STONE_BRICKS.id,
			requirement = 96
		}
	}
}

return M