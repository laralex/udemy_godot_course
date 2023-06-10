extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_maze_body_exited(body:Node2D):
	if body == $UFO:
		get_tree().reload_current_scene()


func _on_finish_zone_body_entered(body:Node2D):
	if body == $UFO:
		$FinishSound.play()


