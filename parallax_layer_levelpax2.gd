extends ParallaxLayer

var SPEED = 420

func _process(delta: float) -> void:
	self.motion_offset.y += SPEED * delta
	pass
