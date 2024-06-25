extends CharacterBody2D

const speed = 100


func _physics_process(delta):
	var current_speed = speed
	var move_left = false
	var move_down = false
	var move_up = false
	var move_right = false
	if Input.is_action_pressed("ui_right"):
		#$AnimatedSprite2D.play("rightwalk")
		#velocity.x = speed
		move_right = true
		#velocity.y = 0
	if Input.is_action_pressed("ui_left"):
		#$AnimatedSprite2D.play("leftwalk")
		move_left = true
		#velocity.x = -speed
		#velocity.y = 0
	if Input.is_action_pressed("ui_down"):
		#$AnimatedSprite2D.play("downwalk")
		move_down = true
		#velocity.y = speed
		#velocity.x = 0
	if Input.is_action_pressed("ui_up"):
		#$AnimatedSprite2D.play("upwalk")
		#velocity.y = -speed
		move_up = true
		#velocity.x = 0
	
	var diagonal_movement = (move_down or move_up) and (move_left or move_right)
	if (diagonal_movement):
		current_speed = speed/2
		
	if (move_left):
		velocity.x = -current_speed
		$AnimatedSprite2D.play("leftwalk")
	if (move_right):
		velocity.x = current_speed
		$AnimatedSprite2D.play("rightwalk")
	if (move_up):
		velocity.y = -current_speed
		if (!diagonal_movement):
			$AnimatedSprite2D.play("upwalk")
	if (move_down):
		velocity.y = current_speed
		if (!diagonal_movement):
			$AnimatedSprite2D.play("downwalk")
	if (not (move_down or move_left or move_right or move_up)):
		$AnimatedSprite2D.play("idle")
		velocity.x = 0
		velocity.y = 0
	move_and_slide()
