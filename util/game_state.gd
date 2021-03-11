extends Node
enum DIFFICULTIES{EASY,MEDIUM,EXPERT}

var current_dificulty = DIFFICULTIES.EASY
var victory 
var defeat
var high_scores = [[],[],[]]

func register_score(time):
	victory = true
	high_scores[current_dificulty].append(time)
	high_scores[current_dificulty].sort()
	
	
func is_high_score(difficulty,time):
	return high_scores[difficulty][0] <= time
func board_size():
	match current_dificulty:
		DIFFICULTIES.EASY:
			return Vector2(8,8)
		DIFFICULTIES.MEDIUM:
			return Vector2(16,16)
		DIFFICULTIES.EXPERT:
			return Vector2(30,16)
func easy_highscore_report():
	return _report(DIFFICULTIES.EASY)
func medium_highscore_report():
	return _report(DIFFICULTIES.MEDIUM)
func expert_highscore_report():
	return _report(DIFFICULTIES.EXPERT)
	
func _report(difficulty):
	if high_scores[difficulty].size() == 0:
		return ""
	var fill = "s" if high_scores[difficulty].size() > 1 else ""
	var rv = "Best Time" + fill + " so far:\n"
	for time in high_scores[difficulty]:
		rv +="\t"+ str(time) + "\n"
	return rv

func bomb_count():
	match current_dificulty:
			DIFFICULTIES.EASY:
				return 10
			DIFFICULTIES.MEDIUM:
				return 40
			DIFFICULTIES.EXPERT:
				return 99

func _ready():
	victory = false
	defeat = false


	
