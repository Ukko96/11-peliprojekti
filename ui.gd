extends CanvasLayer

@onready var score_label = $ScoreLabel
@onready var level_label = $LevelLabel
@onready var hp_label = $HealthLabel

func _ready():
	GameManager.score_updated.connect(_on_score_updated)
	GameManager.level_updated.connect(_on_level_updated)
	GameManager.player_hp_updated.connect(_on_player_hp_updated)
	
	_on_score_updated(GameManager.score)
	_on_level_updated(GameManager.level)
	_on_player_hp_updated(GameManager.player_hp)

func _on_score_updated(new_score):
	score_label.text = "Score: " + str(new_score)

func _on_level_updated(new_level):
	level_label.text = "Level: " + str(new_level)

func _on_player_hp_updated(new_hp):
	hp_label.text = "HP: " + str(new_hp)
