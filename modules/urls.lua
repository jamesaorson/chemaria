local item_constants = require "modules.constants.items"

local URLS = {}

-------------
-- Factory --
-------------

function URLS.get_factory_url(objectId)
	local objectName = nil
	if type(objectId) == "number" then
		objectName = item_constants.ALL_ITEMS[objectId].name
	end
	return "/" .. objectName .. "_factory#" .. objectName .. "_factory"
end

function URLS.get_pickup_factory_url(objectName)
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

function URLS.get_inventory_node_url(index)
	return "inventory_ui/inventory_slot_" .. index .. "/slot"
end

function URLS.get_inventory_text_node_url(index)
	return "inventory_ui/inventory_slot_" .. index .. "/text"
end

-------------------
-- End Inventory --
-------------------


-------------
-- Toolbar --
-------------

function URLS.get_toolbar_node_url(index)
	return "toolbar_ui/toolbar_slot_" ..  index .. "/slot"
end

function URLS.get_toolbar_text_node_url(index)
	return "toolbar_ui/toolbar_slot_" ..  index .. "/text"
end

-----------------
-- End Toolbar --
-----------------


--------
-- UI --
--------

function URLS.get_ui_block_texture_url(blockName)
	return "block_textures/" .. blockName
end

------------
-- End UI --
------------

return URLS