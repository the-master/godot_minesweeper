extends Node
enum DIFFICULTIES{EASY,MEDIUM,EXPERT}

var current_dificulty = DIFFICULTIES.EASY

func board_size():
	match current_dificulty:
		DIFFICULTIES.EASY:
			return [8,8]
		DIFFICULTIES.MEDIUM:
			return [16,16]
		DIFFICULTIES.EXPERT:
			return [30,16]
func bomb_count():
	match current_dificulty:
			DIFFICULTIES.EASY:
				return 10
			DIFFICULTIES.MEDIUM:
				return 40
			DIFFICULTIES.EXPERT:
				return 99
func _ready():
	pass


	