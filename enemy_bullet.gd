extends Area2D
@export var speed = 500

func _ready():
	body_entered.connect(_on_body_entered)

func _process(delta):
	position.y += speed * delta

func _on_body_entered(body):
	if body.name == "Player" or body.name == "player":
		if body.has_method("take_damage"):
			body.take_damage()
			queue_free()
