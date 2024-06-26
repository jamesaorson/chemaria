local WORLD = {}

WORLD.BLOCK_SIZE = 32
WORLD.BASE_WORLD_SIZE = vmath.vector3(10, 100, 0)
WORLD.WORLD_SIZE = vmath.vector3()
WORLD.CHUNK_SIZE = 12
WORLD.RENDER_DISTANCE = vmath.vector3(5, 3, 0)
WORLD.SEED = nil
WORLD.SCALE = nil

WORLD.SCALES = {
	SMALL = 3,
	MEDIUM = 5,
	LARGE = 10
}

return WORLD