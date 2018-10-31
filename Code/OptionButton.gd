extends OptionButton

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
onready var dropdown = get_node("/root/Sprite/Button/OptionButton")

var commands = ["Left", "Right", "Jump"]
var picked = []

func _ready():
	add_items()

func add_items():
	dropdown.add_item("Left")
	dropdown.add_item("Right")
	dropdown.add_item("Jump")

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func _on_OptionButton_pressed():
	
	pass # replace with function body


func _on_OptionButton_item_selected(ID):
	picked.append(commands[ID])
	pass
