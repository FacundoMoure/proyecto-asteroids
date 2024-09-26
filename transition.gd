extends Control

func change_scene(target: String) -> void:
	$AnimationPlayer.play("screen_transition")
	await $AnimationPlayer.animation_finished
	get_tree().change_scene(target)
	#$AnimationPlayer.play_backwards("screen_transition")
