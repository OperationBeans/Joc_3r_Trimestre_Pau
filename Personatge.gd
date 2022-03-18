extends KinematicBody2D

var velocitat_base = 200
var velocitat = Vector2.ZERO
var gravetat = Vector2.DOWN * 980
var salt = Vector2.UP * 575

func _physics_process(delta):
	rotation_degrees = 180
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
