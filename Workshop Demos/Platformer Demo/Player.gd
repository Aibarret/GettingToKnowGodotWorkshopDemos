extends CharacterBody2D

@export
var speed = 500
@export
var gravity = 500
@export
var jump_height = 250


func _physics_process(delta):
	
	# Part 1
	
	# Apply Gravity!
	# because any object affected by gravity should be pulled down at all times,
	# to apply gravity all we need to do is apply a force to the y axis of the position!
	#Now, unless there's a platform holding it up, our player will fall to the ground!
	velocity.y += gravity * delta
	
	
	# Part 2
	
	# Now we need to implement movement!
	# This can often be done by checking if a certain key has been pressed:
	if Input.is_action_pressed("ui_left"):
		# If we want the character to move to the left, we should decrease it's X value by the speed
		velocity.x -= speed * delta
	elif Input.is_action_pressed("ui_right"):
		# And for the right we want to increase it's X value
		velocity.x += speed * delta
	else:
		# The character gets a little out of control when you move it, so lets make sure we stop that velocity 
		# when you let go of the button! 
		velocity.x = 0
		
	
	# Part 3
	
	# Now to add a jump!
	# all we really need to do here is check if our associated "jump" button was just pressed. 
	# Then we increase the Y velocity by whatever number we think fits best, after that grativy does the rest of the work!
	if Input.is_action_just_pressed("Jump"):
		# Don't mix up your positives and negatives! Negative is up for some god forsaken reason
		velocity.y -= jump_height
	
	# Part 4
	
	# Finally the move_and_slide() function will take the velocity we've been adjusting and move the 
	# object accordingly! the engine will pay attention to collisions with other objects on it's own too!
	move_and_slide()
	
	# Now you can play around with the variables as much as you want to see how it all affects the game!




