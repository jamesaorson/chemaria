local constants = require "modules.constants"

local M = {}

---------------
-- Inventory --
---------------

local inventory = {}
for i = 1, constants.INVENTORY_SIZE.rows do
	inventory[i] = {}
end

function M.get_inventory()
	return inventory
end

-------------------
-- End Inventory --
-------------------


-------------
-- Toolbar --
-------------

local toolbar = {}

function M.get_toolbar()
	return toolbar
end

function M.update_toolbar_item(item)
	toolbar[item.index] = item
end

-----------------
-- End Toolbar --
-----------------

return M