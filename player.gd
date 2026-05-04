extends CharacterBody2D
@export var speed = 300

func _physics_process(delta):
	var suunta = Input.get_axis("ui_left", "ui_right")
	velocity.x = suunta * speed
	move_and_slide()
