extends CharacterBody2D

var pre_laser = preload("res://laser.tscn")
const SPEED = 500.0

@warning_ignore("unused_parameter")
func _physics_process(delta: float) -> void:
	Move()
	Shot()
	pass
	
func Move():
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = 0
	move_and_slide()
	pass
	
func Shot():
	var shot = true
	
	if Input.is_action_just_pressed("ui_accept") and shot:
		var laser = pre_laser.instantiate()
		get_parent().add_child(laser)
		laser.position.x = position.x - 6
		laser.position.y = position.y - 75
		shot = false
		await get_tree().create_timer(0.5).timeout
		shot = true
		pass
	pass


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("enemigo") or area.is_in_group("ufo"):
		$AnimationPlayer.play("Explotion")
		$Area2D/CollisionPolygon2D.disabled
		var timer2 = get_tree().create_timer(1.5)
		await timer2.timeout
		Global.naveDestruida = true  #Permite saber cuando se pierde, importante!

		queue_free()
	pass 
	
