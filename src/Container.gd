extends VBoxContainer
onready var text_node = $ConsoleText
onready var console_input_node = $ConsoleInput
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

const command_handler = preload("./CommandHandler.gd")
# Called when the node enters the scene tree for the first time.
func _ready():
	self.write_line("Welcome to InGame Terminal \nType [color=#ffff66] [url=help]help[/url][/color] to get more information")
	resize()

func _process(delta):
	resize()

# append string
func write(message):
	message = str(message)
	if self.text_node:
		self.text_node.append_bbcode(message)

# print new line
func write_line(message = ''):
	message = str(message)
	if self.text_node:
		self.text_node.append_bbcode(message + '\n')
	
# clear terminal
func clear():
	if self.text_node:
		self.text_node.clear()	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func resize():
	var height = text_node.get_content_height()
	var box = get_parent()
	if box.get_rect().size.y < height:
		height = box.size_flags_vertical + box.get_parent().offset.y + 75
		#print(height)
	console_input_node.set_position(Vector2(10,height-15))
	#text_node.rect_min_size.y = height
	#text_node.rect_max_size.y = height




func _on_ConsoleInput_text_entered(input):
	self.write_line('[color=#00ff00]$[/color] ' + input)
	var handler = command_handler.new()
	self.write(handler.validate_command(input))
	#self.write_line(new_text)
