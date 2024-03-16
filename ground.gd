@tool
extends StaticBody2D


@onready var polygon: Polygon2D = $Polygon2D
func _ready():
	if not Engine.is_editor_hint():
		var coll := CollisionPolygon2D.new()
		coll.polygon = polygon.polygon
		add_child(coll)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#if Engine.is_editor_hint():
		#var points := PackedVector2Array(polygon.polygon)
		#points.append(polygon.polygon[0])
		#$Line2D.points = points
