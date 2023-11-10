@tool
extends Control

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


#func _enter_tree():
	
var _viewport: Control = preload("./Console.tscn").instantiate()

# @var  bool
#var consume_input = true
# Called when the node enters the scene tree for the first time.
func _ready():
	add_child(_viewport)
	
	#_viewport.render_target_update_mode = Viewport.UPDATE_ALWAYS


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
