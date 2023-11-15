@tool
extends Control

var viewport: Control = preload("../Console.tscn").instantiate()
@onready var container = $Container

# ==== EXPORT ====
@export var welcome_message: String = "Welcome to NAPD Terminal \nType [color=#ffff66] [url=help]help[/url][/color] to get more information\n"
@export var prefix: String = "$"
@export var prefix_color: Color = Color.WHITE
@export var readonly: bool = true

# @var  bool
#var consume_input = true
# Called when the node enters the scene tree for the first time.
func _ready():
	#var viewport = load("res://addons/godot4-ingame-terminal/src/Console.tscn").instantiate()
	#var aa = viewport.new()
	if viewport is Control:
		viewport.readonly = true
		viewport.welcome_message = welcome_message
		viewport.prefix = prefix
		viewport.prefix_color = Color.AQUA
		add_child(viewport)
		#viewport.set("welcome_message", "Hello")
		
		
		#print(get_node("Console/Container").welcome_message)
		#get_node("Console/Container").welcome_message = "hello"


# append string
func write(text):
	text = str(text)
	viewport.write(text)
	
func print_with_typing_effect(text: String, interval: float):
	text = str(text)
	var store_temp_text = false
	var temp_text = ""
	for char in text:
		if char == "[":
			store_temp_text = true
		if !store_temp_text:
			viewport.write(char)	
		if store_temp_text:
			temp_text = temp_text + char
		if char == "]":
			store_temp_text = false
			#temp_text = temp_text + ']'
			print(temp_text)
			viewport.write(temp_text)
			temp_text = ""
		
		
		
			
		# Print one character at a time
		
		
		# Adjust the delay as needed for your desired speed
		#await(get_tree().create_timer(0.05), "timeout")
		await get_tree().create_timer(interval).timeout
		#print()  # Move to the next line after printing the whole text
	#_viewport.welcome
	#add_child(_viewport)
	
	#_viewport.render_target_update_mode = Viewport.UPDATE_ALWAYS


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
