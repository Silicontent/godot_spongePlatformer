extends Area2D


func _on_bodyEntered(body):
	if body.is_in_group("player"):
		var retrieved_id = int(get_parent().get_node("LevelID").text)
		body.get_parent()._on_levelEnded(retrieved_id)
		get_parent().queue_free()
