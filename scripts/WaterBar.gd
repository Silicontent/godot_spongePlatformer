extends CanvasLayer

onready var water_bar = $WaterBar
onready var pup_icon = $PUP_Icon


func _on_spongeWaterChanged(current_water_amt):
	water_bar.value = current_water_amt
	# updates debug labels on-screen
	$VariableLbl.text = str(current_water_amt)
	$BarLbl.text = str(water_bar.value)
