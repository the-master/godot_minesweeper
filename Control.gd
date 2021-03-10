extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$CenterContainer/Defeat.visible = GameState.defeat
	$CenterContainer/Victory.visible = GameState.victory # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	Util.goto_scene("MineSweeperMenu.tscn") # Replace with function body.
