local constants = require "modules.constants"

local M = {}

local function calculate_inventory_slot_index(i, j)
	return (i - 1) * constants.INVENTORY_SIZE.rowSize + j
end

function M.get_factory_url(objectName)
	return "/"..objectName.."_factory#"..objectName.."_factory"
end

function M.get_inventory_node_url(i, j)
	return "inventory/inventory_slot_" .. calculate_inventory_slot_index(i, j) .. "/slot"
end

function M.get_inventory_text_node_url(i, j)
	return "inventory/inventory_slot_" .. calculate_inventory_slot_index(i, j) .. "/text"
end

function M.get_toolbar_node_url(index)
	return "toolbar/toolbar_slot_" ..  index .. "/slot"
end

function M.get_toolbar_text_node_url(index)
	return "toolbar/toolbar_slot_" ..  index .. "/text"
end

return M