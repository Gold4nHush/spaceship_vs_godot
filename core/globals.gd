extends Node

var points := 0
var lives := 3

func reset():
	points = 0
	lives = 3
	Events.points_changed.emit(points)
	Events.lives_changed.emit(lives)

func change_points(diff: int):
	points += diff
	Events.points_changed.emit(points)
	
func change_lives(diff: int):
	lives += diff
	Events.lives_changed.emit(lives)
