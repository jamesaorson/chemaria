local M = {}

local toolbar = {}

function M.add_to_toolbar(toolbarItem)
	toolbar[toolbarItem.index] = toolbarItem
end

function M.get_toolbar()
	return toolbar
end

return M