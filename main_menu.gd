extends Control

func _ready():
	GameState.defeat = false
	GameState.victory= false
	$VBoxContainer/CenterContainer/HBoxContainer/VBoxContainer/Beginner_Score.text = GameState.easy_highscore_report()
	$VBoxContainer/CenterContainer/HBoxContainer/VBoxContainer2/Intermediate_Score.text = GameState.medium_highscore_report()
	$VBoxContainer/CenterContainer/HBoxContainer/VBoxContainer3/Expert_Score.text = GameState.expert_highscore_report()

func start_easy_game():
	_start_with_difficulty(GameState.DIFFICULTIES.EASY)

func start_medium_game():
	_start_with_difficulty(GameState.DIFFICULTIES.MEDIUM)
	
func start_expert_game():
	 _start_with_difficulty(GameState.DIFFICULTIES.EXPERT)
	
func _start_with_difficulty(difficulty):
	GameState.current_dificulty = difficulty
	Util.goto_scene("mine_sweeper.tscn")
