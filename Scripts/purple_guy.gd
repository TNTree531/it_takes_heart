extends CharacterBody2D

@onready var scene = get_tree().get_root().get_node('Main')
@onready var projectile = load("res://Scenes/spade.tscn")

var stasis = 0

var SPEED = 300.0
var JUMP_VELOCITY = -1200.0

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	
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
		
	if Input.is_action_just_pressed('recall'):
		if Global.last_player == 'purple' and Global.active_player == 'red':
			global_position.y = get_tree().get_root().get_node('Main/Red_guy').global_position.y - 75
			global_position.x = get_tree().get_root().get_node('Main/Red_guy').global_position.x
		

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
		
func shoot():
	var instance = projectile.instantiate()
	instance.spawnPos = global_position
	scene.add_child.call_deferred(instance)
		


func _on_purple_area_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	if area.name == 'other_detector':
		if area.get_parent().can_detonate == true:
			print(area.get_parent().velocity)
			SPEED = 10
			velocity += 1.25 * (area.get_parent().velocity)
