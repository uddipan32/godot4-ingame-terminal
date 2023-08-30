class_name CommandHandler
extends Reference

var command_list = ["ab", "aa", "a1"]
var command_json = {"ab":"First command in list",
					"aa":"2nd command in list",
					"a1":"Last command"}
#func _init(command):
#	self.command_list = command_list
#	self.validate_command(command)
	
func validate_command(command):
	var output = ""
	var command_name = command.split(" ")[0]
	if command_name in self.command_list:
		output = command_name + "\n" + str(command_json[command_name]) + "\n"
	else:
		output = command_name + "\n" + "Command "+command+" doesn't exist\n"
	
	return output
