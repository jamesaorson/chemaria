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
	table.insert(self.blocks, blockToAdd)
end

function Chunk:remove_block(blockToRemove)
	removed  = false
	for i, block in ipairs(self.blocks) do
		if block == blockToRemove then
			table.remove(self.blocks, i)
			removed = true
			break
		end
	end

	return removed
end

function Chunk:remove_block_at_position(position)
	removed = false
	for i, block in ipairs(self.blocks) do
		if block.position == position then
			table.remove(self.blocks, i)
			removed = true
			break
		end
	end
	return removed
end