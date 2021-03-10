extends Control

func _ready():
	GameState.defeat = false
	GameState.victory= false 

func start_easy_game():
	GameState.current_dificulty = GameState.DIFFICULTIES.EASY
	Util.goto_scene("SweeperGame.tscn")

func start_medium_game():
	GameState.current_dificulty = GameState.DIFFICULTIES.MEDIUM
	Util.goto_scene("SweeperGame.tscn")
	
func start_expert_game():
	GameState.current_dificulty = GameState.DIFFICULTIES.EXPERT
	Util.goto_scene("SweeperGame.tscn")

