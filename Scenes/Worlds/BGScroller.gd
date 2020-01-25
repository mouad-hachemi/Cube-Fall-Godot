extends Sprite


const SCROLL_SPEED = 95

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	region_rect.position.y += SCROLL_SPEED * delta
