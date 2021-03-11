extends Control

func _ready():
	GameState.defeat = false
	GameState.victory= false
	$VBoxContainer/CenterContainer/HBoxContainer/VBoxContainer/Beginner_Score.text = GameState.easy_highscore_report()
	$VBoxContainer/CenterContainer/HBoxContainer/VBoxContainer2/Intermediate_Score.text = GameState.medium_highscore_report()
	$VBoxContainer/CenterContainer/HBoxContainer/VBoxContainer3/Expert_Score.text = GameState.expert_highscore_report()

func start_easy_game():
	GameState.current_dificulty = GameState.DIFFICULTIES.EASY
	Util.goto_scene("SweeperGame.tscn")

func start_medium_game():
	GameState.current_dificulty = GameState.DIFFICULTIES.MEDIUM
	Util.goto_scene("SweeperGame.tscn")
	
func start_expert_game():
	GameState.current_dificulty = GameState.DIFFICULTIES.EXPERT
	Util.goto_scene("SweeperGame.tscn")

