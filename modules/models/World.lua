World = {
	chunks = {}
}

function World:new()
	local world = {}
	setmetatable(world, self)
	self.__index = self
	world.chunks = {}
	return world
end

function World:add_chunk(chunkToAdd)
	if not self.chunks then
		self.chunks = {}
	end
	if not self.chunks[chunkToAdd.position.x] then
		self.chunks[chunkToAdd.position.x] = {}
	end
	self.chunks[chunkToAdd.position.x][chunkToAdd.position.y] = chunkToAdd
	chunkToAdd.world = self
end

function World:remove_chunk(chunkToRemove)
	return World:remove_chunk_at_position(chunkToRemove.position)
end

function World:remove_chunk__at_position(position)
	removed  = false
	if self.chunks[position.x][position.y] then
		table.remove(self.chunks[position.x], position.y)
		if table.getn(self.chunks[position.x]) == 0 then
			table.remove(self.chunks, position.x)
		end
		removed = true
	end
	return removed
end