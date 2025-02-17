extends RigidBody2D

var player

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#if abs(angular_velocity) < 25:
		if abs(angular_velocity) >= 0.1:
			get_tree().get_root().get_node('Main/Red_guy').global_position -= (global_position - get_tree().get_root().get_node('Main/Red_guy').global_position)/(get_tree().get_root().get_node('Main/Red_guy').global_position.distance_to(global_position))*abs(angular_velocity)/1.25
			print(angular_velocity)
	#elif angular_velocity > 25: 
		#angular_velocity = 25
	#elif angular_velocity < -25:
		#angular_velocity = -25

#func _on_clover_area_body_entered(body: Node2D) -> void:
	#player = body.get_parent().get_node('Red_guy')
	#print(player)
