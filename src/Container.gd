@tool
extends VBoxContainer
@onready var text_node = $ConsoleText
@onready var console_input_node = $ConsoleInput
@onready var prefix_symbol = $ConsoleInput/Label

# ==== EXPORT ====
@export var font_size = 24

# ==== IMPORT ====
const command_handler = preload("./CommandHandler.gd")

# Called when the node enters the scene tree for the first time.
func _ready():
	#text_node.push_font_size(font_size)
	#prefix_symbol.add_theme_font_size_override("ingame_terminal_theme", 200)
	#console_input_node.add_theme_font_size_override(font_size)
	
	self.write_line("Welcome to InGame Terminal \nType [color=#ffff66] [url=help]help[/url][/color] to get more information")
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
	if box.get_rect().size.y < height:
		height = box.size_flags_vertical + box.get_parent().offset.y + 75
		#print(height)
	console_input_node.set_position(Vector2(10,height-15))
	#text_node.rect_min_size.y = height
	#text_node.rect_max_size.y = height

func _on_ConsoleInput_text_entered(input):
	self.write_line('[color=#00ff00]$[/color] ' + input)  # print input command
	var handler = command_handler.new()
	self.write(handler.validate_command(input)) # validate command
	# self.write_line(new_text)
