extends Node

signal score_updated(new_score)
signal level_updated(new_level)
signal player_hp_updated(new_hp)

var score: int = 0
var level: int = 1
var player_hp: int = 3
var enemies_killed_in_level: int = 0

func add_score_and_check_level(points: int):
	score += points
	enemies_killed_in_level += 1
	score_updated.emit(score)
	
	if enemies_killed_in_level >= 3:
		level_up()

func level_up():
	level += 1
	enemies_killed_in_level = 0
	level_updated.emit(level)
	get_tree().reload_current_scene()
	
func take_damage(amount: int = 1):
	player_hp -= amount
	player_hp_updated.emit(player_hp)
	
	if player_hp <= 0:
		# Mitä tapahtuu kun pelaaja kuolee? Nollataan peli.
		player_hp = 3
		score = 0
		level = 1
		enemies_killed_in_level = 0
		get_tree().reload_current_scene()
