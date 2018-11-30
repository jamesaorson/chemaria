Block = {
	chunk = nil,
	position = vmath.vector3(),
	type = nil,
	url = nil
}

function Block:new()
	local block = {}
	setmetatable(block, self)
	self.__index = self
	block.chunk = nil
	block.position = vmath.vector3()
	block.type = nil
	block.url = nil
	return block
end