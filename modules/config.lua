local M = {}

------------
-- Camera --
------------

M.CAMERA_DEADZONE = { left = 25, right = 0, bottom = 25, top = 0 }
M.CAMERA_ZOOM_LEVEL = { zoom = 1.25 }

----------------
-- End Camera --
----------------


----------
-- Save --
----------

M.SAVE_PATH = {
	folder = "Chemaria",
	name = "world_save"
}

--------------
-- End Save --
--------------


-----------
-- Video --
-----------

M.IS_FULLSCREEN = true

---------------
-- End Video --
---------------

return M