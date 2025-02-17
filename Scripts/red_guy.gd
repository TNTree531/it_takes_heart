extends CharacterBody2D

var stasis = 0

const SPEED = 300.0
const JUMP_VELOCITY = -1200.0


func _physics_process(delta: float) -> void:
	speed_check()
	handle_stasis()
	if stasis == 0:
		walk()
		jump()
		# Gravity
		if not is_on_floor():
			velocity += get_gravity() * (delta * 4 )

	move_and_slide()
	

func walk():
	if Global.active_player == 'red':
		var direction := Input.get_axis("left", "right")
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
	else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
		
		
func jump():
	if Global.active_player == 'red':
		if Input.is_action_just_pressed("ui_accept") and is_on_floor():
			velocity.y = JUMP_VELOCITY
		
func handle_stasis():
	if Input.is_action_just_pressed('ability'):
		if stasis == 1 and Global.active_player == 'red':
			stasis = 2
			velocity.y = 1600
		if stasis == 0 and Global.active_player == 'red':
			stasis = 1
			velocity.x = 0
			velocity.y = 0
	if stasis == 2 and is_on_floor() == true:
		stasis = 0
		velocity.y = JUMP_VELOCITY - 505
		
func speed_check():
	if velocity.x >= 2500:
		velocity.x -= 250
	if velocity.y >= 2500:
		velocity.y -= 250
	if velocity.x <= -2500:
		velocity.x += 250
	if velocity.y <= -2500:
		velocity.y += 250
