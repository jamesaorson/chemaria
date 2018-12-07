local M = {}

-----------
-- Color --
-----------

function M.convert_rgba_to_native_range(r, g, b, a)
	return M.convert_rgba_vector_to_native_range(vmath.vector4(r, g, b, a))
end

function M.convert_rgba_vector_to_native_range(rgba)
	return vmath.vector4(rgba.x / 255, rgba.y / 255, rgba.z / 255, rgba.w)
end

---------------
-- End Color --
---------------


----------
-- Math --
----------

function M.round(num)
	if num > 0 then
		return math.floor(num + 0.5)
	else
		return math.ceil(num - 0.5)
	end
end

--------------
-- End Math --
--------------

return M