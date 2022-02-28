extends KinematicBody2D

export var speed =300 # The speed of the character
export var gravity = 20 # The gravity of the character
export var jumpforce = 450 # The jump force of the character

var coins = 0
var lives = 1

var motion = Vector2.ZERO 
var facing_right = true


func _physics_process(delta): 

	# Player movement functions:
	if Input.is_action_pressed("right"): 
		motion.x = speed # then the x coordinates of the vector be positive
		$MoveAudio.play()
	elif Input.is_action_pressed("left"): 
		motion.x = -speed # then the x coordinates of the vector be negative
		$MoveAudio.play()
	else: # If none of these are pressed
		motion.x = lerp(motion.x, 0, 0.25) # set the x to 0 by smoothly transitioning by 0.25
	
	if is_on_floor() or is_on_wall(): 
		if Input.is_action_just_pressed("jump"): # And the player hits the up arrow key
			$AnimationPlayer.play("jump")
			$JumpAudio.play()
			motion.y = -jumpforce # then jump by jumpforce
	
	motion.y += gravity + delta # Always make the player fall down
	
	motion = move_and_slide(motion, Vector2.UP)
	
	get_parent().get_node("Coins").text = str(coins)

	if lives == 0:
		get_tree().reload_current_scene()

func _on_windetect_body_entered(body):
	if "Player" in body.name:
		get_tree().reload_current_scene()


func _on_offscreen_body_entered(body):
	if "Player" in body.name:
		get_tree().reload_current_scene()


func _on_coin_body_entered(body):
	if "Player" in body.name:
		$CoinAudio.play()
		coins = coins + 1

func _on_Area2D_body_entered(body):
	if "Enemy" in body.name:
		lives -= 1
