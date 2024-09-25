extends RigidBody2D

var cae = 3


func _physics_process(delta):
	match cae:
		1: gravity_scale = 1
		2: gravity_scale = 5
		3: 
			gravity_scale = 0.2 
			rotation_degrees -= 1
		4: visible = false
	pass


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("laser") or area.is_in_group("nave"):
		Global.score += 100
		
		$AnimationPlayer.play("Explotion")
		$Area2D/CollisionShape2D.disabled
		$Explosion.play()

		var timer2 = get_tree().create_timer(1)
		await timer2.timeout
		queue_free()
	pass 
