extends Node2D

export (Array, PackedScene) var platforms

var obj = null
var last_pos = Vector2.ZERO
var can_shuffle = false
var snaky_case = false
onready var spawn_timer = $Timer
# Called when the node enters the scene tree for the first time.
func _ready():
	_spawn_platforms()
	can_shuffle = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _spawn_platforms():
	if can_shuffle:
		platforms.shuffle()
	obj = platforms[0].instance()
	if snaky_case and last_pos == Vector2.ZERO:
		var dir = randi()%5
		match dir:
			0: obj.position = Vector2(-120,0)
			1: obj.position = Vector2(120,0)
			2: obj.position = Vector2(-120,0)
			3: obj.position = Vector2(120,0)
			4: obj.position = Vector2(-95,0)
	else:
		obj.position = Vector2(0,0)
	last_pos = obj.position
	add_child(obj)
	spawn_timer.start()




func _on_Timer_timeout():
	snaky_case = true
	_spawn_platforms()
































