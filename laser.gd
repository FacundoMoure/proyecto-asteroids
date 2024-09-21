extends CharacterBody2D

@warning_ignore("unused_parameter")
func _physics_process(delta: float) -> void:
	position.y -= 10
	pass

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
	pass 


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("enemigo"):

		
		queue_free()


	pass # Replace with function body.
