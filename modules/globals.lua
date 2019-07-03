local M = {}

---------------
-- Inventory --
---------------

local inventory = {}

function M.get_inventory()
	return inventory
end

function M.update_inventory_item(item)
	inventory[item.index] = item
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


-----------
-- World --
-----------

M.currentChunk = nil
M.previousChunk = nil
M.saveFileName = nil
M.worldSeed = nil

---------------
-- End World --
---------------

return M