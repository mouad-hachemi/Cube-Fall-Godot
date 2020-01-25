extends KinematicBody2D

const SPEED = 233
const GRAVITY = 560
var velocity = Vector2.ZERO
var left = false
var right = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_handle_input()
	_apply_gravity(delta)
	_move()
	if position.y > 854:
		get_tree().call_group("world","restart_game")


func _handle_input():
	var direction = -int(Input.is_action_pressed("ui_left") or left) + int(Input.is_action_pressed("ui_right") or right)
	velocity.x = direction * SPEED

func _move():
	velocity = move_and_slide(velocity,Vector2.UP)

func _apply_gravity(delta):
	velocity.y += GRAVITY * delta



func _on_Right_pressed():
	right = true


func _on_Right_released():
	right = false


func _on_Left_pressed():
	left = true


func _on_Left_released():
	left = false
