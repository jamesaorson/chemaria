Chunk = {
	blocks = {},
	origin = vmath.vector3()
}

function Chunk:new()
	local chunk = {}
	setmetatable(chunk, self)
	self.__index = self
	chunk.blocks = {}
	chunk.origin = vmath.vector3()
	return chunk
end

function Chunk:add_block(blockToAdd)
	if not self.blocks then
		self.blocks = {}
	end
	if not self.blocks[blockToAdd.position.x] then
		self.blocks[blockToAdd.position.x] = {}
	end
	self.blocks[blockToAdd.position.x][blockToAdd.position.y] = blockToAdd
end

function Chunk:remove_block(blockToRemove)
	return Chunk:remove_block_at_position(blockToRemove.position)
end

function Chunk:remove_block_at_position(position)
	removed  = false
	pprint(position)
	if self.blocks[position.x][position.y] then
		table.remove(self.blocks[position.x], position.y)
		print(table.getn(self.blocks[position.x]))
		if table.getn(self.blocks[position.x]) == 0 then
			table.remove(self.blocks, position.x)
		end
		removed = true
	end
	return removed
end