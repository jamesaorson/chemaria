local constants = require "modules.constants"

local M = {}

local inventory = {}
local toolbar = {}

for i = 1, constants.INVENTORY_SIZE.rows do
	inventory[i] = {}
end

function M.update_toolbar_item(item)
	toolbar[item.index] = item
end

function M.get_inventory()
	return inventory
end

function M.get_toolbar()
	return toolbar
end

return M