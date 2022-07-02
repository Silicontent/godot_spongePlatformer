# This movement code is from https://kidscancode.org/godot_recipes/2d/platform_character/

extends KinematicBody2D

# sent to GUI to display water_amt
signal changed_water(current_water_amt)

const GRAV := 1300
const ACC := 0.15
const FRIC := 0.35

var water_amt := 100.0

var speed := 300
var jump_speed := -750
var velocity := Vector2.ZERO


# detects input and moves player accordingly
func movement():
	var dir = 0
	
	if Input.is_action_pressed("left"):
		dir -= 1
	if Input.is_action_pressed("right"):
		dir += 1
	
	if dir != 0:
		velocity.x = lerp(velocity.x, dir * speed, ACC)
		change_water(-0.1)
	else:
		velocity.x = lerp(velocity.x, 0, FRIC)


# used to change water_amt by a certain amount
func change_water(change_amt):
	water_amt += change_amt
	emit_signal("changed_water", water_amt)


# take a guess as to what this is
func _physics_process(delta):
	movement()
	
	velocity.y += GRAV * delta
	velocity = move_and_slide(velocity, Vector2.UP)
	
	if Input.is_action_just_pressed("jump"):
		if is_on_floor():
			velocity.y = jump_speed
			change_water(-0.5)
	
	if water_amt <= 0.0:
		queue_free()


# POWER-UP FUNCTIONS
func pup_dj():
	print("Double jump activated.")


func pup_fire():
	print("Fire activated.")
