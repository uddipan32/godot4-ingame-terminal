@tool
extends Control

var viewport: Control = preload("./Console.tscn").instantiate()
@onready var container = $Container

# ==== EXPORT ====
@export var welcome_message: String = "Welcome to InGame Terminal \nType [color=#ffff66] [url=help]help[/url][/color] to get more information"
@export var prefix: String = "$/hello/>"
@export var prefix_color: Color = Color.WHITE


# @var  bool
#var consume_input = true
# Called when the node enters the scene tree for the first time.
func _ready():
	#var viewport = load("res://addons/godot4-ingame-terminal/src/Console.tscn").instantiate()
	#var aa = viewport.new()
	if viewport is Control:
		viewport.welcome_message = welcome_message
		viewport.prefix = "$"
		viewport.prefix_color = Color.AQUA 
		add_child(viewport)
		#viewport.set("welcome_message", "Hello")
		
		
		#print(get_node("Console/Container").welcome_message)
		#get_node("Console/Container").welcome_message = "hello"


# append string
func write(text):
	text = str(text)
	viewport.write(text)
	
func print_with_typing_effect(text):
	text = str(text)
	for char in text:
		# Print one character at a time
		
		viewport.write(char)
		
		# Adjust the delay as needed for your desired speed
		#await(get_tree().create_timer(0.05), "timeout")
		await get_tree().create_timer(0.05).timeout
		#print()  # Move to the next line after printing the whole text
	#_viewport.welcome
	#add_child(_viewport)
	
	#_viewport.render_target_update_mode = Viewport.UPDATE_ALWAYS


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
