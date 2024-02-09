extends Area2D


func _on_area_entered(area):
	if "interfaces" in area: 
		if area.interfaces.any(func (i): return i.new() is Damagable):
			area.take_damage(20)
