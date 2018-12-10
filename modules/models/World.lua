World = {
	chunks = {},
	loosePickups = {}
}

function World.add_chunk(self, chunkToAdd)
	if not self.chunks then
		self.chunks = {}
	end
	if not self.chunks[chunkToAdd.position.x] then
		self.chunks[chunkToAdd.position.x] = {}
	end
	self.chunks[chunkToAdd.position.x][chunkToAdd.position.y] = chunkToAdd
end

function World.add_loose_pickup(self, loosePickup)
	if not self.loosePickups then
		self.loosePickups = {}
	end
	self.loosePickups[loosePickup.id] = loosePickup
end

function World.get_chunk_at_position(self, position)
	if self.chunks[position.x] then
		return self.chunks[position.x][position.y]
	end
	return nil
end

function World.get_loose_pickup(self, loosePickupId)
	return self.loosePickups[loosePickupId]
end

function World.remove_chunk(self, chunkToRemove)
	return World:remove_chunk_at_position(chunkToRemove.position)
end

function World.remove_chunk__at_position(self, position)
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