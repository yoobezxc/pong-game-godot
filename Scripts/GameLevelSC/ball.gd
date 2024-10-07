extends CharacterBody2D

const ACCELERATION : float = 40.0
const START_SPEED : float = 400.0
const MAX_SPEED : float = 1000.0
var speed : float
var direction : Vector2 = Vector2(0.0, 0.0)
@onready var sfx_audio: AudioStreamPlayer = $"../SFXAudio"

func _physics_process(delta: float) -> void:
	var movement : Vector2 = direction * speed * delta
	var collision : KinematicCollision2D = move_and_collide(movement)
	
	if collision:
		direction = direction.bounce(collision.get_normal())
		speed += ACCELERATION
		speed = min(speed, MAX_SPEED)
		play_sfx()

func default_ball() -> void:
	position = get_viewport_rect().size / 2
	speed = START_SPEED
	direction = random_direction()

func random_direction() -> Vector2:
	var new_direction : Vector2
	new_direction.x = [1, -1].pick_random()
	new_direction.y = randf_range(-1, 1)
	
	if abs(new_direction.y) < 0.3:
		new_direction.y = sign(new_direction.y) * 0.3
	
	return new_direction.normalized()

func play_sfx() -> void:
	sfx_audio.play()
