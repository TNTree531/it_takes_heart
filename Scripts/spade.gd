extends CharacterBody2D

@export var SPEED = 1000

var dir : float
var spawnPos : Vector2
var spawnRot : float
var bounced = false
var can_detonate = false
var colliding = false
var bounce_count = 0

func _ready() -> void:
	global_position = spawnPos
	look_at(get_global_mouse_position())
	rotate(1.5708)
	dir = rotation

func _physics_process(delta: float) -> void:
	velocity.x = ($reference.global_position.x - global_position.x)/0.025
	velocity.y = ($reference.global_position.y - global_position.y)/0.025
	move_and_slide()
	
	if bounce_count == 0:
		modulate.a -= 0.005
	elif bounce_count == 1:
		modulate.a -= 0.0125
	elif bounce_count == 2:
		modulate.a -= 0.025
	
	if modulate.a <= 0:
		self.queue_free()
		
func _on_trigger_timer_timeout() -> void:
	can_detonate = true
		

func _on_other_detector_body_entered(body: Node2D) -> void:
	if bounce_count >= 3:
		self.queue_free()
	if body.name != 'Purple_guy':
		rotation = -rotation
		bounce_count += 1

func _on_other_detector_area_entered(area: Area2D) -> void:
	if can_detonate == true or area.name != 'purple_area':
		self.queue_free()


func _on_floor_ceiling_collision_detector_body_entered(body: Node2D) -> void:
	if bounce_count >= 3:
		self.queue_free()
	if body.name != 'Purple_guy':
		rotate(3.14159)
		rotation = rotation * -1
		bounce_count += 1
