extends Area2D


func _on_refuelAreaEntered(body):
	if body.is_in_group("player"):
		body.water_amt = 101.1
