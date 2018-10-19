extends KinematicBody2D

const GRAVITY_VEC = Vector2(0, 900)
const FLOOR_NORMAL = Vector2(0, -1)
const SLOPE_SLIDE_STOP = 25.0
const MIN_ONAIR_TIME = 0.1
const WALK_SPEED = 250 # pixels/sec
const JUMP_SPEED = 425
const SIDING_CHANGE_SPEED = 10

var linear_vel = Vector2()
var onair_time = 0
var on_floor = false

var anim=""

#cache the sprite here for fast access (we will set scale to flip it often)
onready var sprite = $Anim

func _physics_process(delta):
	# Increment counters
	onair_time += delta

	### MOVEMENT ###
	# Apply Gravity
	linear_vel += delta * GRAVITY_VEC
	# Move and Slide
	linear_vel = move_and_slide(linear_vel, FLOOR_NORMAL, SLOPE_SLIDE_STOP)
	# Detect floor
	if is_on_floor():
		onair_time = 0
		
	on_floor = onair_time < MIN_ONAIR_TIME
	
	### CONTROL ###
	# Horizontal Movement
	var target_speed = 0
	if Input.is_action_pressed("LEFT"):
		target_speed += -1
	if Input.is_action_pressed("RIGHT"):
		target_speed +=  1

	target_speed *= WALK_SPEED
	linear_vel.x = lerp(linear_vel.x, target_speed, 0.1)

	# Jumping
	if on_floor and Input.is_action_just_pressed("JUMP"):
		linear_vel.y = -JUMP_SPEED
		
	### ANIMATION ###
	var new_anim = "Idle"

	if on_floor:
		if linear_vel.x < -SIDING_CHANGE_SPEED:
			sprite.set_flip_h(true)
			new_anim = "Walk"

		if linear_vel.x > SIDING_CHANGE_SPEED:
			sprite.set_flip_h(false)
			new_anim = "Walk"
	else:
		# We want the character to immediately change facing side when the player
		# tries to change direction, during air control.
		# This allows for example the player to shoot quickly left then right.
		if Input.is_action_pressed("LEFT") and not Input.is_action_pressed("RIGHT"):
			sprite.set_flip_h(true)
		if Input.is_action_pressed("RIGHT") and not Input.is_action_pressed("LEFT"):
			sprite.set_flip_h(false)

		if linear_vel.y < 0:
			new_anim = "Jump"
		
		else:
			new_anim = "Walk"

	if new_anim != anim:
		anim = new_anim
		$Anim.play(anim)