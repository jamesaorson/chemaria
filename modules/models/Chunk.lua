Chunk = {
	blocks = {},
	is_rendered = false,
	position = vmath.vector3()
}

function Chunk.add_block(self, block_to_add)
	if not self.blocks then
		self.blocks = {}
	end
	if not self.blocks[block_to_add.position.x] then
		self.blocks[block_to_add.position.x] = {}
	end
	self.blocks[block_to_add.position.x][block_to_add.position.y] = block_to_add
	block_to_add.chunk = self.position
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
	is_removed  = false
	if self.blocks[position.x] and self.blocks[position.x][position.y] then
		self.blocks[position.x][position.y] = nil
		is_removed = true
	end
	return is_removed
end