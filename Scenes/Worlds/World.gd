extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var score = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("world")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func restart_game():
	Global.high_score = score
	get_tree().change_scene("res://Scenes/Worlds/LoseScene.tscn")


func _on_StaticBody2D_body_entered(body):
	if body.name == "Player":
		body.queue_free()
		restart_game()




func _on_ScoreTimer_timeout():
	score += 1
	$Control/Score.text = "Score:" + score as String
	$ScoreTimer.start()
