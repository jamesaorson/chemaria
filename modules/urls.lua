local item_constants = require 'modules.constants.items'

local URLS = {}

-------------
-- Factory --
-------------

function URLS.get_factory_url(object_id)
	local object_name = nil
	if type(object_id) == 'number' then
		object_name = item_constants.ALL_ITEMS[object_id].name
	end
	return '/' .. object_name .. '_factory#' .. object_name .. '_factory'
end

function URLS.get_pickup_factory_url(object_name)
	if type(object_name) == 'number' then
		object_name = item_constants.ALL_ITEMS[object_name].name
	end
	return '/' .. object_name .. '_pickup_factory#' .. object_name .. '_pickup_factory'
end

-----------------
-- End Factory --
-----------------


---------------
-- Inventory --
---------------

function URLS.get_inventory_node_url(index)
	return 'inventory_ui/inventory_slot_' .. index .. '/slot'
end

function URLS.get_inventory_text_node_url(index)
	return 'inventory_ui/inventory_slot_' .. index .. '/text'
end

-------------------
-- End Inventory --
-------------------


-------------
-- Toolbar --
-------------

function URLS.get_toolbar_node_url(index)
	return 'toolbar_ui/toolbar_slot_' ..  index .. '/slot'
end

function URLS.get_toolbar_text_node_url(index)
	return 'toolbar_ui/toolbar_slot_' ..  index .. '/text'
end

-----------------
-- End Toolbar --
-----------------


--------
-- UI --
--------

function URLS.get_ui_block_texture_url(blockName)
	return 'block_textures/' .. blockName
end

------------
-- End UI --
------------

return URLS