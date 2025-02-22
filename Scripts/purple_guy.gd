extends CharacterBody2D

@onready var scene = get_tree().get_root().get_node('Main')
@onready var projectile = load("res://Scenes/spade.tscn")

var stasis = 0
var ontop_of = null
var in_range_of

var SPEED = 300.0
var JUMP_VELOCITY = -1200.0

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	handle_animation()
	stacked()
	if SPEED < 300:
		SPEED += 0.5
	
	walk()
	jump()
	# Gravity
	if not is_on_floor():
		velocity += get_gravity() * (delta * 4 )
	else:
			SPEED = 300
			
	move_and_slide()
	
			
func _process(delta: float) -> void:
	if Input.is_action_just_pressed('ability') and Global.active_player == 'purple':
		shoot()
		

func walk():
	if Global.active_player == 'purple':
		var direction := Input.get_axis("left", "right")
		if direction:
			velocity.x = direction * SPEED
		elif is_on_floor():
			velocity.x = move_toward(velocity.x, 0, SPEED)
	elif is_on_floor():
			velocity.x = move_toward(velocity.x, 0, SPEED)
	
func jump():
	if Global.active_player == 'purple':
		if Input.is_action_just_pressed("ui_accept") and is_on_floor():
			velocity.y = JUMP_VELOCITY
		
func shoot():
	var instance = projectile.instantiate()
	instance.spawnPos = global_position
	scene.add_child.call_deferred(instance)
		
func handle_animation():
	if ontop_of == null:
		if velocity.y < 0:
			$AnimatedSprite2D.play("jump")
		elif velocity.y > 0:
			$AnimatedSprite2D.play("fall")
		elif velocity.x > 0:
			$AnimatedSprite2D.play("run")
			$AnimatedSprite2D.flip_h = false
		elif velocity.x < 0:
			$AnimatedSprite2D.play("run")
			$AnimatedSprite2D.flip_h = true
		else:
			$AnimatedSprite2D.play("Idle")
	else:
		$AnimatedSprite2D.play("Idle")
		if Input.is_action_just_pressed("left"):
			$AnimatedSprite2D.flip_h = true
		elif Input.is_action_just_pressed("right"):
			$AnimatedSprite2D.flip_h = false

func _on_purple_area_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	if area.name == 'other_detector':
		if area.get_parent().can_detonate == true:
			print(area.get_parent().velocity)
			
			velocity += 1.25 * (area.get_parent().velocity)
	
			
func stacked():
	if ontop_of != null:
		global_position.x = ontop_of.global_position.x
		global_position.y = ontop_of.global_position.y -92
		
		if Input.is_action_just_pressed("throw") or Input.is_action_just_pressed('ui_accept'):
			ontop_of = null
			global_position.y += -5
			velocity.y += -1500
			if $AnimatedSprite2D.flip_h == true:
				velocity.x = -1000
			else:
				velocity.x = 1000
	if ontop_of == null and Input.is_action_just_pressed('throw'):
		if Global.active_player == 'red':
			if global_position.distance_to(get_tree().get_root().get_node('Main/Red_guy').global_position) < 96:
				ontop_of = get_tree().get_root().get_node('Main/Red_guy')
				print(ontop_of)
	
