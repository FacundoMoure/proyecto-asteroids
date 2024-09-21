extends ParallaxLayer

var SPEED = 35

func _process(delta: float) -> void:
	self.motion_offset.y += SPEED * delta
	pass
