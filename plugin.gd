tool
extends EditorPlugin

const Actions = preload("./Actions.gd")

const PLUGIN_NAME = 'Console'
const PLUGIN_PATH = 'res://addons/godot3-ingame-terminal/console/src/Console.tscn'

#const ACTIONS = [
#	Actions.console_toggle_props,
#	Actions.console_autocomplete_props,
#	Actions.console_history_up_props,
#	Actions.console_history_down_props
#]


func _enter_tree():
	self.add_autoload_singleton(PLUGIN_NAME, PLUGIN_PATH)
	

func _exit_tree():
	self.remove_autoload_singleton(PLUGIN_NAME)
