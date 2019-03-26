local item_constants = require "modules.constants.items"

local M = {}

-------------
-- Factory --
-------------

function M.get_factory_url(objectName)
	if type(objectName) == "number" then
		objectName = item_constants.ALL_ITEMS[objectName].name
	end
	return "/" .. objectName .. "_factory#" .. objectName .. "_factory"
end

function M.get_pickup_factory_url(objectName)
	if type(objectName) == "number" then
		objectName = item_constants.ALL_ITEMS[objectName].name
	end
	return "/" .. objectName .. "_pickup_factory#" .. objectName .. "_pickup_factory"
end

-----------------
-- End Factory --
-----------------


---------------
-- Inventory --
---------------

function M.get_inventory_node_url(index)
	return "inventory/inventory_slot_" .. index .. "/slot"
end

function M.get_inventory_text_node_url(index)
	return "inventory/inventory_slot_" .. index .. "/text"
end

-------------------
-- End Inventory --
-------------------


-------------
-- Toolbar --
-------------

function M.get_toolbar_node_url(index)
	return "toolbar/toolbar_slot_" ..  index .. "/slot"
end

function M.get_toolbar_text_node_url(index)
	return "toolbar/toolbar_slot_" ..  index .. "/text"
end

-----------------
-- End Toolbar --
-----------------


--------
-- UI --
--------

function M.get_ui_block_texture_url(blockName)
	return "block_textures/" .. blockName
end

------------
-- End UI --
------------

return M