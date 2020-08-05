extends KinematicBody2D


var friction = false
const UP = Vector2(0, -1)
const MAX_SPEED = 300
const ACCELERATION = 60
var velocity = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


func _physics_process(delta):
	velocity.y += 10
	friction = false
	
	if Input.is_action_pressed("ui_left"):
		
		velocity.x = max(velocity.x - ACCELERATION, -MAX_SPEED)
		$Sprite.flip_h = true
		$Sprite.play("Run")
		
	elif Input.is_action_pressed("ui_right"):
		
		velocity.x = min(velocity.x + ACCELERATION, MAX_SPEED)
		$Sprite.flip_h = false
		$Sprite.play("Run")
	else:
		friction = true
		$Sprite.play("Idle")
	
	
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			velocity.y = -500
		if friction == true:
			velocity.x = lerp(velocity.x, 0, 0.4)
	else:
		if velocity.y < 0:
			$Sprite.play("Jump")
		else:
			$Sprite.play("Fall")
			
		if friction == true:
			velocity.x = lerp(velocity.x, 0, 0.6)	
				
		
	
	
	velocity = move_and_slide(velocity, UP)
	
	
	pass
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

