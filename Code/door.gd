extends Area2D

var playerInArea = false

func _ready():
	connect("body_entered", self, "_on_player_enter")
	connect("body_exited", self, "_on_player_exit")
	connect("input_event", self, "_on_mouse_click")
	
func _on_player_enter(body):
	playerInArea = true
	print(body, " entered area")

func _on_player_exit(body):
	playerInArea = false
	print(body, " exited area")
		
func _on_mouse_click(viewport, event, shape_idx):
	if(playerInArea and event.is_pressed() and event.button_index == BUTTON_LEFT):
		print("GOTO new scene")
		get_tree().change_scene("res://Scenes/Hallway.tscn")