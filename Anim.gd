extends AnimatedSprite

# class member variables:
# Variable used to track the direction of the character
var Direction = "Right"
var new_anim
onready var animationNode = get_node("Anim")

func _input(event):
	# Left button pressed move character left
	if(event.is_action("LEFT")):
		new_anim = "walk"
		if(Direction == "Right"):
			ChangeDirection()
		ChangeAnimation()
		self.position.x -= 2
		#new_anim = "idle"  -- currently doesn't work because animation swap happens too quick for walking animation to play
		#ChangeAnimation()     try implementing a velocity variable later and change this when velocity reaches a certain point
	# Right button pressed move character right
	elif(event.is_action("RIGHT")):
		new_anim = "walk"
		if(Direction == "Left"):
			ChangeDirection()
		ChangeAnimation()
		self.position.x += 2
	# Up button pressed move character up
	elif(event.is_action("UP")):
		new_anim = "walk"
		ChangeAnimation()
		self.position.y -= 2
	# Down button pressed move character down
	elif(event.is_action("DOWN")):
		new_anim = "walk"
		ChangeAnimation()
		self.position.y += 2

# Function used to change direction of the character
func ChangeDirection():
	if Direction == "Left":
		self.set_flip_h(false)
		Direction = "Right"
	elif Direction == "Right":
		self.set_flip_h(true)
		Direction = "Left"

# Function used to change between idle and walking animations
func ChangeAnimation():
	if(animation != new_anim):
		animation = new_anim
		self.play(animation)