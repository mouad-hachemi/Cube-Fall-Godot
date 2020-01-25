extends StaticBody2D

const SPEED = 256
var player_body = null
var move_dir:int
# Called when the node enters the scene tree for the first time.
#func _ready():
#	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.y += -SPEED * delta
	
	if player_body:
		player_body.position.x += move_dir * delta
	
	if position.y < -1000:
		queue_free()





func _on_Area2D_body_exited(body):
	if body.name == "Player":
		body.queue_free()
		get_tree().call_group("world","restart_game")


func _on_BreakArea_body_entered(body):
	if body.name == "Player":
		$BreakSprite.play("default")
		


func _on_BreakSprite_animation_finished():
	queue_free()


func _on_MoveLeft_body_entered(body):
	if body.name == "Player":
		move_dir = -120
		player_body = body


func _on_MoveLeft_body_exited(body):
	if body.name == "Player":
		player_body = null


func _on_MoveRight_body_entered(body):
	if body.name == "Player":
		move_dir = 120
		player_body = body


func _on_MoveRight_body_exited(body):
	if body.name == "Player":
		player_body = null
