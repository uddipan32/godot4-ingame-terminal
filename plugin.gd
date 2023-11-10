@tool
extends EditorPlugin

#const Actions = preload("./Actions.gd")

const PLUGIN_NAME = 'Console'
const PLUGIN_PATH = 'res://addons/godot4-ingame-terminal/src/Console.tscn'


var dock 
#const ACTIONS = [
#	Actions.console_toggle_props,
#	Actions.console_autocomplete_props,
#	Actions.console_history_up_props,
#	Actions.console_history_down_props
#]


func _enter_tree():
	dock = preload("res://addons/godot4-ingame-terminal/src/Console.tscn").instantiate()
	
	add_control_to_dock(DOCK_SLOT_LEFT_UL, dock)
	
	#self.add_custom_type("Console", PLUGIN_NAME, preload("res://addons/godot4-ingame-terminal/src/Console.gd"), preload("res://icon.png"))
	#self.add_autoload_singleton(PLUGIN_NAME, PLUGIN_PATH)
	

func _exit_tree():
	remove_control_from_docks(dock)
	#self.remove_custom_type(PLUGIN_NAME)
	#self.remove_autoload_singleton(PLUGIN_NAME)
