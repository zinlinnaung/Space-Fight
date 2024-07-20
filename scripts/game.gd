extends Node2D

var lives=3
var scores=0
var game_over_scene=preload("res://scenes/game_over_screen.tscn")
@onready var player=$Player
@onready var UI=$UI
@onready var hud=$UI/HUD
@onready var enemy_hit_sound=$EnemyHitSound
@onready var player_hit_sound=$PlayerHitSound
func _ready():
	hud.set_score_label(scores)
func _on_deadzone_area_entered(area):
	area.queue_free()


func _on_player_took_damage():
	player_hit_sound.play()
	lives-=1;
	hud.set_live(lives)
	if lives==0:
		player.die()
		await  get_tree().create_timer(1.5).timeout
		var game_over_instance=game_over_scene.instantiate()
		game_over_instance.set_score(scores)
		hud.add_child(game_over_instance)


func _on_enemy_spawner_enemy_spawned(enemy_instance):
	enemy_instance.connect("died",_on_enemy_died)
	add_child(enemy_instance)

func _on_enemy_died():
	scores+=100;
	hud.set_score_label(scores)
	enemy_hit_sound.play()


func _on_enemy_spawner_path_enenmy_spawned(path_enemy_instance):
	
	add_child(path_enemy_instance)
	path_enemy_instance.enemy.connect("died",_on_enemy_died)
