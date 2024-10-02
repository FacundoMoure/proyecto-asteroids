extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$TransitionControl.visible = true
	$TransitionControl/AnimationPlayer.play("screen_transition")
	await $TransitionControl/AnimationPlayer.animation_finished
	$AnimationPlayer.play("credits1")
	$TextureRect2/Stars.play("new_animation")
	$TextureRect3/Stars2.play("stars")
	await get_tree().create_timer(25).timeout
	$TransitionControl/AnimationPlayer.play_backwards("screen_transition")
	await $TransitionControl/AnimationPlayer.animation_finished
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")
	$TransitionControl.visible = false
	pass
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

	#$AnimationPlayer.play("credits1")
	#$TextureRect2/Stars.play("new_animation")
	#$TextureRect3/Stars2.play("stars")
