extends Control


@onready var score=$Score
@onready var life_left=$LivesLeft

func set_score_label(new_score):
	score.text="SCORE: "+str(new_score)


func set_live(new_live):
	life_left.text=str(new_live)
