tool
extends EditorPlugin

# TODO: Use add_control_to_container to allow Editor export of line meshes.

func _enter_tree():
	add_custom_type("Line3D","Spatial",preload("Line3D/Line3D.gd"),preload("Line3D/Line3D.svg"))
	add_custom_type("LinePath3D","Path",preload("LinePath3D/LinePath3D.gd"),preload("LinePath3D/LinePath3D.svg"))
	add_custom_type("Trail3D","Spatial",preload("Trail3D/Trail3D.gd"),preload("Trail3D/Trail3D.svg"))


func _exit_tree():
	remove_custom_type("Line3D")
	remove_custom_type("LinePath3D")
	remove_custom_type("Trail3D")
