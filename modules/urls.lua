local M = {}

function M.get_factory_url(objectName)
	return "/"..objectName.."_factory#"..objectName.."_factory"
end

function M.get_toolbar_node_url(index)
	return "toolbar/toolbar_slot_" ..  index .. "/slot"
end

function M.get_toolbar_text_node_url(index)
	return "toolbar/toolbar_slot_" ..  index .. "/text"
end

return M