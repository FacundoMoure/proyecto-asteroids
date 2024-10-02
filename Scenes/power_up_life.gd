extends Node2D

var velocity = Vector2(0, 100) #Velocidad vertical negativa


func _physics_process(delta):
	position += velocity * delta
	if position.y > 800:
		queue_free()

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("nave"):
		$AudioStreamPlayer2D.play()
		$Area2D/CollisionPolygon2D.disabled
		$Sprite2D.visible = false
		var timer2 = get_tree().create_timer(2)
		await timer2.timeout
		queue_free()
	pass 
