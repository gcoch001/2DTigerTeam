extends Area2D

var playerInArea = false

func _ready():
	# Player has entered the collisionShape2D
	connect("body_entered", self, "_on_player_enter")
	
	# Player has exited the collisionShape2D
	connect("body_exited", self, "_on_player_exit")
	
	# Player has clicked on the collisionShape2D
	connect("input_event", self, "_on_mouse_click")

func _on_player_enter(body):
	playerInArea = true
	print(body, " entered area")

func _on_player_exit(body):
	playerInArea = false
	print(body, " exited area")
		
func _on_mouse_click(viewport, event, shape_idx):
	# If player is in the area and the left mouse button is clicked
	if(playerInArea and event.is_pressed() and event.button_index == BUTTON_LEFT):
		print("GOTO new scene")
		
		# Change scene to display the hallway
		get_tree().change_scene("res://Scenes/OptionButtonTest.tscn")