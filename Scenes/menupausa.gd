extends Node2D

signal jugar
signal rejugar
signal salir

func _on_jugar_pressed():
	emit_signal ("jugar")
	pass

func _on_salir_pressed():
	get_tree().quit()
	pass

func _on_rejugar_pressed():
	emit_signal("rejugar")
	pass 

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Pause"):
		get_tree().paused = not get_tree().paused
		visible = get_tree().paused
		$ColorRect/GameOver.text = "Pause"
		
