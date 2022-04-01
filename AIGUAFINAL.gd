extends Area2D

func _ready():
	pass 

func _on_hitbox_aigua_body_entered(body):
	$Timer2.start()
	modulate = Color(0.6,0.3,0.1)
	
func _on_hitbox_aigua_body_exited(body):
	modulate = Color(1,1,1)
	$Timer2.stop()

func _on_Timer2_timeout():
	$AIGUAFINAL.modulate = Color(1,0.2,0.2)
	
