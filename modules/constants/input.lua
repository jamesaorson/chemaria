local M = {}

M.QUIT = hash("quit")

M.UP = hash("up")
M.DOWN = hash("down")
M.LEFT = hash("left")
M.RIGHT = hash("right")
M.JUMP = hash("jump")

M.TOGGLE_PROFILE = hash("toggle_profile")
M.TOGGLE_FULLSCREEN = hash("toggle_fullscreen")

M.TOGGLE_INVENTORY = hash("toggle_inventory")

M.INVENTORY_SWITCH = {}
for i = 1, 10 do 
	M.INVENTORY_SWITCH[i] = hash("inventory_switch_" .. i)
end

M.TOGGLE_CRAFTING_MENU = hash("toggle_crafting_menu")

M.BACKSPACE = hash("backspace")
M.UI_EXIT = hash("ui_exit")

M.LEFT_CLICK = hash("left_click")
M.RIGHT_CLICK = hash("right_click")

M.MOUSE_WHEEL_UP = hash("mouse_wheel_up")
M.MOUSE_WHEEL_DOWN = hash("mouse_wheel_down")

M.SCROLL_UP = hash("scroll_up")
M.SCROLL_DOWN = hash("scroll_down")

M.TOUCH = hash("touch")

return M