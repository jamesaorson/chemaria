local CONFIG = {}

------------
-- Camera --
------------

CONFIG.CAMERA_DEADZONE = {
	left = 25,
	right = 25,
	bottom = 0,
	top = 0
}
CONFIG.CAMERA_ZOOM_LEVEL = {
	zoom = 1.5
}

----------------
-- End Camera --
----------------


----------
-- Save --
----------

CONFIG.APP_NAME = "Chemaria"

--------------
-- End Save --
--------------


-----------
-- Video --
-----------

CONFIG.FULLSCREEN = true
CONFIG.SCREEN_SIZE = {
	width = 1920,
	height = 1080
}
CONFIG.VSYNC = true

---------------
-- End Video --
---------------

return CONFIG