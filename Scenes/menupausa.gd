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
