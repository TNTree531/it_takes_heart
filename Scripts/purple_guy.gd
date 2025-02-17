extends CharacterBody2D

var stasis = 0

const SPEED = 300.0
const JUMP_VELOCITY = -1200.0


func _physics_process(delta: float) -> void:
	speed_check()
	if stasis == 0:
		walk()
		jump()
		# Gravity
		if not is_on_floor():
			velocity += get_gravity() * (delta * 4 )
			
		#set_collision_layer_value(2, true)
		#set_collision_mask_value(2, false)
	#else:
		#set_collision_layer_value(2, false)
		#set_collision_mask_value(2, true)
	move_and_slide()
	

func walk():
	if Global.active_player == 'purple':
		var direction := Input.get_axis("left", "right")
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
	else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
	
func jump():
	if Global.active_player == 'purple':
		if Input.is_action_just_pressed("ui_accept") and is_on_floor():
			velocity.y = JUMP_VELOCITY
		
		
func speed_check():
	if velocity.x >= 2500:
		velocity.x -= 250
	if velocity.y >= 2500:
		velocity.y -= 250
	if velocity.x <= -2500:
		velocity.x += 250
	if velocity.y <= -2500:
		velocity.y += 250
