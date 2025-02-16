extends CharacterBody2D

var stasis = 0

const SPEED = 300.0
const JUMP_VELOCITY = -900.0


func _physics_process(delta: float) -> void:
	handle_stasis()
	if stasis == 0:
		walk()
		jump()
	
		# Gravity
		if not is_on_floor():
			velocity += get_gravity() * (delta * 3 )
	move_and_slide()
	

func walk():
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
func jump():
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
func handle_stasis():
	if Input.is_action_just_pressed('red_ability'):
		if stasis == 1:
			stasis = 2
			velocity.y = 1000
		if stasis == 0:
			stasis = 1
			velocity.x = 0
			velocity.y = 0
	if stasis == 2 and is_on_floor() == true:
		stasis = 0
		velocity.y = JUMP_VELOCITY - 350
