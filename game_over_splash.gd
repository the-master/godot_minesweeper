extends Control

func _ready():
	$CenterContainer/Defeat.visible = GameState.defeat
	$CenterContainer/Victory.visible = GameState.victory 

func _on_Timer_timeout():
	Util.goto_scene("main_menu.tscn") 
