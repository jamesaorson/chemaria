World = {
	chunks = {},
	loose_pickups = {}
}

function World.add_chunk(self, chunk_to_add)
	if not self.chunks then
		self.chunks = {}
	end
	if not self.chunks[chunk_to_add.position.x] then
		self.chunks[chunk_to_add.position.x] = {}
	end
	self.chunks[chunk_to_add.position.x][chunk_to_add.position.y] = chunk_to_add
end

function World.add_loose_pickup(self, loose_pickup)
	if not self.loose_pickups then
		self.loose_pickups = {}
	end
	self.loose_pickups[loose_pickup.pickup_id] = loose_pickup
end

function World.get_chunk_at_position(self, position)
	if self.chunks[position.x] then
		return self.chunks[position.x][position.y]
	end
	return nil
end

function World.get_loose_pickup(self, loose_pickup_id)
	return self.loose_pickups[loose_pickup_id]
end

function World.remove_chunk(self, chunk_to_remove)
	return World:remove_chunk_at_position(chunk_to_remove.position)
end

function World.remove_chunk__at_position(self, position)
	is_removed  = false
	if self.chunks[position.x][position.y] then
		table.remove(self.chunks[position.x], position.y)
		if #self.chunks[position.x] == 0 then
			table.remove(self.chunks, position.x)
		end
		is_removed = true
	end
	return is_removed
end