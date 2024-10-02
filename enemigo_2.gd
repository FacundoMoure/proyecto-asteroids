extends RigidBody2D

var cae = 3
var movimiento = Vector2()
var velocidad = 4

func _physics_process(delta):
	match cae:
		1: gravity_scale = 1
		2: gravity_scale = 5
		3: 
			gravity_scale = 0.1 
			rotation_degrees = 0
		4: visible = false
	pass
	
	
	move_and_collide(movimiento)
	set_vector(get_node("../Nave").global_position - global_position)
	
func set_vector(vector):
	movimiento = vector.normalized() * velocidad
	
	
func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("laser") or area.is_in_group("nave") or area.is_in_group("laser_2"):
		Global.score += 300
		
		$AnimationPlayer.play("Explotion")
		$Area2D/CollisionPolygon2D.disabled
		$Explosion.play()
		
		var timer2 = get_tree().create_timer(0.7)
		await timer2.timeout
		queue_free()
	pass 
