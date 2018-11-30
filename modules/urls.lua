local M = {}

function M.get_factory_url(objectName)
	return "/"..objectName.."_factory#"..objectName.."_factory"
end

return M