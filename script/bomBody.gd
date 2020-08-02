extends RigidBody2D

export(Color) var color;
onready var light = preload("res://VisualEffect1/scene/lighteffect.tscn")
func _ready() -> void:
	connect("body_entered",self, "body_enter")

func body_enter(body: Node )->void :

	if body.get_name() == "groundBody": 
		var _clip = body.get_node("groundPolygon")
		if _clip is Clip :
			print("clip poly")
			var pol = create_polygon(get_global_position(), 100, 50)
			_clip.clip_polygon_b(pol.polygon)
			queue_free()
			add_light()
			#pol.queue_free()
		

func create_polygon(center : Vector2 ,radius: float, count :int)-> Polygon2D:
	var polygon = PoolVector2Array()
	for i in range(0,count):
		var  deg = i * PI * 2 /  count
		var x =  center.x + radius  * cos(deg)
		var y =  center.y + radius * sin(deg)
		polygon.push_back(Vector2(x, y))
	
	var node_poly = Polygon2D.new()
	node_poly.polygon = polygon
	node_poly.color = Color(0,0,0,1)
	var par = get_parent().get_node("view/Viewport")#.add_child(node_poly)
	par.add_child(node_poly)
	return node_poly

func add_light():
	var _light = light.instance()
	_light.set_position(Vector2(get_position()))
	_light.z_index = 2
	var anim = _light.get_node("AnimationPlayer")
	anim.play("fadeout", 1)
	get_parent().add_child(_light)
