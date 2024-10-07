extends StaticBody2D

const PADDLE_SPEED : float = 250.0
var paddle_height : float = 80.0

func _physics_process(delta: float) -> void:
	var viewport_rect : Rect2 = get_viewport_rect()
	var direction : float = Input.get_axis("UP", "DOWN")
	
	if direction != 0:
		position.y += direction * PADDLE_SPEED * delta
	
	position.y = clamp(position.y, paddle_height, viewport_rect.size.y - paddle_height)
