extends CollisionPolygon2D
class_name Clip
onready var ground = get_node("ground")

var polygon_object = null
func _ready() -> void:
	polygon_object =ground.polygon
	polygon = polygon_object

func clip_polygon_b(polygonB : PoolVector2Array):
	print(polygon_object)
	var polygons  = Geometry.clip_polygons_2d(polygon_object , polygonB)
	
	polygon_object = polygons[0]
	polygon = polygon_object
	ground.polygon =polygon_object
