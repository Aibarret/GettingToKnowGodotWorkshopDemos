extends Sprite2D

# the amount of pixels between each space, if at some point we wanted to make each space bigger or
# smaller, we can change it here and the rest of the code wouldn't be affected.
var tile_size = 64

var reduced_position := Vector2(1,-1)

# before doing anything, we need to set up some stuff.
# up in the top left corner, click on project, Project Settings, then click on the Input Map tab
# on there, type in new input: "Up", "Down", "Left", and "Right" individually.
# after it shows up in the box below that, press the plus icon and enter the key you want it to refer to!
# to make things easy I recommend using the arrow keys.

# You now have set up custom controls that you can use in code!

# Now for the fun part!


func _process(delta):

# For starters, we need to know when the player hits the button we need:

# The point of tile based movement is for the player to move evenly, to accomplish this
# we can break it down into an easy to understand grid

	if Input.is_action_just_pressed("Up"):
		reduced_position.y -= 1
		# Don't mix your negatives! up = negative!
	
	if Input.is_action_just_pressed("Down"):
		reduced_position.y += 1
	
	if Input.is_action_just_pressed("Left"):
		reduced_position.x -= 1
	
	if Input.is_action_just_pressed("Right"):
		reduced_position.x += 1

# So now the position of our character works the same way you'd plot a point on a graph. 
# If someone were to hit the keys: Up, Up, right, Up, the resulting coordinate is pretty easy to parse, (1,-3)
# 
# But now we have some co-ordinates, but nothing that will work with the player.
# now we need to convert out positions to to the actual size of the board, by multiplying it by the size of a tile
# Lets call a little function I made to do that:
	position = verySmartAndCleverNumberConvertingMachine(reduced_position)

func verySmartAndCleverNumberConvertingMachine(position):
	return position * tile_size

