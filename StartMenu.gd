extends Node2D

export var level_select: PackedScene

func _ready():
	pass # Replace with function body.

func _on_play_pressed():
	get_tree().change_scene_to(level_select)
func _on_store_pressed():
	get_tree().change_scene("res://store.tscn")

func _on_quite_pressed():
	get_tree().quit()
