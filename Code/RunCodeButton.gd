extends Button

# class member variables go here, for example:
var submitted = false

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _on_Button_pressed():
	var submitted = true;
	print("Pressed")
	print(get_node("/root/Sprite/Button/OptionButton").get("picked"))