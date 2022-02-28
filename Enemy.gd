extends KinematicBody2D

var speed = 100
var gravity = 20

var coins = 0
var kills = 0

var motion = Vector2()

func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	motion.y += gravity + delta
	var Player = get_parent().get_node("Player")
	position += (Player.position - position)/50
	motion = move_and_slide(motion, Vector2.UP)


func move_right():
	motion.x = speed
func move_left():
	motion.x = -speed

func _on_enemytouch_body_entered(body):
	if "Player" in body.name:
		$EnemyAudio.play()
		
func _on_enemyKill_body_entered(body):
	if "Player" in body.name:
		kills += 1
		queue_free()
