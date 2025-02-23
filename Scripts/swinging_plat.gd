extends Area2D

var cart_position: Vector2
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	cart_position.x = $platform.position.x
	cart_position.y = $platform.position.y +300
	
	
	$Line2D.set_point_position(1, cart_position)
	
	
	if $platform.global_position.distance_to($hook.global_position) > 355:
		$platform.global_position += ($hook.global_position - $platform.global_position)/$platform.global_position.distance_to($hook.global_position)
		$platform.set_collision_layer_value(1, true)
	#elif $platform.global_position.distance_to($hook.global_position) < 252:
		#$platform.set_collision_layer_value(1, false)
		
	if $platform.global_position.distance_to(get_tree().get_root().get_node("Main/Red_guy").global_position) > 200:
		if $platform.global_position.distance_to(get_tree().get_root().get_node("Main/Purple_guy").global_position) > 200:
			if $platform.global_position.distance_to(get_tree().get_root().get_node("Main/Blue_guy").global_position) > 200:
				$platform.set_collision_layer_value(1, false)
	
func _on_area_entered(area: Area2D) -> void:
	$platform.set_collision_layer_value(1, true)
	
func _on_area_exited(area: Area2D) -> void:
	$platform.set_collision_layer_value(1, false)
