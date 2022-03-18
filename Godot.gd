extends Area2D
export var velocitat : int = 300
export var tamany = Vector2(0.5, 0.5)
var direccio = Vector2(0, 0)
var a = 1

func _ready():
	rotation_degrees = 0
	position = Vector2(500, 200)
	scale = tamany
func _process(delta):
	if  Input.is_action_pressed("mou_dreta"):
		direccio += Vector2.RIGHT
	if  Input.is_action_pressed("mou_esquerra"):
		direccio += Vector2.LEFT
	if Input.is_action_pressed("mou_endevant"):
		direccio += Vector2.UP
	if  Input.is_action_pressed("mou_enrrere"):
		direccio += Vector2.DOWN
	if Input.is_action_pressed("girar_angle"):
		tamany.x += 100
		tamany.y += 100
		rotation_degrees += 4
	position += direccio.normalized() * velocitat * delta
	direccio = Vector2.ZERO


func _on_Personatge_area_entered(area):
	for i in range(0,12,1):
		modulate = Color(0,1,0)
		scale += Vector2(0.01,0.01)
		rotation_degrees += 120

func _on_Personatge_area_exited(area):
	modulate = Color(1,1,1)
	scale += Vector2(0.01,0.01)
