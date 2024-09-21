extends RigidBody2D

var cae = 3

@warning_ignore("unused_parameter")
func _physics_process(delta):
	match cae:
		1: gravity_scale = 1
		2: gravity_scale = 5
		3: 
			gravity_scale = 0.1 
			rotation_degrees -= 2
		4: visible = false
	pass



func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("laser") or area.is_in_group("nave"):
		$Roca/AnimatedSprite2D.play("Explotion")
		
		var timer = get_tree().create_timer(1)
		await timer.timeout
		queue_free()
	pass # Replace with function body.
