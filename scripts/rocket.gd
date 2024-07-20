extends Area2D

@export var speed=300;
@onready var visiable_notifier=$VisiableNotifier;

func _ready():
	visiable_notifier.connect("screen_exited",_screen_exited)

func _physics_process(delta):
	global_position.x+=speed*delta;



func _screen_exited():
	queue_free()



func _on_area_entered(area):
	queue_free()
	area.die()
