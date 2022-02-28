extends Area2D



func _ready():
	pass # Replace with function body.
	$AnimationPlayer.play("coinIdle")



func _on_coin_body_entered(body):
	if "Player" in body.name:
		queue_free()
