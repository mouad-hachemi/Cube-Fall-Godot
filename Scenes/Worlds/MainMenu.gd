extends Node2D

func _ready():
	if $CenterContainer/VBoxContainer/Label:
		$CenterContainer/VBoxContainer/Label.text = "Your Score is: " + Global.high_score as String 


func _on_Button_pressed():
	get_tree().change_scene("res://Scenes/Worlds/World.tscn")
