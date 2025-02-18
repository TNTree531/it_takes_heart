extends CharacterBody2D

var stasis = 0

var SPEED = 300.0
var JUMP_VELOCITY = -1200.0


func _physics_process(delta: float) -> void:
	
	if SPEED < 300:
		SPEED += 0.5
		
	handle_stasis()
	if stasis == 0:
		walk()
		jump()
		# Gravity
		if not is_on_floor():
			velocity += get_gravity() * (delta * 4 )
		else:
			SPEED = 300

	move_and_slide()
	
func _process(delta: float) -> void:
	if Input.is_action_just_pressed('recall'):
		if Global.last_player == 'red' and Global.active_player == 'purple':
			global_position.y = get_tree().get_root().get_node('Main/Purple_guy').global_position.y - 50
			global_position.x = get_tree().get_root().get_node('Main/Purple_guy').global_position.x

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
		
	


func _on_area_2d_area_entered(area: Area2D) -> void:
	if stasis == 1 or stasis == 2:
		stasis = 0


func _on_area_2d_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	if stasis == 1 or stasis == 2:
		stasis = 0
	if area.name == 'other_detector':
		print(area.get_parent().velocity)
		SPEED = 10
		velocity += 1.25 * (area.get_parent().velocity)
