@tool
extends Control

var viewport: Control = preload("./Console.tscn").instantiate()
@onready var container = $Container
# @var  bool
#var consume_input = true
# Called when the node enters the scene tree for the first time.
func _ready():
	#var viewport = load("res://addons/godot4-ingame-terminal/src/Console.tscn").instantiate()
	#var aa = viewport.new()
	if viewport is Control:
		viewport.welcome_message = "Hello"
		add_child(viewport)
		viewport.set("welcome_message", "Hello")
		print(viewport.get("welcome_message"))
		#print(get_node("Console/Container").welcome_message)
		#get_node("Console/Container").welcome_message = "hello"
		


	
	#_viewport.welcome
	#add_child(_viewport)
	
	#_viewport.render_target_update_mode = Viewport.UPDATE_ALWAYS


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
