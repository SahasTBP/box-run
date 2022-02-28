extends Node2D

func _ready():
	pass # Replace with function body.
	$AnimationPlayer.play("winBG")

func _on_playagain_pressed():
	get_tree().change_scene("res://StartMenu.tscn")

func _on_quite_pressed():
	get_tree().quit()
