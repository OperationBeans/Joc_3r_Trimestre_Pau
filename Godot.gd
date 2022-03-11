extends Sprite
export var velocitat : int = 300
export var tamany = Vector2(1, 1)
var direccio = Vector2(0, 0)

func _ready():
	rotation_degrees = 0
	position = Vector2(500, 200)
	scale = tamany
func _process(delta):
	position += direccio * velocitat * delta
	if  Input.is_action_pressed("mou_dreta"):
		direccio = Vector2(1,0)
	if  Input.is_action_pressed("mou_esquerra"):
		direccio = Vector2(-1,0)
	if  Input.is_action_pressed("mou_endevant"):
		direccio = Vector2(0,-1)
	if  Input.is_action_pressed("mou_enrrere"):
		direccio = Vector2(0,1)
	
