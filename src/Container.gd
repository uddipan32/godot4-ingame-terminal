extends VBoxContainer
onready var text_node = $ConsoleText
onready var console_input_node = $ConsoleInput
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	resize()

func _process(delta):
	resize()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func resize():
	var height = text_node.get_content_height()
	var box = get_parent()
	if box.get_rect().size.y < height:
		height = box.size_flags_vertical + box.get_parent().offset.y + 75
		#print(height)
	console_input_node.set_position(Vector2(0,height-25))
	#text_node.rect_min_size.y = height
	#text_node.rect_max_size.y = height
