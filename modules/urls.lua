local M = {}

function M.get_factory_url(objectName)
	return "/"..objectName.."_factory#"..objectName.."_factory"
end

function M.url_hash_to_string(hashToConvert)
	return string.sub(tostring(hashToConvert), 7, #tostring(hashToConvert) - 1)
end

return M