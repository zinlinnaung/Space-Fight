extends CharacterBody2D

@export var speed=400;
@onready var rocket_container=$RocketContainer
@onready var rocket_shot_sound=$RocketShotSound
var rscene=preload("res://scenes/rocket.tscn");
signal took_damage;

func _process(delta):
	if(Input.is_action_just_pressed("shoot")):
		shoot()

func _physics_process(delta):
	var screenSize=get_viewport_rect().size
	velocity=Vector2(0,0);
	if Input.is_action_pressed("move_right"):
		velocity.x=speed;
	elif Input.is_action_pressed("move_left"):
		velocity.x=-speed;
	elif Input.is_action_pressed("move_up"):
		velocity.y=-speed;
	elif Input.is_action_pressed("move_down"):
		velocity.y=speed;
	move_and_slide()
	global_position= global_position.clamp(Vector2(0,0),screenSize)


func shoot():
	rocket_shot_sound.play()
	var rocket_instance=rscene.instantiate()
	rocket_container.add_child(rocket_instance)
	rocket_instance.global_position=global_position;
	rocket_instance.global_position.x  +=50;
	

func take_damage():
	emit_signal("took_damage")

func die():
	queue_free()
