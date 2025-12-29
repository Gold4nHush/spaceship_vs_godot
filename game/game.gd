extends Node2D

const GAME_OVER_SCENE = preload("res://UI/game_over/game_over.tscn")
const GAME_WIN_SCENE = preload("res://UI/game_win/game_win.tscn")

func _ready():
	Events.lives_changed.connect(func(lives): check_game_over())
	Events.enemy_died.connect(check_game_win)
		
func check_game_over():
	if Globals.lives <= 0:
		add_child(GAME_OVER_SCENE.instantiate())

func check_game_win():
	var enemies = get_tree().get_nodes_in_group("enemy")
	if enemies.size() <= 1:
		add_child(GAME_WIN_SCENE.instantiate())
