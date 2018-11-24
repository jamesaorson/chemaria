local M = {}

function M.get_factory_url(object_name)
	return "/"..object_name.."_factory#"..object_name.."_factory"
end

return M