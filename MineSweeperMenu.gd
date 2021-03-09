extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func start_easy_game():
	Globals.current_dificulty = Globals.DIFFICULTIES.EASY
	Util.goto_scene("SweeperGame.tscn")

func start_medium_game():
	Globals.current_dificulty = Globals.DIFFICULTIES.MEDIUM
	Util.goto_scene("SweeperGame.tscn")
func start_expert_game():
	Globals.current_dificulty = Globals.DIFFICULTIES.EXPERT
	Util.goto_scene("SweeperGame.tscn")
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
