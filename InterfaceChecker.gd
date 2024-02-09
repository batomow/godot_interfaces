extends Node

func _ready():
	check_nodes(get_tree().current_scene)

#this is because Resource.get_resource_name is broken, this is an open bug in godot. 
func get_resource_name(resource:Resource):
	var path = resource.resource_path
	var extension = path.get_extension()
	return path.get_file().trim_suffix("."+extension)

func check_nodes(node:Node): 
	for child in node.get_children(): #this only happens if the node has children
		check_nodes(child)
	#this only happens once you go through all the children or if this node is a leaf node
	if "interfaces" in node: 
		for interface:Interface in node.interfaces: 
			var required_methods = interface.methods
			var implemented_methods = node.get_script().get_script_method_list().map(func (m): return m.name)
			for r in required_methods: 
				assert(r in implemented_methods, "Node " + node.name 
				+ " does not implement " + get_resource_name(interface) 
				+ " interface. Missing " + r + " method "
				)
