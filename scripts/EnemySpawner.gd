extends Node2D
signal  enemy_spawned(enemy_instance)
signal  path_enenmy_spawned(path_enemy_instance)
var enemy=preload("res://scenes/enemy.tscn");
var path_enemy_scence=preload("res://scenes/path_enemy.tscn")
@onready var spawn_positions=$SpawnPositions

func _on_timer_timeout():
	spawn_enemy()


func spawn_enemy():
	var spawn_position=spawn_positions.get_children()
	var random_position=spawn_position.pick_random()
	var enemy_instance=enemy.instantiate();
	enemy_instance.global_position=random_position.global_position;
	emit_signal("enemy_spawned",enemy_instance)
	#add_child(enemy_instance);


func _on_timer_2_timeout():
	spawn_path_enemy()

func spawn_path_enemy():
	var path_enemy_instance=path_enemy_scence.instantiate()
	emit_signal("path_enenmy_spawned",path_enemy_instance)
