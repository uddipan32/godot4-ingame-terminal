@tool
extends Control
@onready var container = $Container
@onready var text_node = $Container/ConsoleText
@onready var console_input_node = $Container/ConsoleInput
@onready var prefix_symbol = $Container/Label

# ==== EXPORT ====
@export var welcome_message: String = "Welcome to NAPD Terminal \nType [color=#ffff66] [url=help]help[/url][/color] to get more information\n"
@export var prefix: String = "$/hello/>"
@export var prefix_color: Color = Color.WHITE

# ==== IMPORT ====
const command_handler = preload("./CommandHandler.gd")

# Called when the node enters the scene tree for the first time.
func _ready():
	
	#text_node.push_font_size(font_size)
	#prefix_symbol.add_theme_font_size_override("ingame_terminal_theme", 200)
	#console_input_node.add_theme_font_size_override(font_size)
	
	
	prefix_symbol.text = prefix
	get_node("Container/Label").set("theme_override_colors/font_color", prefix_color) 
	
	
	self.write_line(welcome_message)
	resize()

func _process(delta):
	resize()

# append string
func write(message):
	message = str(message)
	if self.text_node:
		self.text_node.append_text(message)

# print new line
func write_line(message = ''):
	message = str(message)
	#text_node.append_text()
	if self.text_node:
		self.text_node.append_text(message + '\n')
	
# clear terminal
func clear():
	if self.text_node:
		self.text_node.clear()	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func resize():
	var height = text_node.get_content_height() + 10
	var box = get_parent()
	#print(box.size)
	if box.size.y < height:
		height  = box.get_rect().size.x - 40
		#height = box.size_flags_vertical + box.get_parent().offset.y + 750
		#print(height)
	prefix_symbol.position.y = height - 15
	console_input_node.set_position(Vector2(prefix_symbol.size.x + 10,height-15))
	#text_node.rect_min_size.y = height
	#text_node.rect_max_size.y = height

func _on_console_input_text_submitted(input):
	self.write_line('[color=#'+ prefix_color.to_html() +']' + prefix + '[/color] ' + input)  # print input command
	var handler = command_handler.new()
	self.write(handler.validate_command(input)) # validate command
	# self.write_line(new_text)
