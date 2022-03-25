extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass 

func _on_Palanca_body_entered(body):
	var animacio = $AnimatedSprite
	animacio.play("OBERT")

