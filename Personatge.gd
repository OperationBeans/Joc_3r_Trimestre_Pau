extends KinematicBody2D
var vida = 100
var dins = false
var velocitat_base = 200
var velocitat = Vector2.ZERO
var gravetat = Vector2.DOWN * 980
var salt = Vector2.UP * 450
var segons_dins = 0

func _physics_process(delta):
	velocitat.x = 0
	if Input.is_action_pressed("mou_dreta"):
		velocitat += Vector2.RIGHT * velocitat_base
	if Input.is_action_pressed("mou_esquerra"):
		velocitat += Vector2.LEFT * velocitat_base
	if Input.is_action_just_pressed("mou_endevant") and is_on_floor():
		velocitat += salt
	if Input.is_action_pressed("mou_enrrere"):
		velocitat += Vector2.DOWN * velocitat_base
	velocitat += gravetat * delta
	velocitat = move_and_slide(velocitat, Vector2.UP)
	anima(velocitat)
	if vida <=0 :
		print('Mort')
func anima(velocitat: Vector2):
	var animacio = $AnimatedSprite
	if velocitat.x > 0:
		animacio.flip_h = false
		animacio.play("camina")
	elif velocitat.x < 0:
		animacio.flip_h = true
		animacio.play('camina')
	
	if velocitat.y < -1:
		animacio.play("salta")
		
	if abs(velocitat.x) < 0.5:
		animacio.play('default')
	
func _on_Llanes_body_entered(body):
	modulate = Color(1, 0, 0)
	vida -= 20
func _on_Llanes_body_exited(body):
	modulate = Color(1, 1, 1)

func _on_Portal_abaix_body_entered(body):
	position = Vector2(240,140)

func _on_Portal_Dalt_body_entered(body):
	position = Vector2(860,300)




func _on_Area2D_body_entered(body):
	dins = true
	velocitat_base = 100
	segons_dins = 0
	modulate = Color(1,0.5,0)
	$Timer.start()
func _on_Timer_timeout():
	segons_dins += 1
	vida -= 50
	if segons_dins % 2 != 0:
		modulate = Color(1,1,1)
		velocitat_base = 200
	else:
		modulate = Color(1,0.5,0)
func _on_Area2D_body_exited(body):
	segons_dins = 0
	modulate = Color(1,1,1)
	dins = false
	$Timer.stop()

