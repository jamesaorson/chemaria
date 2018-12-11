Set = {}

function Set.union(a, b)
	local result = {}
	for key, value in pairs(a) do
		result[key] = value
	end
	for key, value in pairs(b) do
		result[key] = value
	end
	return result
end

function Set.intersection(a, b)
	local result = {}
	for key in pairs(a) do
		result[key] = b[key]
	end
	return result
end

function Set.subtraction(a, b, comparisonKey)
	local result = {}
	local count = 0
	for key, value in pairs(a) do
		result[key] = value
		count = count + 1
	end
	print(count)
	count = 0
	for key, value in pairs(b) do
		if result[key] then
			result[key] = nil
			count = count + 1
		end
	end
	print(count)
	print()
	return result
end