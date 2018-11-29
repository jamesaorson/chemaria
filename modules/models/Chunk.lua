local constants = require "modules.constants"

Chunk = {
	blocks = {},
	position = vmath.vector3(),
	world = nil
}

function Chunk:new()
	local chunk = {}
	setmetatable(chunk, self)
	self.__index = self
	chunk.blocks = {}
	for x = 0, constants.CHUNK_SIZE - 1 do
		for y = 0, constants.CHUNK_SIZE - 1 do
			if not chunk.blocks[x] then
				chunk.blocks[x] = {}
			end
			chunk.blocks[x][y] = nil
		end
	end
	chunk.position = vmath.vector3()
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
	blockToAdd.chunk = self
end
function Chunk:get_block_at_position(position)
	if self.blocks[position.x] then
		return self.blocks[position.x][position.y]
	end
	return nil
end

function Chunk:remove_block(blockToRemove)
	return Chunk:remove_block_at_position(blockToRemove.position)
end

function Chunk:remove_block_at_position(position)
	removed  = false
	if self.blocks[position.x][position.y] then
		self.blocks[position.x][position.y] = nil
		removed = true
	end
	return removed
end