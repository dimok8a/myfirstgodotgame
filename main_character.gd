extends CharacterBody2D

const speed = 100


func render_animation(move_left, move_down, move_up, move_right):
	var current_animation = "" 
	var diagonal_movement = (move_down or move_up) and (move_left or move_right)
	if (move_left):
		current_animation = "leftwalk"
	if (move_right):
		current_animation = "rightwalk"
	if (move_up && !diagonal_movement):
		current_animation = "upwalk"
	if (move_down && !diagonal_movement):
		current_animation = "downwalk"
	if (
		not (move_down or move_left or move_right or move_up)
		or (move_left and move_right) 
		or (move_up and move_down)
		):
		current_animation = "idle"
	$AnimatedSprite2D.play(current_animation)

func _physics_process(delta):
	var current_speed = speed
	var move_left = false
	var move_down = false
	var move_up = false
	var move_right = false
	if Input.is_action_pressed("ui_right"):
		move_right = true
	if Input.is_action_pressed("ui_left"):
		move_left = true
	if Input.is_action_pressed("ui_down"):
		move_down = true
	if Input.is_action_pressed("ui_up"):
		move_up = true
	
	var diagonal_movement = (move_down or move_up) and (move_left or move_right)

	if (!diagonal_movement):
		velocity.y = 0
		velocity.x = 0
	if (move_left): velocity.x = -1
	if (move_right): velocity.x = 1
	if (move_up): velocity.y = -1
	if (move_down): velocity.y = 1
	if (
		not (move_down or move_left or move_right or move_up) 
		or (move_left and move_right) 
		or (move_up and move_down)
		):
		velocity.x = 0
		velocity.y = 0
	velocity = velocity.normalized()
	velocity *= current_speed
	render_animation(move_left, move_down, move_up, move_right)
	move_and_slide()
