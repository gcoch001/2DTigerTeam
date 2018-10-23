extends Button

# class member variables go here, for example:
# var a = 2
# var b = "textvar"



func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here

	pass

func _on_Button2_pressed():
	print("Onto intro choose character")
	get_tree().change_scene("res://Scenes/IntroChooseCharacter2.tscn")


#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

