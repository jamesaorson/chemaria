local CONFIG = {}

------------
-- Camera --
------------

CONFIG.CAMERA_DEADZONE = { left = 25, right = 25, bottom = 0, top = 0 }
CONFIG.CAMERA_ZOOM_LEVEL = { zoom = 1.5 }

----------------
-- End Camera --
----------------


----------screen
-- Save --
----------

CONFIG.APPNAME = "Chemaria"

--------------
-- End Save --
--------------


-----------
-- Video --
-----------

CONFIG.FULLSCREEN = true
CONFIG.SCREEN_SIZE = {
	height = 1080,
	width = 1920
}
CONFIG.VSYNC = true

---------------
-- End Video --
---------------

return CONFIG