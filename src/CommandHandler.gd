class_name CommandHandler
extends Reference

var command_list = ["ipconfig", "aa", "a1"]
var command_json = {"ipconfig":"Welcome to Ubuntu 20.04.6 LTS (GNU/Linux 5.15.0-1036-lws x86_64)\n\n" + \
" * Documentation:  https://help.ubuntu.com\n" + \
" * Management:     https://landscape.canonical.com\n" + \
" * Support:        https://ubuntu.com/advantage\n\n" + \
"  System information as of Wed Aug 30 09:21:28 UTC 2023\n\n" + \
"  System load:  0.0               Processes:             108\n" + \
"  Usage of /:   44.0% of 7.57GB   Users logged in:       0\n" + \
"  Memory usage: 45%               IPv4 address for eth0: 111.21.44.208\n" + \
"  Swap usage:   0%\n\n" + \
"* Ubuntu Pro delivers the most comprehensive open source security and\n" + \
"  compliance features.\n\n" + \
"  https://ubuntu.com/aws/pro\n\n" + \
"Expanded Security Maintenance for Applications is not enabled.\n\n" + \
"47 updates can be applied immediately.\n" + \
"To see these additional updates run: apt list --upgradable\n\n" + \
"8 additional security updates can be applied with ESM Apps.\n" + \
"Learn more about enabling ESM Apps service at https://ubuntu.com/esm\n\n" + \
"*** System restart required ***\nLast login: Wed Jun 14 19:14:15 2023 from 10.216.17.208\nubuntu@ip-111-21-44-208:~$ ipconfig\n\n" + \
"Command 'ipconfig' not found, did you mean:\n\n  command 'ifconfig' from deb net-tools (1.60+git20181626.aebd88e-1ubuntu1)\n  command 'iconfig' from deb ipmiutil (3.1.5-1)\n" + \
"  command 'iwconfig' from deb wireless-tools (30~pre9-13ubuntu1)\n\nTry: sudo apt install <deb name>",
					"aa":"2nd command in list",
					"a1":"Last command"}
#func _init(command):
#	self.command_list = command_list
#	self.validate_command(command)
	
func validate_command(command):
	var output = ""
	var command_name = command.split(" ")[0]
	if command_name in self.command_list:
		output = str(command_json[command_name]) + "\n"
	else:
		output = "Command "+command+" doesn't exist\n"
	
	return output
