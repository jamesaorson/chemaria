local M = {}

function M.round(num)
	if num > 0 then
		return math.floor(num + 0.5)
	else
		return math.ceil(num - 0.5)
	end
end

function M.chunk_round(num)
	if num >= 0 then
		return math.ceil(num)
	else
		return math.floor(num)
	end
end

return M