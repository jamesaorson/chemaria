local INPUT = {}

INPUT.PAUSE = hash("pause")
INPUT.QUIT = hash("quit")

INPUT.UP = hash("up")
INPUT.DOWN = hash("down")
INPUT.LEFT = hash("left")
INPUT.RIGHT = hash("right")
INPUT.JUMP = hash("jump")

INPUT.TOGGLE_PAUSE_MENU = hash("toggle_pause_menu")
INPUT.TOGGLE_PROFILE = hash("toggle_profile")
INPUT.TOGGLE_FULLSCREEN = hash("toggle_fullscreen")

INPUT.TOGGLE_INVENTORY = hash("toggle_inventory")

INPUT.INVENTORY_SWITCH = {}
for i = 1, 10 do 
	INPUT.INVENTORY_SWITCH[i] = hash("inventory_switch_" .. i)
end

INPUT.TOGGLE_CRAFTING_MENU = hash("toggle_crafting_menu")

INPUT.BACKSPACE = hash("backspace")

INPUT.LEFT_CLICK = hash("left_click")
INPUT.RIGHT_CLICK = hash("right_click")

INPUT.MOUSE_WHEEL_UP = hash("mouse_wheel_up")
INPUT.MOUSE_WHEEL_DOWN = hash("mouse_wheel_down")

INPUT.SCROLL_UP = hash("scroll_up")
INPUT.SCROLL_DOWN = hash("scroll_down")

INPUT.TOUCH = hash("touch")

return INPUT