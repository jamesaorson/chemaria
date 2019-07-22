local MESSAGES = {}

MESSAGES.CRAFT = hash("craft")
MESSAGES.CREATE_LOOSE_PICKUP = hash("create_loose_pickup")
MESSAGES.FURNACE = hash("furnace")
MESSAGES.MINE_BLOCK = hash("mine_block")
MESSAGES.PICKUP = hash("pickup")
MESSAGES.PLACE_BLOCK = hash("place_block")
MESSAGES.PROXY_LOADED = hash("proxy_loaded")
MESSAGES.QUIT_GAME = hash("quit_game")
MESSAGES.SAVE_GAME = hash("save_game")
MESSAGES.SWITCH_PROXY = hash("switch_proxy")
MESSAGES.SWITCH_SELECTED_INVENTORY_ITEM = hash("switch_selected_inventory_item")
MESSAGES.SWITCH_SELECTED_TOOLBAR_ITEM = hash("switch_selected_toolbar_item")
MESSAGES.TRIGGER_RESPONSE = hash("trigger_response")
MESSAGES.UPDATE_CHUNK_RENDER = hash("update_chunk_render")
MESSAGES.UPDATE_INVENTORY = hash("update_inventory")
MESSAGES.UPDATE_RECIPE_LIST = hash("update_recipe_list")
MESSAGES.UPDATE_TOOLBAR = hash("update_toolbar")
MESSAGES.UPDATE_TOOLBAR_ITEM = hash("update_toolbar_item")

return MESSAGES