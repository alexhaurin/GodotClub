extends KinematicBody2D

var velocity = Vector2(0, 100)
var floorVector = Vector2(0, -1)
var gravity := 50.0
var maxGravity := 700.0
var jumpPower := 500.0
var maxSpeed := 300.0
var acceleration = 1000.0

func _ready():
	pass

func _physics_process(delta):
	velocity.y = min(velocity.y + gravity, maxGravity)
	
	if Input.is_action_pressed("ui_right"):
		velocity.x = min(velocity.x + acceleration * delta, maxSpeed)
	elif Input.is_action_pressed("ui_left"):
		velocity.x = max(velocity.x - acceleration * delta, -maxSpeed)
	
	if Input.is_action_pressed("ui_up"):
		velocity.y = min(velocity.y + jumpPower * delta, -jumpPower)
	
	velocity = move_and_slide(velocity, floorVector)
