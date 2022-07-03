extends Node2D

export (PackedScene) var Level_1
export (PackedScene) var Level_2

onready var player = $Sponge
onready var hud = $HUD
var end_level: Area2D


# TODO: investigate why "call_deferred()" is needed to prevent 100 errors
# TODO: E 0:00:01.024   get_global_transform: Condition "!is_inside_tree()" is true. Returned: get_transform()
func prepare_level(level):
	var l = level.instance()
	self.add_child(l)
	 
	player.global_position = l.get_node("PlayerStart").global_position


# TODO: clear old level while loading in new level, refactor func to optimize
func _on_levelEnded(id):
	var level_id = int(id)
	
	match level_id:
		1:
			prepare_level(Level_2)
		2:
			prepare_level(Level_1)
	
	print("Current Level ID: ", str(level_id))


func _ready():
	prepare_level(Level_1)
