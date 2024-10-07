extends Node2D

# Score Player 0, Score CPU 1 in Array
var score : Array = [0, 0]
@onready var player_score: Label = $UI/PlayerScore
@onready var cpu_score: Label = $UI/CPUScore
@onready var ball: CharacterBody2D = $Ball
@onready var player: StaticBody2D = $Player
@onready var cpu: StaticBody2D = $CPU

func _physics_process(_delta: float) -> void:
	player_score.text = str(score[0])
	cpu_score.text = str(score[1])
	handle_scene()

func handle_scene() -> void:
	if score[0] == 2:
		Global.load_scene(Global.game_over)
		score = [0, 0]
	elif score[1] == 2:
		Global.load_scene(Global.you_win)
		score = [0, 0]

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("EXIT"):
		Global.load_scene(Global.main_menu)

func _on_goal_player_body_entered(body: Node) -> void:
	if body.name == "Ball":
		_on_ball_timer_timeout()
		_on_paddle_timer_timeout()
		score[0] += 1

func _on_goal_cpu_body_entered(body: Node) -> void:
	if body.name == "Ball":
		_on_ball_timer_timeout()
		_on_paddle_timer_timeout()
		score[1] += 1

func _on_ball_timer_timeout() -> void:
	ball.default_ball()

func _on_paddle_timer_timeout() -> void:
	player.position = Vector2(80, 360)
	cpu.position = Vector2(1200, 360)
