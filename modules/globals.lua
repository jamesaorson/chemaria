local GLOBALS = {}

---------------
-- Inventory --
---------------

local inventory = {}

function GLOBALS.get_inventory()
	return inventory
end

function GLOBALS.update_inventory_item(item)
	inventory[item.index] = item
end

-------------------
-- End Inventory --
-------------------


-------------
-- Toolbar --
-------------

local toolbar = {}

function GLOBALS.get_toolbar()
	return toolbar
end

function GLOBALS.update_toolbar_item(item)
	toolbar[item.index] = item
end

-----------------
-- End Toolbar --
-----------------


-----------
-- World --
-----------

GLOBALS.currentChunk = nil
GLOBALS.previousChunk = nil
GLOBALS.saveFileName = nil
GLOBALS.worldSeed = nil

---------------
-- End World --
---------------

return GLOBALS