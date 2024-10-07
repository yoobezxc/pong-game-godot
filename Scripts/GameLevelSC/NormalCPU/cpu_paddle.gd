extends StaticBody2D

const PADDLE_SPEED : float = 250.0
const DEAD_ZONE : float = 40.0
var paddle_height : float = 80.0
@onready var ball : CharacterBody2D = $"../Ball"

func _physics_process(delta: float) -> void:
	var ball_y : float = ball.position.y
	var viewport_rect : Rect2 = get_viewport_rect()
	var distance_to_ball : float = ball_y - position.y
	
	if abs(distance_to_ball) > DEAD_ZONE:
		if ball_y > position.y:
			position.y += PADDLE_SPEED * delta
		elif ball_y < position.y:
			position.y -= PADDLE_SPEED * delta

	position.y = clamp(position.y, paddle_height, viewport_rect.size.y - paddle_height)
