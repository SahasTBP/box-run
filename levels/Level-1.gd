extends Node2D

export var win_scene: PackedScene

func _ready():
	pass # Replace with function body.

func _on_windetect_body_entered(body:Node):
	if "Player" in body.name:
		get_tree().change_scene_to(win_scene)
