Block = {
	chunk = nil,
	position = vmath.vector3(),
	type = nil
}

function Block:new()
	local block = {}
	setmetatable(block, self)
	self.__index = self
	block.chunk = nil
	block.position = vmath.vector3()
	block.type = nil
	return block
end