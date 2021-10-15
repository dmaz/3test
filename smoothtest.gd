extends Node2D

var tick:int = 0
var data:Array
var time:int
var zoom:int = 3

onready var size:int = get_viewport().size.x

func _ready() -> void:
	data.resize(size)
	for i in size:
		data[i] = Vector2(i,400-16*zoom)

	time = OS.get_system_time_msecs()


func _physics_process(delta: float) -> void:
	var frameTime = OS.get_system_time_msecs() - time
#	if tick > 500 and frameTime > 20: get_tree().quit()

	time = OS.get_system_time_msecs()
	tick += 1
	$Label.text = String(tick)
	data.append(Vector2(tick % size, 400-frameTime*zoom))
	data.pop_front()
	data[0] = Vector2(data[0].x, 50)
	data[0] = Vector2(data[1].x, 400)
	update()

func _draw() -> void:
	var points = PoolVector2Array(data)
	draw_multiline(points,Color.aliceblue)

