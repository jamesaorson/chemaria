Chunk = {
	blocks = {},
	isRendered = false,
	position = vmath.vector3()
}

function Chunk.add_block(self, blockToAdd)
	if not self.blocks then
		self.blocks = {}
	end
	if not self.blocks[blockToAdd.position.x] then
		self.blocks[blockToAdd.position.x] = {}
	end
	self.blocks[blockToAdd.position.x][blockToAdd.position.y] = blockToAdd
	blockToAdd.chunk = self.position
end

function Chunk.get_block_at_position(self, position)
	if self.blocks[position.x] then
		return self.blocks[position.x][position.y]
	end
	return nil
end

function Chunk.remove_block(self, blockToRemove)
	return Chunk:remove_block_at_position(blockToRemove.position)
end

function Chunk.remove_block_at_position(self, position)
	removed  = false
	if self.blocks[position.x] and self.blocks[position.x][position.y] then
		self.blocks[position.x][position.y] = nil
		removed = true
	end
	return removed
end