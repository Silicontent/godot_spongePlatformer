extends Area2D

onready var id_num = $ID.text


func _on_powerUpEntered(body):
	if body.is_in_group("player"):
		var pup_id = int(id_num)
		
		match pup_id:
			0:
				body.pup_dj()
			1:
				body.pup_fire()
		
		print("Power-up ID: ", str(pup_id))
		queue_free()
