extends CharacterBody2D

@export var SPEED = 100

var dir : float
var spawnPos : Vector2
var spawnRot : float
var can_detonate = true
var colliding = false
var frozen = false

func _ready() -> void:
	global_position.x = spawnPos.x
	global_position.y = spawnPos.y - 5
	look_at(get_global_mouse_position())
	rotate(1.5708)
	dir = rotation

func _physics_process(delta: float) -> void:
	if frozen == false:
		velocity.x = ($reference.global_position.x - global_position.x)/0.05
		velocity.y = ($reference.global_position.y - global_position.y)/0.05
		move_and_slide()
	
	if frozen == true:
		$AnimatedSprite2D.visible = false
		$bridge.visible = true
		$bridge.set_collision_layer_value(1, true)
		$bridge.set_collision_mask_value(1, true)
		
	if Input.is_action_just_pressed("ability") and Global.active_player == 'blue':
		self.queue_free()

func _on_other_detector_body_entered(body: Node2D) -> void:
	print('2')
	rotation_degrees = 0
	frozen = true


func _on_floor_ceiling_collision_detector_body_entered(body: Node2D) -> void:
	print('1')
	rotation_degrees = 90
	frozen = true
		


func _on_death_timer_timeout() -> void:
	self.queue_free()
