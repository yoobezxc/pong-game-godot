extends StaticBody2D

const PADDLE_SPEED : float = 250.0
const DEAD_ZONE : float = 5.0
var paddle_height : float = 80.0
@onready var ball : CharacterBody2D = $"../Ball"

func _physics_process(delta: float) -> void:
	var predicted_ball_y : float = ball.position.y + (ball.velocity.y * 0.5)
	var viewport_rect : Rect2 = get_viewport_rect()
	
	if abs(predicted_ball_y - position.y) > DEAD_ZONE:
		if predicted_ball_y > position.y:
			position.y += PADDLE_SPEED * delta
		elif predicted_ball_y < position.y:
			position.y -= PADDLE_SPEED * delta
	
	position.y = clamp(position.y, paddle_height, viewport_rect.size.y - paddle_height)
