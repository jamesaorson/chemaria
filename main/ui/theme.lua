local gooey = require "gooey.gooey"
local utils = require "gooey.themes.utils"

local M = gooey.create_theme()

local BUTTON_PRESSED = hash("button_pressed")
local BUTTON = hash("button_idle")

local CHECKBOX_CHECKED = hash("grey_boxCheckmark")
local CHECKBOX = hash("grey_box")

local RADIO_PRESSED = hash("radio_pressed")
local RADIO_CHECKED_PRESSED = hash("radio_checked_pressed")
local RADIO_CHECKED_NORMAL = hash("radio_checked_normal")
local RADIO_NORMAL = hash("radio_normal")

local function refresh_button(button)
	if button.pressed then
		gui.play_flipbook(button.node, BUTTON_PRESSED)
	else
		gui.play_flipbook(button.node, BUTTON)
	end
end

function M.button(node_id, action_id, action, fn, is_selected)
	local result = gooey.button(node_id .. "/bg", action_id, action, fn, refresh_button)
	if is_selected then
		gui.play_flipbook(gui.get_node(node_id .. "/bg"), BUTTON_PRESSED)
	end
	return result
end

local function refresh_checkbox(checkbox)
	if checkbox.checked then
		gui.play_flipbook(checkbox.node, CHECKBOX_CHECKED)
	else
		gui.play_flipbook(checkbox.node, CHECKBOX)
	end
end
function M.checkbox(node_id, action_id, action, fn)
	return gooey.checkbox(node_id .. "/box", action_id, action, fn, refresh_checkbox)
end

local function update_radiobutton(radio)
	if radio.pressed and not radio.selected then
		gui.play_flipbook(radio.node, RADIO_PRESSED)
	elseif radio.pressed and radio.selected then
		gui.play_flipbook(radio.node, RADIO_CHECKED_PRESSED)
	elseif radio.selected then
		gui.play_flipbook(radio.node, RADIO_CHECKED_NORMAL)
	else
		gui.play_flipbook(radio.node, RADIO_NORMAL)
	end
end

function M.radiogroup(group_id, action_id, action, fn)
	return gooey.radiogroup(group_id, action_id, action, fn)
end

function M.radio(node_id, group_id, action_id, action, fn)
	return gooey.radio(node_id .. "/button", group_id, action_id, action, fn, update_radiobutton)
end

local function update_input(input, config, node_id)
	if input.selected_now then
		gui.play_flipbook(gui.get_node(node_id .. "/bg"), INPUT_FOCUS)
	elseif input.deselected_now then
		gui.play_flipbook(gui.get_node(node_id .. "/bg"), INPUT)
	end

	if input.empty and not input.selected then
		gui.set_text(input.node, config and config.empty_text or "")
	end

	local cursor = gui.get_node(node_id .. "/cursor")
	if input.selected then
		gui.set_enabled(cursor, true)
		gui.set_position(cursor, vmath.vector3(input.total_width, 2, 0))
		gui.cancel_animation(cursor, gui.PROP_COLOR)
		gui.set_color(cursor, vmath.vector4(1))
		gui.animate(cursor, gui.PROP_COLOR, vmath.vector4(1, 1, 1, 0), gui.EASING_INSINE, 1.0, 0, nil, gui.PLAYBACK_LOOP_FORWARD)
	else
		gui.set_enabled(cursor, false)
		gui.cancel_animation(cursor, gui.PROP_COLOR)
	end
end

function M.input(node_id, keyboard_type, action_id, action, config, refresh_input)
	return gooey.input(node_id .. "/text", keyboard_type, action_id, action, config, function(input)
		update_input(input, config, node_id)
		if refresh_input then
			refresh_input(input)
		end
	end)
end

local function update_listitem(list, item)
	local pos = gui.get_position(item.root)
	if item.index == list.selected_item then
		pos.x = 4
		gui.play_flipbook(item.root, LIST_ITEM_SELECTED)
	elseif item.index == list.pressed_item then
		pos.x = 1
		gui.play_flipbook(item.root, LIST_ITEM_PRESSED)
	elseif item.index == list.over_item_now then
		pos.x = 1
		gui.play_flipbook(item.root, LIST_ITEM)
	elseif item.index == list.out_item_now then
		pos.x = 0
		gui.play_flipbook(item.root, LIST_ITEM)
	elseif item.index ~= list.over_item then
		pos.x = 0
		gui.play_flipbook(item.root, LIST_ITEM)
	end
	gui.set_position(item.root, pos)
end


local function update_static_list(list)
	--for _,item in ipairs(list.items) do
	--	update_listitem(list, item)
	--end
end
function M.static_list(list_id, item_ids, action_id, action, fn)
	--return gooey.static_list(list_id, list_id .. "/stencil", item_ids, action_id, action, fn, update_static_list)
end


local function update_dynamic_list(list)
	for _,item in ipairs(list.items) do
		update_listitem(list, item)
		gui.set_text(item.nodes[hash(list.id .. "/listitem_text")], tostring(item.data or "-"))
	end
end
function M.dynamic_list(list_id, data, action_id, action, fn, update_list)
	if not update_list then
		update_list = update_dynamic_list
	end
	return gooey.dynamic_list(list_id, list_id .. "/stencil", list_id .. "/listitem_bg", data, action_id, action, fn, update_list)
end


return M