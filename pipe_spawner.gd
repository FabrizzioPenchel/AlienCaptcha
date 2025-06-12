extends Node2D


var pipe_scene: PackedScene = preload("res://Pipe.tscn") # <- ATENÇÃO ao caminho e maiúsculas/minúsculas

@export var spawn_interval: float = 1.5
var timer := 0.0

func _process(delta):
	timer += delta
	if timer > spawn_interval:
		timer = 0
		spawn_pipe()

func spawn_pipe():
	
	print("Valor de pipe_scene antes de instanciar: ", pipe_scene)
	var pipe = pipe_scene.instantiate()
	pipe.position = Vector2(1000, randf_range(100, 500)) 
	get_parent().add_child(pipe)
