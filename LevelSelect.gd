extends Node2D

export var level_1: PackedScene
export var level_2: PackedScene
export var level_3: PackedScene
export var level_4: PackedScene
export var level_5: PackedScene

func _ready():
	pass # Replace with function body.

func _on_level01_pressed():
	get_tree().change_scene_to(level_1)
func _on_level02_pressed():
	get_tree().change_scene_to(level_2)
func _on_level03_pressed():
	get_tree().change_scene_to(level_3)
func _on_level04_pressed():
	get_tree().change_scene_to(level_4)
func _on_level05_pressed():
	get_tree().change_scene_to(level_5)

func _on_back_pressed():
	get_tree().change_scene("res://StartMenu.tscn")
